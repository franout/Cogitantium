import cffi
##########################################################################
####	create .so library from PYNQ python code for DTPU accelerator ######
##########################################################################

ffibuilder = cffi.FFI()

#ffibuilder.cdef("""
#    extern "Python" int f(int);
#    int my_algo(int);
#""")
#ffibuilder.set_source("_example_cffi", r"""
#    static int f(int);   /* the forward declaration */
#
#    static int my_algo(int n) {
#        int i, sum = 0;
#        for (i = 0; i < n; i++)
#            sum += f(i);     /* call f() here */
#        return sum;
#    }
#""")

    
#
#ffibuilder.cdef("""
#  class DTPU_delegate;
#  extern "Python" void prepare(int);
#    extern "Python" void invoke(void);
#    extern "Python" void get_data(void);
#    extern "Python" void transfer_data_p(void);



#ffibuilder.cdef("""
#bool Init(TfLiteContext* context,const TfLiteDelegateParams* delegate_params);
#TfLiteStatus Prepare(TfLiteContext* context, TfLiteNode* node) ;
#TfLiteStatus Invoke(TfLiteContext* context, TfLiteNode* node);
#    TfLiteRegistration GetMyDelegateNodeRegistration(void);
#  TfLiteStatus DelegatePrepare(TfLiteContext* context, TfLiteDelegate* delegate);
#  void FreeBufferHandle(TfLiteContext* context, TfLiteDelegate* delegate,TfLiteBufferHandle* handle); 
#  TfLiteStatus CopyToBufferHandle(TfLiteContext* context,TfLiteDelegate* delegate,TfLiteBufferHandle buffer_handle,TfLiteTensor* tensor);
#  TfLiteStatus CopyFromBufferHandle(TfLiteContext* context,TfLiteDelegate* delegate,TfLiteBufferHandle buffer_handle,TfLiteTensor* tensor) ;
#  TfLiteDelegate* CreateMyDelegate();
#""")


####  create .so library from PYNQ python code for DTPU accelerator ####




#ffibuilder.cdef("""typedef struct DTPU_delegate * Class;
#  extern "Python" void destroy_p(void * ); 
#void * tflite_plugin_create_delegate(char** argv , char** argv2, size_t argc, void (*report_error)(const char *)) ;
#
#  """) 
ffibuilder.cdef("""
extern "Python" void destroy_p(void * ); 
  void * tflite_plugin_create_delegate();
  void tflite_plugin_destroy_delegate(void  *  );""")

