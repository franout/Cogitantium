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
extern void execute_6244(char*, char *);
extern void execute_6245(char*, char *);
extern void execute_6246(char*, char *);
extern void execute_6323(char*, char *);
extern void execute_6324(char*, char *);
extern void execute_6325(char*, char *);
extern void execute_6326(char*, char *);
extern void execute_6327(char*, char *);
extern void execute_6328(char*, char *);
extern void execute_6329(char*, char *);
extern void execute_6330(char*, char *);
extern void execute_6331(char*, char *);
extern void execute_6332(char*, char *);
extern void execute_6333(char*, char *);
extern void execute_6334(char*, char *);
extern void execute_128(char*, char *);
extern void execute_133(char*, char *);
extern void execute_440(char*, char *);
extern void execute_441(char*, char *);
extern void execute_439(char*, char *);
extern void execute_146(char*, char *);
extern void execute_147(char*, char *);
extern void execute_148(char*, char *);
extern void execute_149(char*, char *);
extern void execute_150(char*, char *);
extern void execute_432(char*, char *);
extern void execute_427(char*, char *);
extern void execute_171(char*, char *);
extern void execute_193(char*, char *);
extern void execute_209(char*, char *);
extern void execute_225(char*, char *);
extern void execute_241(char*, char *);
extern void execute_258(char*, char *);
extern void execute_266(char*, char *);
extern void execute_281(char*, char *);
extern void execute_295(char*, char *);
extern void execute_309(char*, char *);
extern void execute_323(char*, char *);
extern void execute_338(char*, char *);
extern void execute_366(char*, char *);
extern void execute_347(char*, char *);
extern void execute_349(char*, char *);
extern void execute_352(char*, char *);
extern void execute_354(char*, char *);
extern void execute_356(char*, char *);
extern void execute_358(char*, char *);
extern void execute_360(char*, char *);
extern void execute_362(char*, char *);
extern void execute_364(char*, char *);
extern void execute_373(char*, char *);
extern void execute_383(char*, char *);
extern void execute_391(char*, char *);
extern void execute_397(char*, char *);
extern void execute_404(char*, char *);
extern void execute_411(char*, char *);
extern void execute_418(char*, char *);
extern void execute_425(char*, char *);
extern void execute_431(char*, char *);
extern void execute_179(char*, char *);
extern void execute_181(char*, char *);
extern void execute_183(char*, char *);
extern void execute_160(char*, char *);
extern void execute_161(char*, char *);
extern void execute_155(char*, char *);
extern void execute_158(char*, char *);
extern void execute_6251(char*, char *);
extern void execute_6254(char*, char *);
extern void execute_658(char*, char *);
extern void execute_660(char*, char *);
extern void execute_461(char*, char *);
extern void execute_656(char*, char *);
extern void execute_465(char*, char *);
extern void execute_468(char*, char *);
extern void execute_471(char*, char *);
extern void execute_476(char*, char *);
extern void execute_485(char*, char *);
extern void execute_651(char*, char *);
extern void execute_491(char*, char *);
extern void execute_492(char*, char *);
extern void execute_495(char*, char *);
extern void execute_496(char*, char *);
extern void execute_500(char*, char *);
extern void execute_501(char*, char *);
extern void execute_503(char*, char *);
extern void execute_504(char*, char *);
extern void execute_506(char*, char *);
extern void execute_507(char*, char *);
extern void execute_509(char*, char *);
extern void execute_511(char*, char *);
extern void execute_514(char*, char *);
extern void execute_515(char*, char *);
extern void execute_521(char*, char *);
extern void execute_522(char*, char *);
extern void execute_523(char*, char *);
extern void execute_524(char*, char *);
extern void execute_525(char*, char *);
extern void execute_526(char*, char *);
extern void execute_527(char*, char *);
extern void execute_528(char*, char *);
extern void execute_529(char*, char *);
extern void execute_530(char*, char *);
extern void execute_531(char*, char *);
extern void execute_532(char*, char *);
extern void execute_533(char*, char *);
extern void execute_534(char*, char *);
extern void execute_535(char*, char *);
extern void execute_536(char*, char *);
extern void execute_537(char*, char *);
extern void execute_538(char*, char *);
extern void execute_539(char*, char *);
extern void execute_540(char*, char *);
extern void execute_541(char*, char *);
extern void execute_542(char*, char *);
extern void execute_543(char*, char *);
extern void execute_544(char*, char *);
extern void execute_545(char*, char *);
extern void execute_546(char*, char *);
extern void execute_547(char*, char *);
extern void execute_548(char*, char *);
extern void execute_549(char*, char *);
extern void execute_550(char*, char *);
extern void execute_551(char*, char *);
extern void execute_552(char*, char *);
extern void execute_553(char*, char *);
extern void execute_554(char*, char *);
extern void execute_555(char*, char *);
extern void execute_556(char*, char *);
extern void execute_557(char*, char *);
extern void execute_558(char*, char *);
extern void execute_559(char*, char *);
extern void execute_560(char*, char *);
extern void execute_561(char*, char *);
extern void execute_562(char*, char *);
extern void execute_563(char*, char *);
extern void execute_564(char*, char *);
extern void execute_565(char*, char *);
extern void execute_566(char*, char *);
extern void execute_567(char*, char *);
extern void execute_568(char*, char *);
extern void execute_569(char*, char *);
extern void execute_570(char*, char *);
extern void execute_571(char*, char *);
extern void execute_572(char*, char *);
extern void execute_573(char*, char *);
extern void execute_574(char*, char *);
extern void execute_575(char*, char *);
extern void execute_576(char*, char *);
extern void execute_577(char*, char *);
extern void execute_578(char*, char *);
extern void execute_579(char*, char *);
extern void execute_580(char*, char *);
extern void execute_581(char*, char *);
extern void execute_582(char*, char *);
extern void execute_583(char*, char *);
extern void execute_584(char*, char *);
extern void execute_585(char*, char *);
extern void execute_586(char*, char *);
extern void execute_587(char*, char *);
extern void execute_588(char*, char *);
extern void execute_589(char*, char *);
extern void execute_590(char*, char *);
extern void execute_591(char*, char *);
extern void execute_592(char*, char *);
extern void execute_593(char*, char *);
extern void execute_594(char*, char *);
extern void execute_595(char*, char *);
extern void execute_596(char*, char *);
extern void execute_597(char*, char *);
extern void execute_598(char*, char *);
extern void execute_599(char*, char *);
extern void execute_600(char*, char *);
extern void execute_601(char*, char *);
extern void execute_602(char*, char *);
extern void execute_603(char*, char *);
extern void execute_604(char*, char *);
extern void execute_605(char*, char *);
extern void execute_606(char*, char *);
extern void execute_607(char*, char *);
extern void execute_608(char*, char *);
extern void execute_609(char*, char *);
extern void execute_610(char*, char *);
extern void execute_611(char*, char *);
extern void execute_612(char*, char *);
extern void execute_613(char*, char *);
extern void execute_614(char*, char *);
extern void execute_615(char*, char *);
extern void execute_616(char*, char *);
extern void execute_617(char*, char *);
extern void execute_618(char*, char *);
extern void execute_619(char*, char *);
extern void execute_620(char*, char *);
extern void execute_621(char*, char *);
extern void execute_622(char*, char *);
extern void execute_623(char*, char *);
extern void execute_624(char*, char *);
extern void execute_625(char*, char *);
extern void execute_626(char*, char *);
extern void execute_627(char*, char *);
extern void execute_628(char*, char *);
extern void execute_629(char*, char *);
extern void execute_630(char*, char *);
extern void execute_631(char*, char *);
extern void execute_632(char*, char *);
extern void execute_633(char*, char *);
extern void execute_634(char*, char *);
extern void execute_635(char*, char *);
extern void execute_636(char*, char *);
extern void execute_637(char*, char *);
extern void execute_638(char*, char *);
extern void execute_639(char*, char *);
extern void execute_640(char*, char *);
extern void execute_641(char*, char *);
extern void execute_642(char*, char *);
extern void execute_643(char*, char *);
extern void execute_644(char*, char *);
extern void execute_645(char*, char *);
extern void execute_646(char*, char *);
extern void execute_647(char*, char *);
extern void execute_648(char*, char *);
extern void execute_649(char*, char *);
extern void execute_650(char*, char *);
extern void execute_664(char*, char *);
extern void execute_665(char*, char *);
extern void execute_666(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_6248(char*, char *);
extern void execute_6249(char*, char *);
extern void execute_6250(char*, char *);
extern void execute_6335(char*, char *);
extern void execute_6336(char*, char *);
extern void execute_6337(char*, char *);
extern void execute_6338(char*, char *);
extern void execute_6339(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_9(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_10(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_13(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_14(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_15(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_16(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_17(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_18(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_19(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_20(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_113(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_114(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_271(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_417(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_418(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_575(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_717(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_782(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_783(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_940(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1086(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1087(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1244(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1386(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1451(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1452(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1609(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1755(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1756(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_1913(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2056(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2057(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2058(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2059(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2060(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2061(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2062(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2063(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2128(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2129(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2286(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2432(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2433(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2590(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2736(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2737(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_2894(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3036(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3101(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3102(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3259(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3405(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3406(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3563(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3709(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3710(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_3867(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4009(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4074(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4075(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4232(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4378(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4379(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4536(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4682(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4683(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4840(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_4982(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_5047(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_5048(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_5205(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_5351(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_5352(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_5509(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_5655(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_5656(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_5813(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[312] = {(funcp)execute_6244, (funcp)execute_6245, (funcp)execute_6246, (funcp)execute_6323, (funcp)execute_6324, (funcp)execute_6325, (funcp)execute_6326, (funcp)execute_6327, (funcp)execute_6328, (funcp)execute_6329, (funcp)execute_6330, (funcp)execute_6331, (funcp)execute_6332, (funcp)execute_6333, (funcp)execute_6334, (funcp)execute_128, (funcp)execute_133, (funcp)execute_440, (funcp)execute_441, (funcp)execute_439, (funcp)execute_146, (funcp)execute_147, (funcp)execute_148, (funcp)execute_149, (funcp)execute_150, (funcp)execute_432, (funcp)execute_427, (funcp)execute_171, (funcp)execute_193, (funcp)execute_209, (funcp)execute_225, (funcp)execute_241, (funcp)execute_258, (funcp)execute_266, (funcp)execute_281, (funcp)execute_295, (funcp)execute_309, (funcp)execute_323, (funcp)execute_338, (funcp)execute_366, (funcp)execute_347, (funcp)execute_349, (funcp)execute_352, (funcp)execute_354, (funcp)execute_356, (funcp)execute_358, (funcp)execute_360, (funcp)execute_362, (funcp)execute_364, (funcp)execute_373, (funcp)execute_383, (funcp)execute_391, (funcp)execute_397, (funcp)execute_404, (funcp)execute_411, (funcp)execute_418, (funcp)execute_425, (funcp)execute_431, (funcp)execute_179, (funcp)execute_181, (funcp)execute_183, (funcp)execute_160, (funcp)execute_161, (funcp)execute_155, (funcp)execute_158, (funcp)execute_6251, (funcp)execute_6254, (funcp)execute_658, (funcp)execute_660, (funcp)execute_461, (funcp)execute_656, (funcp)execute_465, (funcp)execute_468, (funcp)execute_471, (funcp)execute_476, (funcp)execute_485, (funcp)execute_651, (funcp)execute_491, (funcp)execute_492, (funcp)execute_495, (funcp)execute_496, (funcp)execute_500, (funcp)execute_501, (funcp)execute_503, (funcp)execute_504, (funcp)execute_506, (funcp)execute_507, (funcp)execute_509, (funcp)execute_511, (funcp)execute_514, (funcp)execute_515, (funcp)execute_521, (funcp)execute_522, (funcp)execute_523, (funcp)execute_524, (funcp)execute_525, (funcp)execute_526, (funcp)execute_527, (funcp)execute_528, (funcp)execute_529, (funcp)execute_530, (funcp)execute_531, (funcp)execute_532, (funcp)execute_533, (funcp)execute_534, (funcp)execute_535, (funcp)execute_536, (funcp)execute_537, (funcp)execute_538, (funcp)execute_539, (funcp)execute_540, (funcp)execute_541, (funcp)execute_542, (funcp)execute_543, (funcp)execute_544, (funcp)execute_545, (funcp)execute_546, (funcp)execute_547, (funcp)execute_548, (funcp)execute_549, (funcp)execute_550, (funcp)execute_551, (funcp)execute_552, (funcp)execute_553, (funcp)execute_554, (funcp)execute_555, (funcp)execute_556, (funcp)execute_557, (funcp)execute_558, (funcp)execute_559, (funcp)execute_560, (funcp)execute_561, (funcp)execute_562, (funcp)execute_563, (funcp)execute_564, (funcp)execute_565, (funcp)execute_566, (funcp)execute_567, (funcp)execute_568, (funcp)execute_569, (funcp)execute_570, (funcp)execute_571, (funcp)execute_572, (funcp)execute_573, (funcp)execute_574, (funcp)execute_575, (funcp)execute_576, (funcp)execute_577, (funcp)execute_578, (funcp)execute_579, (funcp)execute_580, (funcp)execute_581, (funcp)execute_582, (funcp)execute_583, (funcp)execute_584, (funcp)execute_585, (funcp)execute_586, (funcp)execute_587, (funcp)execute_588, (funcp)execute_589, (funcp)execute_590, (funcp)execute_591, (funcp)execute_592, (funcp)execute_593, (funcp)execute_594, (funcp)execute_595, (funcp)execute_596, (funcp)execute_597, (funcp)execute_598, (funcp)execute_599, (funcp)execute_600, (funcp)execute_601, (funcp)execute_602, (funcp)execute_603, (funcp)execute_604, (funcp)execute_605, (funcp)execute_606, (funcp)execute_607, (funcp)execute_608, (funcp)execute_609, (funcp)execute_610, (funcp)execute_611, (funcp)execute_612, (funcp)execute_613, (funcp)execute_614, (funcp)execute_615, (funcp)execute_616, (funcp)execute_617, (funcp)execute_618, (funcp)execute_619, (funcp)execute_620, (funcp)execute_621, (funcp)execute_622, (funcp)execute_623, (funcp)execute_624, (funcp)execute_625, (funcp)execute_626, (funcp)execute_627, (funcp)execute_628, (funcp)execute_629, (funcp)execute_630, (funcp)execute_631, (funcp)execute_632, (funcp)execute_633, (funcp)execute_634, (funcp)execute_635, (funcp)execute_636, (funcp)execute_637, (funcp)execute_638, (funcp)execute_639, (funcp)execute_640, (funcp)execute_641, (funcp)execute_642, (funcp)execute_643, (funcp)execute_644, (funcp)execute_645, (funcp)execute_646, (funcp)execute_647, (funcp)execute_648, (funcp)execute_649, (funcp)execute_650, (funcp)execute_664, (funcp)execute_665, (funcp)execute_666, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_6248, (funcp)execute_6249, (funcp)execute_6250, (funcp)execute_6335, (funcp)execute_6336, (funcp)execute_6337, (funcp)execute_6338, (funcp)execute_6339, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_9, (funcp)transaction_10, (funcp)transaction_13, (funcp)transaction_14, (funcp)transaction_15, (funcp)transaction_16, (funcp)transaction_17, (funcp)transaction_18, (funcp)transaction_19, (funcp)transaction_20, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_113, (funcp)transaction_114, (funcp)transaction_271, (funcp)transaction_417, (funcp)transaction_418, (funcp)transaction_575, (funcp)transaction_717, (funcp)transaction_782, (funcp)transaction_783, (funcp)transaction_940, (funcp)transaction_1086, (funcp)transaction_1087, (funcp)transaction_1244, (funcp)transaction_1386, (funcp)transaction_1451, (funcp)transaction_1452, (funcp)transaction_1609, (funcp)transaction_1755, (funcp)transaction_1756, (funcp)transaction_1913, (funcp)transaction_2056, (funcp)transaction_2057, (funcp)transaction_2058, (funcp)transaction_2059, (funcp)transaction_2060, (funcp)transaction_2061, (funcp)transaction_2062, (funcp)transaction_2063, (funcp)transaction_2128, (funcp)transaction_2129, (funcp)transaction_2286, (funcp)transaction_2432, (funcp)transaction_2433, (funcp)transaction_2590, (funcp)transaction_2736, (funcp)transaction_2737, (funcp)transaction_2894, (funcp)transaction_3036, (funcp)transaction_3101, (funcp)transaction_3102, (funcp)transaction_3259, (funcp)transaction_3405, (funcp)transaction_3406, (funcp)transaction_3563, (funcp)transaction_3709, (funcp)transaction_3710, (funcp)transaction_3867, (funcp)transaction_4009, (funcp)transaction_4074, (funcp)transaction_4075, (funcp)transaction_4232, (funcp)transaction_4378, (funcp)transaction_4379, (funcp)transaction_4536, (funcp)transaction_4682, (funcp)transaction_4683, (funcp)transaction_4840, (funcp)transaction_4982, (funcp)transaction_5047, (funcp)transaction_5048, (funcp)transaction_5205, (funcp)transaction_5351, (funcp)transaction_5352, (funcp)transaction_5509, (funcp)transaction_5655, (funcp)transaction_5656, (funcp)transaction_5813};
const int NumRelocateId= 312;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/tb_mxu_core_behav/xsim.reloc",  (void **)funcTab, 312);
	iki_vhdl_file_variable_register(dp + 1329904);
	iki_vhdl_file_variable_register(dp + 1329960);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/tb_mxu_core_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1442728, dp + 1342696, 0, 3, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1592248, dp + 1342696, 4, 7, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1741768, dp + 1342696, 8, 11, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1948416, dp + 1342752, 0, 3, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2154416, dp + 1342752, 4, 7, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2360416, dp + 1342752, 8, 11, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2566416, dp + 1342752, 12, 15, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1348352, dp + 1347904, 36, 39, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1386248, dp + 1347904, 32, 35, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1497872, dp + 1347904, 24, 27, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1535768, dp + 1347904, 20, 23, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1647392, dp + 1347904, 12, 15, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1685288, dp + 1347904, 8, 11, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1386288, dp + 1385336, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1442768, dp + 1441816, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1535808, dp + 1534856, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1592288, dp + 1591336, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1685328, dp + 1684376, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1741808, dp + 1740856, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1797560, dp + 1797112, 64, 67, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1835456, dp + 1797112, 60, 63, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1891936, dp + 1797112, 56, 59, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2003560, dp + 1797112, 48, 51, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2041456, dp + 1797112, 44, 47, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2097936, dp + 1797112, 40, 43, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2209560, dp + 1797112, 32, 35, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2247456, dp + 1797112, 28, 31, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2303936, dp + 1797112, 24, 27, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2415560, dp + 1797112, 16, 19, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2453456, dp + 1797112, 12, 15, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2509936, dp + 1797112, 8, 11, 0, 3, 4, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1835496, dp + 1834544, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1891976, dp + 1891024, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 1948456, dp + 1947504, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2041496, dp + 2040544, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2097976, dp + 2097024, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2154456, dp + 2153504, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2247496, dp + 2246544, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2303976, dp + 2303024, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2360456, dp + 2359504, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2453496, dp + 2452544, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2509976, dp + 2509024, 0, 47, 0, 47, 48, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 2566456, dp + 2565504, 0, 47, 0, 47, 48, 1);

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/tb_mxu_core_behav/xsim.reloc");
	wrapper_func_0(dp);

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
    iki_set_sv_type_file_path_name("xsim.dir/tb_mxu_core_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/tb_mxu_core_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/tb_mxu_core_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
