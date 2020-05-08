//==================================================================================================
//  Filename      : mxu_mac.v
//  Created On    : 2020-04-25 12:25:20
//  Last Modified : 2020-05-08 22:53:25
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
module tb_smul ();

	logic clk;

	// clock
	initial begin
		clk = '0;
		forever #(0.5) clk = ~clk;
	end


	parameter USE_FABRIC = "NO";

	logic        ce;
	logic        sclr;
	logic [63:0] input_data;
	logic [63:0] weight;
	logic [63:0] res_mac_next;
	logic [63:0] res_mac_next_fa;
	logic  [3:0] select_precision;
	logic  [1:0] enable_fp_unit;
	logic        active_chain;

	smul #(
			.USE_FABRIC(USE_FABRIC)
		) inst_smul (
			.clk              (clk),
			.ce               (ce),
			.sclr             (sclr),
			.input_data       (input_data),
			.weight           (weight),
			.res_mac_next     (res_mac_next),
			.select_precision (select_precision),
			.enable_fp_unit   (enable_fp_unit),
			.active_chain     (active_chain)
		);
	smul #(
			.USE_FABRIC("YES")
		) inst_smul_fa (
			.clk              (clk),
			.ce               (ce),
			.sclr             (sclr),
			.input_data       (input_data),
			.weight           (weight),
			.res_mac_next     (res_mac_next_fa),
			.select_precision (select_precision),
			.enable_fp_unit   (enable_fp_unit),
			.active_chain     (active_chain)
		);

	logic [127:0]real_val;
	initial begin
		// do something
		ce='0;
		$display("global reset",);	
		sclr='1;
		repeat (5) @(posedge clk);
		sclr='0; 
		repeat(1) @ (posedge clk);
		ce=1'b1;
		active_chain=1'b0;
		enable_fp_unit=2'b0;
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
		`elsif  USE0_FP32 
		$display("fp 32 computation");
		select_precision=`INT32;
		enable_fp_unit='1;
		`elsif  USE0_FP16 
		$display("fp 16 computation");
		select_precision=`INT16;
		enable_fp_unit='1;
		`elsif  USE0_BFP16
		$display("bfp 16 computation");
		select_precision=`INT16;
		enable_fp_unit=2'd3; 
		`endif		
		
		weight=64'hFFFFFFFFFFFFFFFFF;
		input_data=64'hcafecafecafecafe;
		repeat(3)@(posedge clk); // output after two cc
		if(res_mac_next!==res_mac_next_fa)begin 
			$display("error in the computation");
			$stop();
		end
		sclr='1;
		ce='0;
		repeat(3)@(posedge clk);
		$display("activating the chain ",);
        active_chain='1;
        ce='1;
        sclr='0;
        repeat(5)@(posedge clk);
        if(res_mac_next!== res_mac_next_fa && !(res_mac_next===real_val[63:0]) )begin 
        	$display("error in the computation of no chian ",);
        	$stop();
        end 
        repeat(10)@(posedge clk);
		$finish();
	end

	assign real_val=(weight*input_data);

endmodule
