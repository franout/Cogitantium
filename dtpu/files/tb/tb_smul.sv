
`timescale 1ns/1ps

module tb_smul (); /* this is automatically generated */

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

	logic        ce;
	logic        sclr;
	logic [63:0] input_data;
	logic [63:0] weight;
	logic [63:0] res_mac_next;
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

	initial begin
		// do something
        
		repeat(10)@(posedge clk);
		$finish;
	end

	// dump wave
	initial begin
		if ( $test$plusargs("fsdb") ) begin
			$fsdbDumpfile("tb_smul.fsdb");
			$fsdbDumpvars(0, "tb_smul", "+mda", "+functions");
		end
	end

endmodule
