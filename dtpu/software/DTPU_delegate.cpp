/// release dependent libraries tensorflow r2.1
#include <tensorflow/lite/c/builtin_op_data.h>
#include <tensorflow/lite/c/c_api_internal.h>
#include <tensorflow/lite/builtin_ops.h>
#include <tensorflow/lite/context_util.h>
#include <tensorflow/c/c_api.h>
#include <vector>
#include <time.h>
#define DEBUG 1

static bool destroy_p(void );
static bool CopyFromBufferHandle_p(void);
static bool CopyToBufferHandle_p(void); 
static void FreeBufferHandle_p(void);
static bool SelectDataTypeComputation_p(int);
static bool Init_p(int,int,int );
static bool Prepare_p(int );
static bool Invoke_p(bool);
static void load_overlay(void);
static bool ResetHardware_p(void);
static void push_weight_to_heap( void  *,int *,int);
static void push_input_tensor_to_heap( void  *,int *,int);
static void push_output_tensor_to_heap( void  *,int *,int);
static bool print_power_consumption_p(void);
static bool start_power_consumption(void);
static void activate_time_probe_p (bool);
static bool print_python_time_probes(void);


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
  kTfLiteBuiltinAddN = 106,struct timespec ts_start,ts_end;
*/


int bit_width_computation;
int NO_FP=-1;
bool signed_computation=false;
bool only_con2d=false;

// time probes
bool time_probe=false;
int n_execution=0;
double avg_time_delegate;
double avg_time_data_exchange;


using namespace tflite;
  
