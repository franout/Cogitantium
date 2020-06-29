import cffi
import sys
sys.path.append('/usr/local/lib')

##########################################################################
####          The Frankenstein, a mix of C and Python               ######
####  create .so library from PYNQ python code for DTPU accelerator ######
####        on board compiling, it requires                         ######
####   to have tensorflow/tensorflow/lite in /usr/include/pythonX.X ######
####                 from r2.1 branch                               ######
##########################################################################
ffibuilder = cffi.FFI()

ffibuilder.cdef("""
extern "Python" {
bool destroy_p(void  );
bool CopyFromBufferHandle_p(void);
bool CopyToBufferHandle_p(void);
void FreeBufferHandle_p(void);
bool SelectDataTypeComputation_p(int);
bool Init_p(int ,int,int);
bool Prepare_p(int);
bool Invoke_p(bool);
void  load_overlay(void);
bool ResetHardware_p(void);
void push_weight_to_heap( void  *,int *,int);
void push_input_tensor_to_heap( void  *,int *,int);
void push_output_tensor_to_heap( void  *,int *,int);
bool print_power_consumption_p(void);
bool start_power_consumption(void);
 };
  void * tflite_plugin_create_delegate();
  void tflite_plugin_destroy_delegate(void  * ,void * );
  bool  SelectDataTypeComputation(int);
  bool print_power_consumption();
  bool measure_power_consumption();""")


cpp_file=open("./DTPU_delegate.cpp","r")
ffibuilder.set_source("dtpu_lib", cpp_file.read(),source_extension=".cpp",
	extra_compile_args=['-Wno-unused-result', '-Wsign-compare', '-DNDEBUG', '-g', '-fwrapv', '-O2', '-Wall', '-Wstrict-prototypes', 
	'-g', '-fdebug-prefix-map=/build/python3.5.2=.', '-specs=/usr/share/dpkg/no-pie-compile.specs', '-fstack-protector-strong', 
	'-Wformat', '-Werror=format-security','-I/usr/local/include','-L/usr/local/lib'],
	extra_link_args=['-Wl,-Bsymbolic-functions','-specs=/usr/share/dpkg/no-pie-link.specs', 
	'-Wl,-z,relro','-specs=/usr/share/dpkg/no-pie-compile.specs','-D_FORTIFY_SOURCE=2','-fPIC'] ,
	libraries=['pthread','expat','z','dl','util','m','tensorflow'])
#if you want to simply access a global variable you just use its name.
# However to change its value you need to use the global keyword.
python_file=open("./DTPU_delegate.py","r")
ffibuilder.embedding_init_code(python_file.read())

ffibuilder.compile(target="DTPU_delegate.*", verbose=True)

cpp_file.close()
python_file.close()

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


a=struct.pack("bigendia or little endia"+("B"*size),*vector) # pack 
int.from_bytes( bytes, byteorder, *, signed=False ) # from bytes to int
struct.unpack()#unpack

## unpack and packing values more efficientely
# import struct
#>>> bytestr = struct.pack('>Q', 2592701575664680400)
#>>> bytestr
#'#\xfb X\xaa\x16\xbd\xd0'
#>>> [ord(b) for b in bytestr]
#[35, 251, 32, 88, 170, 22, 189, 208]
#