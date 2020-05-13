import cffi
##########################################################################
####	create .so library from PYNQ python code for DTPU accelerator ######
##########################################################################

ffibuilder = cffi.FFI()

ffibuilder.cdef("""
extern "Python" {
void destroy_p(void * );
bool CopyFromBufferHandle_p(void);
bool CopyToBufferHandle_p(void);
void FreeBufferHandle_p(void);
bool SelectDataTypeComputation_p(int);
bool Init_p(int ,int,int);
bool Prepare_p(int,int ,int);
bool Invoke_p(int *,int,int*,int);
void  load_overlay(void);
bool ResetHardware_p(void);
void push_weight_to_heap( void  *,int *,int);
 };
  void * tflite_plugin_create_delegate();
  void tflite_plugin_destroy_delegate(void  *  );
  bool  SelectDataTypeComputation(int);""")



ffibuilder.set_source("dtpu_lib", r"""
#include <tensorflow/lite/c/c_api.h>
#include <tensorflow/lite/c/c_api_experimental.h>
#include <tensorflow/lite/context_util.h>
#include <vector>

static void destroy_p(void * delegate);
static bool CopyFromBufferHandle_p(void);
static bool CopyToBufferHandle_p(void); 
static void FreeBufferHandle_p(void);
static bool SelectDataTypeComputation_p(int);
static bool Init_p(int,int,int );
static bool Prepare_p(int, int,int );
static bool Invoke_p(int *,int,int*,int);
static void  load_overlay(void);
static bool ResetHardware_p(void);
static void push_weight_to_heap( void  *,int *,int);

/*
possible operations 
  kTfLiteBuiltinAdd = 0,
  kTfLiteBuiltinConcatenation = 2,
  kTfLiteBuiltinConv2d = 3,
  kTfLiteBuiltinDepthwiseConv2d = 4,
  kTfLiteBuiltinDepthToSpace = 5,
  kTfLiteBuiltinFullyConnected = 9,
  kTfLiteBuiltinMul = 18,
  kTfLiteBuiltinSub = 41,
  kTfLiteBuiltinDelegate = 51,
  kTfLiteBuiltinAddN = 106,
*/



namespace tflite{
  
 class TfLiteIntArrayView; 
}
extern "C" {
// This is where the execution of the operations or whole graph happens.
// The class below has an empty implementation just as a guideline
// on the structure.
class DTPU_delegate {
 public:
  // Returns true if my delegate can handle this type of op.
  static bool SupportedOp(const TfLiteRegistration* registration) {
  // from builtin_ops.h
  printf("[DEBUG - C]--- Supported Operation of DTPU delegate class --- \n");
    switch (registration->builtin_code) {
      case kTfLiteBuiltinConv2d:
      case kTfLiteBuiltinDepthwiseConv2d:
        printf("[DEBUG - C]--Hello world! I can make 2D convolution and depth wise 2D convolution---\n");
        return true;
      default:
        return false;
    }
  }

  // Any initialization code needed
  bool Init(TfLiteContext* context,const TfLiteDelegateParams* delegate_params) {
    printf("[DEBUG - C]--- Init of DTPU delegate class --- \n");
    // instantiate buffers and soft reset of accelerator 
    return Init_p(context->tensors_size,delegate_params->input_tensors->size ,delegate_params->output_tensors->size);
  }
  // Any preparation work needed (e.g. allocate buffers)
  TfLiteStatus Prepare(TfLiteContext* context, TfLiteNode* node) {
  printf("[DEBUG - C]--- Prepare of DTPU delegate class --- \n");
      // initialize, link the buffers accordint to the size of node data
// kTfLiteMmapRo  aka weights
    int i;
    int num_weight_tensor=0;
    TfLiteTensor tmp;
    for(i=0;i<context->tensors_size;i++){
        tmp=context->tensors[i];
      if(tmp.allocation_type==kTfLiteMmapRo){
      printf("[DEBUG -C]---found a tensor weight----\n");
        switch (tmp.type) {
          case kTfLiteFloat32 :
                  printf("[DEBUG-C]---- kTfLitefloat32 ------\n");
                //  push_weight_to_heap(tmp.data.f,tmp.dims->data,tmp.dims->size);
          case kTfLiteInt32 :
                  printf("[DEBUG-C]---- kTfLiteInt32 ------\n");
              //  push_weight_to_heap(tmp.data.i32,tmp.dims->data,tmp.dims->size);
          case kTfLiteUInt8 :
                            printf("[DEBUG-C]---- kTfLiteUint8 ------\n");
              push_weight_to_heap(tmp.data.uint8,tmp.dims->data,tmp.dims->size);
              num_weight_tensor++;
          case kTfLiteInt64 :
                printf("[DEBUG-C]---- kTfLiteInt64------\n");
                //push_weight_to_heap(tmp.data.i64,tmp.dims->data,tmp.dims->size);
          case kTfLiteString :
                  printf("[DEBUG-C]---- kTfLiteString ------\n");
                  //push_weight_to_heap(tmp.data.raw,tmp.dims->data,tmp.dims->size);
          case kTfLiteBool :
                            printf("[DEBUG-C]---- kTfLiteBool ------\n");
                //  push_weight_to_heap(tmp.data.b,tmp.dims->data,tmp.dims->size);
          case kTfLiteInt16 :
                    printf("[DEBUG-C]---- kTfLiteInt16 ------\n");
                  //push_weight_to_heap(tmp.data.i16,tmp.dims->data,tmp.dims->size);
          case kTfLiteComplex64 :
                            printf("[DEBUG-C]---- kTfLiteComplex64 ------\n");
                //  push_weight_to_heap(tmp.data.c64,tmp.dims->data,tmp.dims->size);
          case kTfLiteInt8 :
                      printf("[DEBUG-C]---- kTfLiteInt8 ------\n");
                    push_weight_to_heap(tmp.data.int8,tmp.dims->data,tmp.dims->size);
                    num_weight_tensor++;
          case kTfLiteFloat16 :
            printf("[DEBUG-C]---- kTfLiteF16 ------\n");
              //push_weight_to_heap(tmp.data.f16,tmp.dims->data,tmp.dims->size);
          default:  
            printf("[DEBUG -C]---- error no type for the weight ----\n");
        }
      
      
      }
    }
      if(Prepare_p(node->inputs->size,node->outputs->size,num_weight_tensor)){
      return kTfLiteOk;
      }
     return kTfLiteError ;

  }
  // Actual running of the delegate subgraph.
  TfLiteStatus Invoke(TfLiteContext* context, TfLiteNode* node) {
    printf("[DEBUG - C]--- Invoke of DTPU delegate class --- \n");
    // run inference on the delegate  and data transfer to/from memory/accelerator
    if(Invoke_p(node->inputs->data,node->inputs->size,node->outputs->data,node->outputs->size)){
      return kTfLiteOk;
      }
     return kTfLiteError ;
    
  }
   
};


   // use TfLiteType instead of int
  TfLiteStatus  SelectDataTypeComputation(int data_type ){
  printf("[DEBUG - C]--- SelectDataTypeComputation of DTPU delegate class --- \n");
  if(SelectDataTypeComputation_p(data_type)){
      return kTfLiteOk;
      }
     return kTfLiteError ;
  }  

  TfLiteStatus  ResetHardware( ){
  printf("[DEBUG - C]---  Reset underlaying hardware --- \n");
  if(ResetHardware_p()){
      return kTfLiteOk;
      }
     return kTfLiteError ;
    
  }  

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

  printf("[DEBUG - C] --- get delegate node registration function ---\n");
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
  printf("[DEBUG - C] ---- preparing the delegate ----\n");
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
  printf("[DEBUG - C]--- Do any cleanups---\n");
  FreeBufferHandle_p();
}


TfLiteStatus CopyToBufferHandle(TfLiteContext* context,
                                TfLiteDelegate* delegate,
                                TfLiteBufferHandle buffer_handle,
                                TfLiteTensor* tensor) {
  printf("[DEBUG - C]--- Copies data from tensor to delegate buffer if needed.----\n");
  if(CopyToBufferHandle_p()){
  return kTfLiteOk;
  }
  return kTfLiteError;
}

TfLiteStatus CopyFromBufferHandle(TfLiteContext* context,
                                  TfLiteDelegate* delegate,
                                  TfLiteBufferHandle buffer_handle,
                                  TfLiteTensor* tensor) {
  printf("[DEBUG - C]---Copies the data from delegate buffer into the tensor raw memory----\n");
  if(CopyFromBufferHandle_p()){
  return kTfLiteOk;
  }
  return kTfLiteError;  
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
  // load overlay
  load_overlay();

  printf("[DEBUG - C] ---the delegate method of DTPU is born---\n");
  return delegate;
}


void tflite_plugin_destroy_delegate(void  * delegate_op ) {
// destroy the delegate   
TfLiteDelegate * delegate= (TfLiteDelegate *) delegate_op;
printf("[DEBUG - C]-----cleaning memory  -> callback of python function---\n");
//destroy_p(delegate);
free(delegate);
}

}
""",source_extension=".cpp")


