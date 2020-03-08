/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_396(char*, char *);
extern void execute_397(char*, char *);
extern void execute_83(char*, char *);
extern void execute_88(char*, char *);
extern void execute_394(char*, char *);
extern void execute_395(char*, char *);
extern void execute_393(char*, char *);
extern void execute_101(char*, char *);
extern void execute_102(char*, char *);
extern void execute_103(char*, char *);
extern void execute_104(char*, char *);
extern void execute_105(char*, char *);
extern void execute_386(char*, char *);
extern void execute_381(char*, char *);
extern void execute_126(char*, char *);
extern void execute_147(char*, char *);
extern void execute_163(char*, char *);
extern void execute_179(char*, char *);
extern void execute_195(char*, char *);
extern void execute_212(char*, char *);
extern void execute_220(char*, char *);
extern void execute_235(char*, char *);
extern void execute_249(char*, char *);
extern void execute_263(char*, char *);
extern void execute_277(char*, char *);
extern void execute_292(char*, char *);
extern void execute_320(char*, char *);
extern void execute_301(char*, char *);
extern void execute_303(char*, char *);
extern void execute_306(char*, char *);
extern void execute_308(char*, char *);
extern void execute_310(char*, char *);
extern void execute_312(char*, char *);
extern void execute_314(char*, char *);
extern void execute_316(char*, char *);
extern void execute_318(char*, char *);
extern void execute_327(char*, char *);
extern void execute_337(char*, char *);
extern void execute_345(char*, char *);
extern void execute_351(char*, char *);
extern void execute_358(char*, char *);
extern void execute_365(char*, char *);
extern void execute_372(char*, char *);
extern void execute_379(char*, char *);
extern void execute_385(char*, char *);
extern void execute_133(char*, char *);
extern void execute_135(char*, char *);
extern void execute_137(char*, char *);
extern void execute_115(char*, char *);
extern void execute_116(char*, char *);
extern void execute_110(char*, char *);
extern void execute_113(char*, char *);
extern void execute_399(char*, char *);
extern void execute_400(char*, char *);
extern void execute_401(char*, char *);
extern void execute_402(char*, char *);
extern void execute_403(char*, char *);
extern void execute_404(char*, char *);
extern void execute_405(char*, char *);
extern void execute_406(char*, char *);
extern void transaction_6(char*, char*, unsigned, unsigned, unsigned);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_10(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_5(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[69] = {(funcp)execute_396, (funcp)execute_397, (funcp)execute_83, (funcp)execute_88, (funcp)execute_394, (funcp)execute_395, (funcp)execute_393, (funcp)execute_101, (funcp)execute_102, (funcp)execute_103, (funcp)execute_104, (funcp)execute_105, (funcp)execute_386, (funcp)execute_381, (funcp)execute_126, (funcp)execute_147, (funcp)execute_163, (funcp)execute_179, (funcp)execute_195, (funcp)execute_212, (funcp)execute_220, (funcp)execute_235, (funcp)execute_249, (funcp)execute_263, (funcp)execute_277, (funcp)execute_292, (funcp)execute_320, (funcp)execute_301, (funcp)execute_303, (funcp)execute_306, (funcp)execute_308, (funcp)execute_310, (funcp)execute_312, (funcp)execute_314, (funcp)execute_316, (funcp)execute_318, (funcp)execute_327, (funcp)execute_337, (funcp)execute_345, (funcp)execute_351, (funcp)execute_358, (funcp)execute_365, (funcp)execute_372, (funcp)execute_379, (funcp)execute_385, (funcp)execute_133, (funcp)execute_135, (funcp)execute_137, (funcp)execute_115, (funcp)execute_116, (funcp)execute_110, (funcp)execute_113, (funcp)execute_399, (funcp)execute_400, (funcp)execute_401, (funcp)execute_402, (funcp)execute_403, (funcp)execute_404, (funcp)execute_405, (funcp)execute_406, (funcp)transaction_6, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_10, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_0, (funcp)transaction_1, (funcp)transaction_2, (funcp)transaction_3, (funcp)transaction_5};
const int NumRelocateId= 69;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/tb_mul_behav/xsim.reloc",  (void **)funcTab, 69);
	iki_vhdl_file_variable_register(dp + 29136);
	iki_vhdl_file_variable_register(dp + 29192);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/tb_mul_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/tb_mul_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 42968, dp + 41552, 0, 3, 0, 3, 4, 1);
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstantiate();

extern void implicit_HDL_SCcleanup();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/tb_mul_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/tb_mul_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/tb_mul_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