#ifdef __cplusplus
extern "C" {
#endif
// This is where the execution of the operations or whole graph happens.
// The class below has an empty implementation just as a guideline
// on the structure.
class DTPU_delegate {
 public:
  // Returns true if my delegate can handle this type of op.
  static bool SupportedOp(const TfLiteRegistration* registration) {
  // from builtin_ops.h
  #ifdef DEBUG
  printf("[DEBUG - C]--- Supported Operation of DTPU delegate class --- \n");
  #endif
    switch (registration->builtin_code) {
      case kTfLiteBuiltinConv2d:
        only_con2d=true;
        #ifdef DEBUG
        printf("[DEBUG-C]-- Supported operations only 2d convolution----\n");
        #endif

      case kTfLiteBuiltinDepthwiseConv2d:
      #ifdef DEBUG
        printf("[DEBUG - C]--Hello world! I can make 2D convolution and depth wise 2D convolution---\n");
        #endif
        return true;
      default:
        return false;
    }
  }

  // Any initialization code needed
  bool Init(TfLiteContext* context,const TfLiteDelegateParams* delegate_params) {
  #ifdef DEBUG
    printf("[DEBUG - C]--- Init of DTPU delegate class --- \n");
    #endif
    
     #ifdef DEBUG
      printf("[DEBUG - C]--- Init of DTPU delegate class check if tensors indexes are equal to the ones in the Invoke --- \n");
    for (int input_index: TfLiteIntArrayView(delegate_params->input_tensors)){
    
      printf("[DEBUG - C]--- Init of DTPU delegate class getting tensors %d--- \n",input_index);
    
    }
      #endif

    if(time_probe){
      avg_time_delegate=0.00;
      avg_time_data_exchange=0.00;
      n_execution=0;
    }

    // instantiate buffcfers and soft reset of accelerator 
    return Init_p(context->tensors_size,delegate_params->input_tensors->size ,delegate_params->output_tensors->size);
   
  }
  // Any preparation work needed (e.g. allocate buffers)
  TfLiteStatus Prepare(TfLiteContext* context, TfLiteNode* node) {
  #ifdef DEBUG
  printf("[DEBUG - C]--- Prepare of DTPU delegate class --- \n");
  #endif
      // initialize, link the buffers accordint to the size of node data
    // kTfLiteMmapRo  aka weights
    int num_weight_tensor=0;
    // set precison check 
    if(NO_FP==-1){
          printf("ERROR! Need to execute SelectDataTypeComputation function before calling the Tensorflow Interpreter\n");
           return kTfLiteError ;
      }


    for (int input_index : TfLiteIntArrayView(node->inputs)){
      // one of this should be the weight tensor
      auto&  in_t= context->tensors[input_index];
      if(in_t.allocation_type==kTfLiteMmapRo){
              num_weight_tensor++;
              #ifdef DEBUG
              printf("[DEBUG -C]---found a tensor weight %d----\n", input_index);
              #endif
      // get dimesion of tensors
      // push to python sublayer
       if(!NO_FP){
      switch(bit_width_computation){
      default:
      case 8:
          #ifdef DEBUG
                    if(signed_computation){
                      printf("[DEBUG-C]---- kTfLiteInt8 ------\n");
                    }else{
                      printf("[DEBUG-C]---- kTfLiteUInt8 ------\n");
                    }
          #endif
          if(signed_computation){
          push_weight_to_heap(in_t.data.int8, in_t.dims->data, in_t.dims->size);
          }else {
          push_weight_to_heap( in_t.data.uint8, in_t.dims->data, in_t.dims->size);
          }
                    
        break;
      case 16:
            #ifdef DEBUG
                    printf("[DEBUG-C]---- kTfLiteInt16 ------\n");
            #endif
                  push_weight_to_heap( in_t.data.i16, in_t.dims->data, in_t.dims->size);
                  break;
      case 32:
      #ifdef DEBUG
                  printf("[DEBUG-C]---- kTfLiteInt32 ------\n");
          #endif
            push_weight_to_heap( in_t.data.i32, in_t.dims->data, in_t.dims->size);
            break;
      case 64:
          #ifdef DEBUG
                printf("[DEBUG-C]---- kTfLiteInt64------\n");
          #endif
                push_weight_to_heap( in_t.data.i64, in_t.dims->data, in_t.dims->size);
                break;
      }
      }
      else { // use fp units 
        switch (bit_width_computation){
        case 16:  
              if(context->allow_fp32_relax_to_fp16 && NO_FP==3 ){ // NO_FP==3 -> fp active and bfp active
                 #ifdef DEBUG
            printf("[DEBUG-C]---- kTfLitefloat32 relaxed aka bfp16 ------\n");
            #endif
              // remembedr f16 is TfLiteFloat16*    

            /*typedef struct {
                  uint16_t data;
                } TfLiteFloat16;
                */
            push_weight_to_heap( in_t.data.f16, in_t.dims->data, in_t.dims->size);
              }
              break;
        case 32:
            #ifdef DEBUG
            printf("[DEBUG-C]---- kTfLitefloat32 ------\n");
            #endif
              push_weight_to_heap( in_t.data.f, in_t.dims->data, in_t.dims->size);
              break;
        default:
            printf("[DEBUG-C]---- ERROR! no fp precision defined ------\n");
            break;
      }

      }
      }
    }        
    #ifdef DEBUG
    printf("[DEBUG-C]--- number of weights found= %d \n",num_weight_tensor);
    #endif 
      if(Prepare_p(num_weight_tensor)){
      return kTfLiteOk;
      }
     return kTfLiteError ;

  }
  // Actual running of the delegate subgraph.
  TfLiteStatus Invoke(TfLiteContext* context, TfLiteNode* node) {
    struct timespec ts_start,ts_end;

    #ifdef DEBUG
    printf("[DEBUG - C]--- Invoke of DTPU delegate class --- \n");
    printf("[DEBUG - C]--- Invoke of DTPU delegate class getting tensors --- \n");
    #endif


    if(time_probe){
          if(!timespec_get(&ts_start,TIME_UTC)){
          fprintf(stderr,"error during the acquisition of start time!\n");
          exit(-1);
              }
    }

    // run inference on the delegate  and data transfer to/from memory/accelerator
    for (int input_index : TfLiteIntArrayView(node->inputs)){
      // one of this should be the weight tensor
      #ifdef DEBUG
      printf("[DEBUG - C]--- Invoke of DTPU delegate class getting tensors %d--- \n",input_index);
      #endif
      TfLiteTensor  in_t= context->tensors[input_index];
      if(!(in_t.allocation_type==kTfLiteMmapRo)){ //cause the weights have been transferred into the Prepare method
      // get dimesion of tensors
      // push to python sublayer
       if(!NO_FP){
      switch(bit_width_computation){
      default:
      case 8:
          #ifdef DEBUG
                    if(signed_computation){
                      printf("[DEBUG-C]---- kTfLiteInt8 ------\n");
                    }else{
                      printf("[DEBUG-C]---- kTfLiteUInt8 ------\n");
                    }
          #endif
          if(signed_computation){
        push_input_tensor_to_heap(in_t.data.int8,in_t.dims->data,in_t.dims->size);
          }else {
          push_input_tensor_to_heap(in_t.data.uint8,in_t.dims->data,in_t.dims->size);
          }
                    
        break;
      case 16:
            #ifdef DEBUG
                    printf("[DEBUG-C]---- kTfLiteInt16 ------\n");
            #endif
              push_input_tensor_to_heap(in_t.data.i16,in_t.dims->data,in_t.dims->size);
                  break;
      case 32:
      #ifdef DEBUG
                  printf("[DEBUG-C]---- kTfLiteInt32 ------\n");
          #endif
            push_input_tensor_to_heap(in_t.data.i32,in_t.dims->data,in_t.dims->size);
            break;
      case 64:
          #ifdef DEBUG
                printf("[DEBUG-C]---- kTfLiteInt64------\n");
          #endif
            push_input_tensor_to_heap(in_t.data.i64,in_t.dims->data,in_t.dims->size);
                break;
      }
      }
      else { // use fp units 
        switch (bit_width_computation){
        case 16:  
              if(context->allow_fp32_relax_to_fp16 && NO_FP==3 ){ // NO_FP==3 -> fp active and bfp active
                 #ifdef DEBUG
            printf("[DEBUG-C]---- kTfLitefloat32 relaxed aka bfp16 ------\n");
            #endif
              push_input_tensor_to_heap(in_t.data.f16,in_t.dims->data,in_t.dims->size);
              }
              break;
        case 32:
            #ifdef DEBUG
            printf("[DEBUG-C]---- kTfLitefloat32 ------\n");
            #endif
              push_input_tensor_to_heap(in_t.data.f,in_t.dims->data,in_t.dims->size);
              break;
        default:
            printf("[DEBUG-C]---- ERROR! no fp precision defined ------\n");
            break;
      }

      }

      }
    }


    for (int output_index : TfLiteIntArrayView(node->outputs)){
      auto&  out_t= context->tensors[output_index];
      // get dimesion of tensors
      // push to python sublayer

      #ifdef DEBUG
      printf("[DEBUG - C]--- Invoke of DTPU delegate class getting output tensors %d--- \n",output_index);
      #endif
      
       if(!NO_FP){
      switch(bit_width_computation){
      default:
      case 8:
          #ifdef DEBUG
                    if(signed_computation){
                      printf("[DEBUG-C]---- kTfLiteInt8 ------\n");
                    }else{
                      printf("[DEBUG-C]---- kTfLiteUInt8 ------\n");
                    }
          #endif
          if(signed_computation){
          push_output_tensor_to_heap(out_t.data.int8,out_t.dims->data,out_t.dims->size);
          }else {
          push_output_tensor_to_heap(out_t.data.uint8,out_t.dims->data,out_t.dims->size);
          }
                    
        break;
      case 16:
            #ifdef DEBUG
                    printf("[DEBUG-C]---- kTfLiteInt16 ------\n");
            #endif
              push_output_tensor_to_heap(out_t.data.i16,out_t.dims->data,out_t.dims->size);
                  break;
      case 32:
      #ifdef DEBUG
                  printf("[DEBUG-C]---- kTfLiteInt32 ------\n");
          #endif
            push_output_tensor_to_heap(out_t.data.i32,out_t.dims->data,out_t.dims->size);
            break;
      case 64:
          #ifdef DEBUG
                printf("[DEBUG-C]---- kTfLiteInt64------\n");
          #endif
            push_output_tensor_to_heap(out_t.data.i64,out_t.dims->data,out_t.dims->size);
                break;
      }
      }
      else { // use fp units 
        switch (bit_width_computation){
        case 16:  
              if(context->allow_fp32_relax_to_fp16 && NO_FP==3 ){ // NO_FP==3 -> fp active and bfp active
                 #ifdef DEBUG
            printf("[DEBUG-C]---- kTfLitefloat32 relaxed aka bfp16 ------\n");
            #endif
              push_output_tensor_to_heap(out_t.data.f16,out_t.dims->data,out_t.dims->size); // a uint16 pointer
              }
              break;
        case 32:
            #ifdef DEBUG
            printf("[DEBUG-C]---- kTfLitefloat32 ------\n");
            #endif
              push_output_tensor_to_heap(out_t.data.f,out_t.dims->data,out_t.dims->size);
              break;
        default:
            printf("[DEBUG-C]---- ERROR! no fp precision defined ------\n");
            break;
      }

      }

      }
      if(time_probe){
      if(!timespec_get(&ts_end, TIME_UTC)){
        fprintf(stderr,"erorr during the acquisition of end time!\n");
        exit(-1);
      }
      // update average and execution time
      avg_time_data_exchange+=ts_end.tv_sec*1000 + ((double)ts_end.tv_nsec)/1000000 - ts_start.tv_sec*1000 - ((double)ts_start.tv_nsec)/1000000;

      n_execution++;
      }

      if(time_probe){
      if(!timespec_get(&ts_start, TIME_UTC)){
        fprintf(stderr,"erorr during the acquisition of end time!\n");
        exit(-1);
      }
      }
    if(Invoke_p(only_con2d)){
      if(time_probe){
      if(!timespec_get(&ts_end, TIME_UTC)){
        fprintf(stderr,"erorr during the acquisition of end time!\n");
        exit(-1);
      }      
      avg_time_delegate+=ts_end.tv_sec*1000 + ((double)ts_end.tv_nsec)/1000000 - ts_start.tv_sec*1000 - ((double)ts_start.tv_nsec)/1000000;
      }
      return kTfLiteOk;
      }
     return kTfLiteError ;
    }
   
};


  TfLiteStatus  SelectDataTypeComputation(int data_type ){
  #ifdef DEBUG
  printf("[DEBUG - C]--- SelectDataTypeComputation of DTPU delegate class --- \n");
  #endif
  int precision= data_type & 0x000f;
  signed_computation= ((data_type & 0x00100)>>8)==1 ? true : false; 

  NO_FP= (data_type & 0x060)>>5;
  switch(precision){
    default:
    case 1: //INT8
    bit_width_computation=8;
    break;
    case 3: //INT16
    bit_width_computation=16;
    break;
    case 7: //INT32
    bit_width_computation=32;
    break;
    case 15: //INT64
      bit_width_computation=64;
      break;
  }
  // check compatibilyt of signed and unsigned 
  if(signed_computation && bit_width_computation!=8){
    printf("ERROR-> signed/unsigned distinction is only compatible with 8 bit computation");
    return kTfLiteError;
  }
  if(SelectDataTypeComputation_p(data_type) ){
      return kTfLiteOk;
      }
     return kTfLiteError ;
  }  

  TfLiteStatus  ResetHardware( ){
  #ifdef DEBUG
  printf("[DEBUG - C]---  Reset underlaying hardware --- \n");
  #endif
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
  #ifdef DEBUG
  printf("[DEBUG - C] --- get delegate node registration function ---\n");
  #endif
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
  #ifdef DEBUG
  printf("[DEBUG - C] ---- preparing the delegate ----\n");
  #endif
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
  #ifdef DEBUG                      
  printf("[DEBUG - C]--- Do any cleanups---\n");
  #endif
  FreeBufferHandle_p();
}


TfLiteStatus CopyToBufferHandle(TfLiteContext* context,
                                TfLiteDelegate* delegate,
                                TfLiteBufferHandle buffer_handle,
                                TfLiteTensor* tensor) {
  #ifdef DEBUG
  printf("[DEBUG - C]--- Copies data from tensor to delegate buffer if needed.----\n");
  #endif
  if(CopyToBufferHandle_p()){
  return kTfLiteOk;
  }
  return kTfLiteError;
}

TfLiteStatus CopyFromBufferHandle(TfLiteContext* context,
                                  TfLiteDelegate* delegate,
                                  TfLiteBufferHandle buffer_handle,
                                  TfLiteTensor* tensor) {
  #ifdef DEBUG
  printf("[DEBUG - C]---Copies the data from delegate buffer into the tensor raw memory----\n");
  #endif
  if(CopyFromBufferHandle_p()){
  return kTfLiteOk;
  }
  return kTfLiteError;  
}

TfLiteStatus activate_time_probe(bool activate){
  #ifdef DEBUG
  printf("[DEBUG-C]---- activating time probes ----\n");
  #endif
  if (!time_probe && activate){
    time_probe=true;
      #ifdef DEBUG
          printf("[DEBUG-C]---- activated time probes ----\n");
        #endif
    activate_time_probe_p(activate);
  } else{
    printf("ATTENTION! Time probes are not active\n");

  }
   return kTfLiteOk;
 
}


TfLiteStatus print_execution_stats(){
  #ifdef DEBUG
  printf("[DEBUG - C]----- printing time probes of the library -----\n");
  #endif
    printf("If you are seeing too many zeros you probably did not set the time probes variable to true!\n");

  // print c time probes
    printf("Overall time of delegate invoke: %3f\n [ms]",avg_time_delegate/n_execution);
    printf("Data exchange between interfaces (C->Python->C): %3f\n [ms]",avg_time_data_exchange/n_execution);

  // print python time probes
  if(print_python_time_probes()){
    return kTfLiteOk;
  }
  return kTfLiteError;

}

TfLiteStatus measure_power_consumption(){
#ifdef DEBUG
  printf("[DEBUG - C]---Measuring power consumption of the accelerator during invoke ----\n");
  #endif
  if(start_power_consumption()){
    return kTfLiteOk;
  }
  return kTfLiteError;

}

TfLiteStatus print_power_consumption(){
  #ifdef DEBUG
  printf("[DEBUG - C]---Printing power consumption of the accelerator during invoke ----\n");
  #endif
  if(print_power_consumption_p()){
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
  #ifdef DEBUG
  printf("[DEBUG - C] ---the delegate method of DTPU is born for TensorFlow %s---\n",TF_Version());
  #endif
  return delegate;
}


void tflite_plugin_destroy_delegate(void  * delegate_op , void * argtypes) {
// destroy the delegate   
TfLiteDelegate * delegate= (TfLiteDelegate *) delegate_op;
#ifdef DEBUG
printf("[DEBUG - C]-----cleaning memory  -> callback of python function---\n");
#endif
if(!destroy_p()) {
  printf("ERROR IN FREEING BUFFERS!");
}
//free(argtypes);
free(delegate);
}
#ifdef __cplusplus
} // extern "C"
#endif