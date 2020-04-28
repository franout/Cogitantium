//==================================================================================================
//  Filename      : smac.v
//  Created On    : 2020-04-22 17:05:43
//  Last Modified : 2020-04-25 12:55:54
//  Revision      : 
//  Author        : Angione Francesco
//  Company       : Chalmers University of Technology,Sweden - Politecnico di Torino, Italy
//  Email         : francescoangione8@gmail.com
//
//  Description   : 
//
//
//==================================================================================================
`timescale 1ns/1ps

module tb_smac (); /* this is automatically generated */

	logic rstb;
	logic srst;
	logic clk;

	// clock
	initial begin
		clk = '0;
		forever #(0.5) clk = ~clk;
	end

	// reset
	initial begin
		rstb <= '0;
		srst <= '0;
		#20
		rstb <= '1;
		repeat (5) @(posedge clk);
		srst <= '1;
		repeat (1) @(posedge clk);
		srst <= '0;
	end

	// (*NOTE*) replace reset, clock, others

	parameter USE_FABRIC = "NO";

	logic                           ce;
	logic                           sclr;
	logic [bit_width*bit_width-1:0] data_input;
	logic [bit_width*bit_width-1:0] weight;
	logic [bit_width*bit_width-1:0] res_mac_p;
	logic [bit_width*bit_width-1:0] res_mac_n;
	logic                     [3:0] select_precision;
	logic                     [1:0] enable_fp_unit;
	logic                           active_chain;

	smac #(
			.USE_FABRIC(USE_FABRIC)
		) inst_smac (
			.clk              (clk),
			.ce               (ce),
			.sclr             (sclr),
			.data_input       (data_input),
			.weight           (weight),
			.res_mac_p        (res_mac_p),
			.res_mac_n        (res_mac_n),
			.select_precision (select_precision),
			.enable_fp_unit   (enable_fp_unit),
			.active_chain     (active_chain)
		);

	initial begin
		// do something

		repeat(10)@(posedge clk);
		$finish;
	end

	// dump wave
	initial begin
		if ( $test$plusargs("fsdb") ) begin
			$fsdbDumpfile("tb_smac.fsdb");
			$fsdbDumpvars(0, "tb_smac", "+mda", "+functions");
		end
	end

endmodule
