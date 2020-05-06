//==================================================================================================
//  Filename      : smac.v
//  Created On    : 2020-04-22 17:05:43
//  Last Modified : 2020-05-06 11:20:58
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
`include "precision_def.vh"
module tb_smac (); /* this is automatically generated */

	logic clk;

	// clock
	initial begin
		clk = '0;
		forever #(0.5) clk = ~clk;
	end


	parameter USE_FABRIC = "NO";

	logic                           ce;
	logic                           sclr;
	logic [64-1:0] data_input;
	logic [64-1:0] weight;
	logic [64-1:0] res_mac_p;
	logic [64-1:0] res_mac_n;
	logic [63:0]					res_mac_n_fa;
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
		smac #(
			.USE_FABRIC("YES")
		) inst_smac_fa (
			.clk              (clk),
			.ce               (ce),
			.sclr             (sclr),
			.data_input       (data_input),
			.weight           (weight),
			.res_mac_p        (res_mac_p),
			.res_mac_n        (res_mac_n_fa),
			.select_precision (select_precision),
			.enable_fp_unit   (enable_fp_unit),
			.active_chain     (active_chain)
		);
	initial begin
		// do something
		ce='0;
		sclr='1;
		enable_fp_unit='0;
		active_chain=1'b0;
		repeat(1) @ (posedge clk);
		sclr='0;
		repeat(1) @ (posedge clk);
		sclr='0;
		ce='1;
		repeat(1) @ (posedge clk);
		active_chain='0;

		`ifdef USE_ALL 
		$display("integer 64 computation");
		select_precision=`INT64;

		`elsif  USEO_INT8 
		$display("integer 8 computation");
		select_precision=`INT8;
		`elsif  USEO_INT16
		$display("integer 16 computation");
		select_precision=`INT16;
		`elsif USEO_INT32
		$display("integer 32 computation");
		select_precision=`INT32;
		`endif		

		res_mac_p=64'd0;
		weight=64'hFFFFFFFFFFFFFFFFF;
		data_input=64'hcafecafecafecafe;
		repeat(5)@(posedge clk); // output after two cc
		if(res_mac_n!=res_mac_n_fa)begin 
			$display("error");
			$stop();
		end
		res_mac_p=64'd1;
		repeat(6)@(posedge clk);
        

		$finish();



		repeat(10)@(posedge clk);
		$finish;
	end

	// dump wave
/*	initial begin
		if ( $test$plusargs("fsdb") ) begin
			$fsdbDumpfile("tb_smac.fsdb");
			$fsdbDumpvars(0, "tb_smac", "+mda", "+functions");
		end
	end*/

endmodule