ffibuilder.set_source("dtpu_lib", r"""
#include <tensorflow/lite/c/c_api.h>
#include <tensorflow/lite/c/c_api_experimental.h>
#include <tensorflow/lite/context_util.h>
#include <vector>

static void destroy_p(void * delegate);


namespace tflite{
  
 class TfLiteIntArrayView; 
}
// This is where the execution of the operations or whole graph happens.
// The class below has an empty implementation just as a guideline
// on the structure.
class DTPU_delegate {
 public:
  // Returns true if my delegate can handle this type of op.
  static bool SupportedOp(const TfLiteRegistration* registration) {
    switch (registration->builtin_code) {
      case kTfLiteBuiltinConv2d:
        printf("i can make the conv2d\n");
      //case kTfLiteBuiltinMean:
        return true;
      default:
        return false;
    }
  }

  // Any initialization code needed
  bool Init(TfLiteContext* context,const TfLiteDelegateParams* delegate_params) {

    return true;
  }
  // Any preparation work needed (e.g. allocate buffers)
  TfLiteStatus Prepare(TfLiteContext* context, TfLiteNode* node) {
  printf("here");
    return kTfLiteOk;

  }
  // Actual running of the delegate subgraph.
  TfLiteStatus Invoke(TfLiteContext* context, TfLiteNode* node) {
    return kTfLiteOk;
  }
  // ... Add any other methods needed.
};



extern "C" {
// Create the TfLiteRegistration for the Kernel node which will replace
// the subgraph in the main TfLite graph.
TfLiteRegistration GetMyDelegateNodeRegistration() {
  // This is the registration for the Delegate Node that gets added to
  // the TFLite graph instead of the subGraph it replaces.
  // It is treated as a an OP node. But in our case
  // Init will initialize the delegate
  // Invoke will run the delegate graph.
  // Prepare for preparing the delegate.
  // Free for any cleaning needed by the delegate.

  TfLiteRegistration kernel_registration;
  kernel_registration.builtin_code = kTfLiteBuiltinDelegate;
  kernel_registration.custom_name = "DTPU_delegate";
  kernel_registration.free = [](TfLiteContext* context, void* buffer) -> void {
    delete reinterpret_cast<DTPU_delegate*>(buffer);
  };
  kernel_registration.init = [](TfLiteContext* context, const char* buffer,
                                   size_t) -> void* {
    // In the node init phase, initialize MyDelegate instance
    const TfLiteDelegateParams* delegate_params =
        reinterpret_cast<const TfLiteDelegateParams*>(buffer);
    DTPU_delegate* my_delegate = new DTPU_delegate;
    if (!my_delegate->Init(context, delegate_params)) {
      return nullptr;
    }
    return my_delegate;
  };
  kernel_registration.invoke = [](TfLiteContext* context,
                                   TfLiteNode* node) -> TfLiteStatus {
    DTPU_delegate* kernel = reinterpret_cast<DTPU_delegate*>(node->user_data);
    return kernel->Invoke(context, node);
  };
  kernel_registration.prepare = [](TfLiteContext* context,
                                    TfLiteNode* node) -> TfLiteStatus {
    DTPU_delegate* kernel = reinterpret_cast<DTPU_delegate*>(node->user_data);
    return kernel->Prepare(context, node);
  };

  return kernel_registration;
}

// TfLiteDelegate methods
// interface to tensorflow runtime
TfLiteStatus DelegatePrepare(TfLiteContext* context, TfLiteDelegate* delegate) {
  // Claim all nodes that can be evaluated by the delegate and ask the
  // framework to update the graph with delegate kernel instead.
  // Reserve 1 element, since we need first element to be size.
  std::vector<int> supported_nodes(1);
  TfLiteIntArray* plan;
  TF_LITE_ENSURE_STATUS(context->GetExecutionPlan(context, &plan));
  TfLiteNode* node;
  TfLiteRegistration* registration;
  for (int node_index : tflite::TfLiteIntArrayView(plan) ) {
    TF_LITE_ENSURE_STATUS(context->GetNodeAndRegistration(
        context, node_index, &node, &registration));
    if (DTPU_delegate::SupportedOp(registration)) {
      supported_nodes.push_back(node_index);
    }
  }
  // Set first element to the number of nodes to replace.
  supported_nodes[0] = supported_nodes.size() - 1;
  TfLiteRegistration my_delegate_kernel_registration =
      GetMyDelegateNodeRegistration();

  // This call split the graphs into subgraphs, for subgraphs that can be
  // handled by the delegate, it will replace it with a
  // 'my_delegate_kernel_registration'
  return context->ReplaceNodeSubsetsWithDelegateKernels(
      context, my_delegate_kernel_registration,
      reinterpret_cast<TfLiteIntArray*>(supported_nodes.data()), delegate);
}

void FreeBufferHandle(TfLiteContext* context, TfLiteDelegate* delegate,
                      TfLiteBufferHandle* handle) {
  // Do any cleanups.
  //free_buffer_p();

}


TfLiteStatus CopyToBufferHandle(TfLiteContext* context,
                                TfLiteDelegate* delegate,
                                TfLiteBufferHandle buffer_handle,
                                TfLiteTensor* tensor) {
  // Copies data from tensor to delegate buffer if needed.
  //transfer_data_p();
  return kTfLiteOk;
}

TfLiteStatus CopyFromBufferHandle(TfLiteContext* context,
                                  TfLiteDelegate* delegate,
                                  TfLiteBufferHandle buffer_handle,
                                  TfLiteTensor* tensor) {
  // Copies the data from delegate buffer into the tensor raw memory.
  //get_data();
  return kTfLiteOk;
}

// instantiate the delegate, it returns null if there is an error 
TfLiteDelegate * tflite_plugin_create_delegate() 
//char** argv , char** argv2, size_t argc, void (*report_error)(const char *) ) 
  {
  TfLiteDelegate* delegate = new TfLiteDelegate;

  delegate->data_ = nullptr;
  delegate->flags = kTfLiteDelegateFlagsNone;
  delegate->Prepare = &DelegatePrepare;
  // This cannot be null.
  delegate->CopyFromBufferHandle = &CopyFromBufferHandle;
  // This can be null.
  delegate->CopyToBufferHandle = &CopyToBufferHandle;
  // This can be null.
  delegate->FreeBufferHandle = &FreeBufferHandle;

  printf("the delegate method of DTPU is born\n");
  return delegate;
}


void tflite_plugin_destroy_delegate(void  * delegate_op ) {
// destroy the delegate   
TfLiteDelegate * delegate= (TfLiteDelegate *) delegate_op;
printf("cleaning memory  -> callback of python function\n");
destroy_p(delegate);
}

}

""",source_extension=".cpp")