#if you want to simply access a global variable you just use its name.
# However to change its value you need to use the global keyword.

ffibuilder.embedding_init_code("""
from dtpu_lib import ffi
from pynq import Overlay
from pynq import allocate
from pynq import MMIO
from pynq import Xlnk
from pynq.lib import dma
import numpy as np
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
WMEM_STARTING_ADDRESS=0 #32 MSB 
##############################################
#### accelerator adapter command #############
##############################################
CMD_UPDATE_IN_ARDG=0x0
CMD_UPDATE_OUT_ARG=0x1
CMD_EXECUTE_STEP=0x2
CMD_EXECUTE_CONTINUOS=0x4
CMD_STOP_EXECUTE_CONTINOUS=0x5
##############################################
BASE_ADDRESS_INTC=0x40800000
ADDRESS_RANGE_INTC=0x10000
BASE_ADDRESS_DMA_INFIFO=0x40400000
ADDRESS_RANGE_DMA_INFIFO=0x10000
BASE_ADDRESS_DMA_WM=0x40410000
ADDRESS_RANGE_DMA_WM=0x10000
accelerator=None
input_fifo_buffer=None
output_fifo_buffer=None
weight_buffer=None
csr_buffer=None
overlay=None
driver_csr=None
driver_wm=None
driver_fifo_in=None
driver_fifo_out=None
#####################################
### DESIGN DEPENDENT DEFINITION #####
#####################################
WMEM_SIZE=131072
INFIFO_SIZE=2048
OUTFIFO_SIZE=2048
ROWS=8
COLUMNS=8
DATAWIDTH=64
curr_data_precision=INT8
size_tot=0
input_size=0
output_size=0
num_weight=0
global_iteration=0
global_iteration_shift_wm=[]
tensors=[]
class Tensor:
  def __init__(self,data, tot_dim,size_l):
    self.tot_dim=tot_dim
    self.data=data
    self.size_l=size_l
######################################
############ LOAD DESIGN #############
######################################
@ffi.def_extern()
def load_overlay():
  global accelerator 
  global overlay
  overlay = Overlay("/home/xilinx/pynqz2.bit") # tcl is also parsed
  overlay.download() # Explicitly download bitstream to PL
  if overlay.is_loaded():
   # Checks if a bitstream is loaded
   print("[DEBUG- PYTHON] ----overlay is loaded ----")
  else :
    print("[DEBUG- PYTHON] ---- overlay is not loaded----")
    exit(-1)
  accelerator=overlay.dtpu.axis_accelerator_ada
  ## soft reset
  accelerator.write(CTRL,0x0000001)
  accelerator.write(CTRL,0x0000000)
  accelerator.write(IARG_RQT_EN,0x000000007) ## all data avialable csr, weights and data
  accelerator.write(OARG_RQT_EN,1) # out fifo must be empty 
  accelerator.write(OARG_LENGTH_MODE,0) # hardware mode
  accelerator.write(ISCALAR_RQT_EN,0) # NO input SCALAR
  accelerator.write(OSCALAR_RQT_EN,0) # no output scalar
  accelerator.write(OARG0_TDEST,0) # only one output 

@ffi.def_extern()
def Init_p(tot_tensors,input_tens_size,output_tens_size): 
  global accelerator
  global overlay
  global size_tot
  global input_size
  global output_size
  print("[DEBUG - PYTHON] --- Init p function ---")
  overlay.reset()
  accelerator.write(CTRL,0x0000001)
  accelerator.write(CTRL,0x0000000)
  size_tot=tot_tensors
  print("[DEBUG-PYTHON]--- total tensors",size_tot,"---")
  input_size=input_tens_size
  print("[DEBUG-PYTHON]--- int tensors",input_size,"---")
  output_size=output_tens_size
  print("[DEBUG-PYTHON]--- out tensors",output_tens_size,"---")
  return True


@ffi.def_extern()
def SelectDataTypeComputation_p(data_type):
  global csr_buffer
  global curr_data_precision
  print("[DEBUG - PYTHON ] ---  SelectDataTypeComputation DTPU class ---")
  # modify the csr buffer 
  if csr_buffer is not None:
    if data_type!=0:
      csr_buffer[ARITHMETIC_PRECISION]= data_type
      if ((data_type)&0x0000ff)==INT8:
        curr_data_precision=8
    else:
      csr_buffer[ARITHMETIC_PRECISION]=   (NO_FP<<8)|(ACTIVATE_CHAIN<<4)| INT8
      curr_data_precision=INT8
      print("[DEBUG-PYTHON]----precision default 8 bit----")
  else:
    print("[DEBUG-PYTHON]----csr buffer does not exist! create before calling this function----")
  csr_buffer.flush()
  ################################################
  ###### program the dma for the csr reg #########
  ################################################
  print("[DEBUG-PYTHON]--- transfering csr buffer ----")
  driver_csr.sendchannel.transfer(csr_buffer)
  driver_csr.sendchannel.wait()
  

@ffi.def_extern()
def CopyFromBufferHandle_p():
  print("[DEBUG - PYTHON ] ---  the  from  delegate and buffers ---")
  return True

@ffi.def_extern()
def CopyToBufferHandle_p():
  print("[DEBUG - PYTHON ] --- copying  to  the delegate and buffers ---")
  return True
@ffi.def_extern()
def FreeBufferHandle_p():
  global input_fifo_buffer
  global output_fifo_buffer
  global csr_buffer
  global weight_buffer
  global driver_csr
  global driver_wm
  global driver_fifo_in
  global driver_fifo_out
  print("[DEBUG - PYTHON ] --- freeing buffers ---")
  input_fifo_buffer.freebuffer()
  output_fifo_buffer.freebuffer()
  csr_buffer.freebuffer()
  weight_buffer.freebuffer()
  del driver_csr
  del driver_wm
  del driver_fifo_in
  del driver_fifo_out
@ffi.def_extern()
def push_weight_to_heap(tensor,size,dim_size):
  global tensors
  #push the tensor to the heap for handling their transfefr in the Prepare_p
  tot_size=1
  tensor_i=ffi.cast("int *",tensor)
  size_i=size
  size_l=[]
  data_p=[]
  for i in range(dim_size):
    size_l.append(size[i])
    tot_size+=size[i]
  print(tot_size-1)
  for i in range (tot_size):
    data_p.append(tensor_i[i])
  tensors.append(Tensor(data_p,tot_size,size_l))

@ffi.def_extern()
def Prepare_p(input_size,output_size,weight_num):
  global input_fifo_buffer
  global output_fifo_buffer
  global weight_buffer
  global csr_buffer
  global overlay
  global driver_wm
  global driver_csr
  global driver_fifo_in
  global driver_fifo_out
  global num_weight
  global global_iteration
  global global_iteration_shift_wm
  global curr_data_precision
  global tensors
  print("[DEBUG - PYTHON ] --- Prepare p of DTPU class ---")
  print("[DEBUG - PYTHON ] --- in size",input_size,"output size",output_size," ---")
  #allocate buffers for data transfer
  num_weight=weight_num
  input_fifo_buffer = allocate(shape=(INFIFO_SIZE,),dtype='u8')
  output_fifo_buffer=allocate(shape=(INFIFO_SIZE,),dtype='u8')
  weight_buffer=allocate(shape=(WMEM_SIZE,),dtype='u8')
  csr_buffer=allocate(shape=(64,),dtype='u8')
  driver_wm=overlay.axi_dma_weight_mem
  driver_csr=overlay.axi_dma_csr_mem
  driver_fifo_in=overlay.axi_dma_infifo
  driver_fifo_out=overlay.axi_dma_outfifo
  #######################################################################
  ########### populate buffers pack depending on the precision  #########
  #######################################################################
  #get all tensors from the heap they will always be of 2 dims
  index=0
  iter=0
  for i in range(num_weight):
      tmp=tensors[i]
      shift=0
      for j in range (tmp.tot_dim):
        if(shift<int(64/curr_data_precision)):
          weight_buffer[index]|=np.uint8(tmp.data[j]<<(np.uint8(shift*curr_data_precision)))
          shift=shift+1
        else:
          index=index+1
          shift=0
          weight_buffer[index]|=np.uint8(tmp.data[j]<<(np.uint8(shift*curr_data_precision)))
        if index>=ROWS:
          iter=iter+1
          global_iteration_shift_wm.append(index)
  # calculate number of runs depending on the size of weight tensor
  global_iteration=iter
  ################################
  ###### transferring data #######
  ################################
  weight_buffer.flush()
  ################################################
  ###### program the dma for the weight ##########
  ################################################
  print("[DEBUG-PYTHON]--- transfering weight buffer ----")
  driver_wm.sendchannel.transfer(weight_buffer)
  driver_wm.sendchannel.wait()
  return True

@ffi.def_extern()
def destroy_p(delegate):
  global input_fifo_buffer
  global output_fifo_buffer
  global csr_buffer
  global weight_buffer
  print("[DEBUG - PYTHON ] --- destroying the delegate and buffers ---")
  input_fifo_buffer.freebuffer()
  output_fifo_buffer.freebuffer()
  csr_buffer.freebuffer()
  weight_buffer.freebuffer()
  if delegate is not None:
    del delegate

@ffi.def_extern()
def Invoke_p(in_data,in_data_size,out_data,out_data_size):
  global driver_csr
  global driver_wm
  global driver_fifo_in
  global driver_fifo_out
  global csr_buffer
  global weight_buffer
  global input_fifo_buffer
  global output_fifo_buffer
  global accelerator
  global global_iteration
  global global_iteration_shift_wm
  global curr_data_precision
  #######################################################################
  ########### populate buffers pack depending on the precision  #########
  #######################################################################
  tmp=[]
  for i in range(in_data_size):
    tmp.append(int(in_data[i]))
  index=0
  shift=0
  iter=int(in_data_size/(INFIFO_SIZE*(64/curr_data_precision)))
  iter_index=[]
  for j in range (in_data_size):
    if(shift<int(64/curr_data_precision)):
      input_fifo_buffer[index]|=np.uint8(tmp[j]<<(np.uint8(shift*curr_data_precision)))
      shift=shift+1
    else:
      index=index+1
      shift=0
      input_fifo_buffer[index]|=np.uint8(tmp[j]<<(np.uint8(shift*curr_data_precision)))
    if(index>=INFIFO_SIZE):
      break
  input_fifo_buffer.flush()
  ######################################################
  ###### program the dma for the in/out fifos ##########
  ######################################################   
  print("[DEBUG-PYTHON]--- transfering input buffer ----")
  driver_fifo_in.sendchannel.transfer(input_fifo_buffer)
  driver_fifo_in.sendchannel.wait()
  driver_fifo_out.recvchannel.transfer(output_fifo_buffer)

  for i in range (global_iteration):
    # modify inital starting value of weight 
    #prev=np.uint64(csr_buffer[ARITHMETIC_PRECISION] & 0x00000000FFFFFFFF)
    csr_buffer[ARITHMETIC_PRECISION]=np.uint64(((np.uint32(global_iteration_shift_wm[i] <<32)) | (np.uint32(csr_buffer[ARITHMETIC_PRECISION] &0xfffffffff)))
    csr_buffer.flush()
    for j in range(iter):
      #execute the inference and retrieve the data
      accelerator.write(CMD, (0x0000000 |(CMD_EXECUTE_STEP<<16))) # execute one step 
      while driver_fifo_out.recvchannel.running:
        pass
      for k in range(INFIFO_SIZE):
        input_fifo_buffer[i]=output_fifo_buffer[i]
      ## copy the rest of input 
      index=0
      shift=0
      for k in range (in_data_size-j*INFIFO_SIZE):
        if(shift<int(64/curr_data_precision)):
          input_fifo_buffer[index]|=np.uint8(tmp[k+j*INFIFO_SIZE]<<(np.uint8(shift*curr_data_precision)))
          shift=shift+1
        else:
          index=index+1
          shift=0
          input_fifo_buffer[index]|=np.uint8(tmp[k+j*INFIFO_SIZE]<<(np.uint8(shift*curr_data_precision)))
        if(k>=INFIFO_SIZE):
          break
      input_fifo_buffer.flush()
    for k in range(INFIFO_SIZE):
        input_fifo_buffer[i]=output_fifo_buffer[i]
  accelerator.write(STATUS,0x00000003)##clear status
  print("[DEBUG -PYTHON] ---- accelerator done ----")
  ################################################################################################
  ####### unpack the output buffer depending on the precision and give  it back to C code ########
  ################################################################################################
  for i in range(out_data_size):
    out_data[i]=output_fifo_buffer[i]
  return True

@ffi.def_extern()
def ResetHardware_p():
  global accelerator
  global overlay
  print("[DEBUG - PYTHON ] --- Reset hardware p function ---")
  overlay.reset()
  accelerator.write(CTRL,0x0000001)
  accelerator.write(CTRL,0x0000000)
  return True

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