ffibuilder.embedding_init_code("""
  from dtpu_lib import ffi 
  @ffi.def_extern()
  def destroy_p(delegate):
    print("destroying the delegate")
    del delegate
  """)

ffibuilder.compile(target="DTPU_delegate.*", verbose=True)



exit()

from cffi import FFI
ffi=FFI()
ffi.cdef("""
void * tflite_plugin_create_delegate();
void tflite_plugin_destroy_delegate(void  * );
  """)


#@ffi.def_extern()
#def destroy_p(delegate):
#  print("destroying the delegate")
#  del delegate
#
aa = ffi.dlopen("./DTPU_delegate.so")      




exit()




ffibuilder.embedding_init_code("""
#from pynq import allocate
from DTPU_delegate import ffi
#from pynq import Xlnk
#import tflite_runtime.interpreter as tflite
######################################### 
############ MEMORY MAP #################
#########################################
BASE_ADDRESS_ACCELERATOR=0x43C00000
ADDRESS_RANGE_ACCELERATOR=0x10000

# address reg offset 
CTRL =0x0000
STATUS =0x0004
IARG_RQT_EN =0x0010
OARG_RQT_EN =0x0014
CMD =0x0028 
OARG_LENGTH_MODE =0x003C 
ISCALAR_FIFO_RST =0x0040 
OSCALAR_FIFO_RST =0x0044 
ISCALAR_RQT_EN =0x0048 
OSCALAR_RQT_EN =0x004C 
ISCALAR0_DATA =0x0080 
ISCALAR1_DATA =0x0084 
ISCALAR2_DATA =0x0088 
ISCALAR3_DATA =0x008C 
ISCALAR4_DATA =0x0090 
ISCALAR5_DATA =0x0094 
ISCALAR6_DATA =0x0098 
ISCALAR7_DATA =0x009C
ISCALAR8_DATA =0x00A0
ISCALAR9_DATA =0x00A4
ISCALAR10_DATA=0x00A8
ISCALAR11_DATA =0x00AC
ISCALAR12_DATA =0x00B0
ISCALAR13_DATA =0x00B4
ISCALAR14_DATA =0x00B8
ISCALAR15_DATA =0x00BC
OSCALAR0_DATA =0x00C0
OSCALAR1_DATA =0x00C4
OSCALAR2_DATA =0x00C8
OSCALAR3_DATA =0x00CC
OSCALAR4_DATA =0x00D0
OSCALAR5_DATA =0x00D4
OSCALAR6_DATA =0x00D8
OSCALAR7_DATA =0x00DC
IARG0_STATUS =0x0100
IARG1_STATUS =0x0104
IARG2_STATUS =0x0108
IARG3_STATUS =0x010C
IARG4_STATUS =0x0110
IARG5_STATUS =0x0114
IARG6_STATUS =0x0118
IARG7_STATUS =0x011C
OARG0_STATUS =0x0140
OARG1_STATUS =0x0144
OARG2_STATUS =0x0148
OARG3_STATUS =0x014C
OARG4_STATUS =0x0150
OARG5_STATUS =0x0154
OARG6_STATUS =0x0158
OARG7_STATUS =0x015C
ISCALAR0_STATUS =0x0180
ISCALAR1_STATUS =0x0184
ISCALAR2_STATUS =0x0188
ISCALAR3_STATUS =0x018C
ISCALAR4_STATUS =0x0190 
ISCALAR5_STATUS =0x0194 
ISCALAR6_STATUS =0x0198 
ISCALAR7_STATUS =0x019C 
ISCALAR8_STATUS =0x01A0 
ISCALAR9_STATUS =0x01A4 
ISCALAR10_STATUS =0x01A8 
ISCALAR11_STATUS =0x01AC 
ISCALAR12_STATUS =0x01B0 
ISCALAR13_STATUS =0x01B4 
ISCALAR14_STATUS =0x01B8 
ISCALAR15_STATUS =0x01BC 
OSCALAR0_STATUS =0x01C0 
OSCALAR1_STATUS =0x01C4 
OSCALAR2_STATUS =0x01C8 
OSCALAR3_STATUS =0x01CC 
OSCALAR4_STATUS =0x01D0 
OSCALAR5_STATUS =0x01D4 
OSCALAR6_STATUS =0x01D8 
OSCALAR7_STATUS =0x01DC 
OSCALAR8_STATUS =0x01E0 
OSCALAR9_STATUS =0x01E4 
OSCALAR10_STATUS =0x01E8 
OSCALAR11_STATUS =0x01EC 
OSCALAR12_STATUS =0x01F0 
OSCALAR13_STATUS =0x01F4 
OSCALAR14_STATUS =0x01F8 
OSCALAR15_STATUS =0x01FC 
OARG0_LENGTH =0x0200 
OARG1_LENGTH =0x0204 
OARG2_LENGTH =0x0208 
OARG3_LENGTH =0x020C 
OARG4_LENGTH =0x0210 
OARG5_LENGTH =0x0214 
OARG6_LENGTH =0x0218 
OARG7_LENGTH =0x021C 
OARG0_TDEST =0x0240 
OARG1_TDEST =0x0244 
OARG2_TDEST =0x0248 
OARG3_TDEST =0x024C 
OARG4_TDEST =0x0250 
OARG5_TDEST =0x0254 
OARG6_TDEST =0x0258 
OARG7_TDEST =0x025C 
#####################################################
##########       CSR DEFINITIONS           ##########
##########          MEMORY MAP             ##########
##########          bitwidth 8             ##########
##########          see csr_definition.vh  ##########
#####################################################
ARITHMETIC_PRECISION=0
FP_MODE=1
BATCH_SIZE=2 # aka active rows
TRANSPARENT_DELAY_REGISTER=3
DEBUG=4
TEST_OPTIONS=5	
ACTIVATE_CHAIN=0x1
INT8=0x1
INT16=0X03
INT32=0x07
INT64=0x0F
# precision of fp computation is tuned using the 
# integer precision 
ACTIVE_FP=1<<0
ACTIVE_BFP=0x03
ROUNDING=0x00
NO_FP=0x00
##############################################
BASE_ADDRESS_INTC=0x40800000
ADDRESS_RANGE_INTC=0x10000
BASE_ADDRESS_DMA_INFIFO=0x40400000
ADDRESS_RANGE_DMA_INFIFO=0x10000
BASE_ADDRESS_DMA_WM=0x40410000
ADDRESS_RANGE_DMA_WM=0x10000
WMEM_SIZE=0
INFIFO_SIZE=0
OUTFIFO_SIZE=0
DATAWIDTH=0
accelerator=None
input_fifo_buffer=None
output_fifo_buffer=None
csr_buffer=None
weight_buffer=None

def Init(): 
	WMEM_SIZE=WMEM_SIZE
  #(WMEM_SIZE,INFIFO_SIZE,OUTFIFO_SIZE,DATAWIDTH,accelerator_from_overlay):
	INFIFO_SIZE=INFIFO_SIZE
	OUTFIFO_SIZE=OUTFIFO_SIZE
	DATAWIDTH=DATAWIDTH
	accelerator=accelerator_from_overlay 
	accelerator.write(CTRL,0x0000001)
	accelerator.write(CTRL,0x0000000)
@ffi.def_extern()
def select_data_type(data_type):
	# modify the csr buffer 
	if csr_buffer is not None:
		csr_buffer[ARITHMETIC_PRECISION]=   (NO_FP<<8)|(ACTIVATE_CHAIN<<4)| INT8
	print("precision default 8 bit")


def Prepare():
	#allocate buffers for data transfer
	input_fifo_buffer = allocate(shape=(2048,),dtype='u8')
	output_fifo_buffer=allocate(shape=(2048,),dtype='u8')
	weight_buffer=allocate(shape=(2048,),dtype='u8')
	csr_buffer=allocate(shape=(1024,),dtype='u8')


def Invoke():
	csr_buffer.flush()
	weight_buffer.flush()
	input_fifo_buffer.flush()
	################################################
	###### program the dma for the csr reg #########
	################################################
	if 'driver_csr' in locals():
		driver_csr.sendchannel.stop()
		driver_csr.sendchannel.start()
	else: 
		driver_csr=overlay.axi_dma_csr_mem
	driver_csr.sendchannel.transfer(csr_buffer)
	driver_csr.sendchannel.wait()
	################################################
	###### program the dma for the weight ##########
	################################################
	if 'driver_wm' in locals():
		driver_wm.sendchannel.stop()
		driver_wm.sendchannel.start()
	else:
		driver_wm=overlay.axi_dma_weight_mem
	driver_wm.sendchannel.transfer(weight_buffer)
	driver_wm.sendchannel.wait()
	######################################################
	###### program the dma for the in/out fifos ##########
	######################################################
	if not('driver_fifo_in' in locals()):
			driver_fifo_in=overlay.axi_dma_infifo
	driver_fifo_in.sendchannel.transfer(input_fifo_buffer)
	driver_fifo_in.sendchannel.wait()
	if not('driver_fifo_out' in locals()):
		driver_fifo_out=overlay.axi_dma_outfifo
		driver_fifo_out.recvchannel.transfer(output_fifo_buffer)
	#execute the inference and retrieve the data
	CMD_UPDATE_IN_ARDG=0x0
	CMD_UPDATE_OUT_ARG=0x1
	CMD_EXECUTE_STEP=0x2
	CMD_EXECUTE_CONTINUOS=0x4
	CMD_STOP_EXECUTE_CONTINOUS=0x5
	accelerator.write(IARG_RQT_EN,0x000000007) ## all data avialable csr, weights and data
	accelerator.write(OARG_RQT_EN,1) # out fifo must be empty 
	accelerator.write(OARG_LENGTH_MODE,0) # hardware mode
	accelerator.write(ISCALAR_RQT_EN,0) # NO input SCALAR
	accelerator.write(OSCALAR_RQT_EN,0) # no output scalar
	accelerator.write(OARG0_TDEST,0) # only one output 
	accelerator.write(CMD, (0x0000000 |(CMD_EXECUTE_STEP<<16))) # execute one step 
	while driver_fifo_out.recvchannel.running:
		pass
	accelerator.write(STATUS,0x00000003)##clear status
	print("accelerator done")
def SupportedOp():
	printf("accelerator onyl support 2d convolution")
	return False


def clean(self):
	self.input_fifo_buffer.close()
	self.output_fifo_buffer.close()
	self.csr_buffer.close()
  self.weight_buffer.close()

""")



exit()