//==================================================================================================
//  Filename      : tb_fp_units.sv
//  Created On    : 2020-04-22 17:05:25
//  Last Modified : 2020-05-18 00:09:16
//  Revision      : 
//  Author        : Angione Francesco
//  Company       : Chalmers University of Technology,Sweden - Politecnico di Torino, Italy
//  Email         : francescoangione8@gmail.com
//
//  Description   : 
//
//
//==================================================================================================


`timescale 1ns / 1ps
`include "precision_def.vh"

module tb_fp_units();
parameter clk_period= 10;


/* -----vhdl declaration -------------
pipelined
ENTITY FPmul IS
   PORT( 
      FP_A : IN     std_logic_vector (31 DOWNTO 0);
      FP_B : IN     std_logic_vector (31 DOWNTO 0);
      clk  : IN     std_logic;
      FP_Z : OUT    std_logic_vector (31 DOWNTO 0)
   );

-- Declarations

END FPmul ;

// no pipeliend
ENTITY FPmul_sc IS
   PORT( 
      FP_A : IN     std_logic_vector (31 DOWNTO 0);
      FP_B : IN     std_logic_vector (31 DOWNTO 0);
      clk  : IN     std_logic;
      FP_Z : OUT    std_logic_vector (31 DOWNTO 0)
   );

-- Declarations

END FPmul_sc ;



*/

logic clk;
logic [31:0]a;
logic [31:0]b;
logic [31:0]z;
logic [31:0]z_sc;
logic [31:0]z_add;
logic [31:0]z_add_sc;

FPmul uut_mul(.FP_A(a),.FP_B(b),.FP_Z(z),.clk(clk));
FPmul_sc uut_mul_sc(.FP_A(a),.FP_B(b),.FP_Z(z_sc),.clk(clk));


/*
pipeline
ENTITY FPadd IS
   PORT( 
      ADD_SUB : IN     std_logic;
      FP_A    : IN     std_logic_vector (31 DOWNTO 0);
      FP_B    : IN     std_logic_vector (31 DOWNTO 0);
      clk     : IN     std_logic;
      FP_Z    : OUT    std_logic_vector (31 DOWNTO 0)
   );

-- Declarations

END FPadd ;

single cycle
ENTITY FPadd_sc IS
   PORT( 
      ADD_SUB : IN     std_logic;
      FP_A    : IN     std_logic_vector (31 DOWNTO 0);
      FP_B    : IN     std_logic_vector (31 DOWNTO 0);
      clk     : IN     std_logic;
      FP_Z    : OUT    std_logic_vector (31 DOWNTO 0)
   );

-- Declarations

END FPadd_sc ;
*/
FPadd uut_add(.ADD_SUB('1),.FP_A(a),.FP_B(b),.clk(clk),.FP_Z(z_add));
FPadd_sc uut_add_sc(.ADD_SUB('1),.FP_A(a),.FP_B(b),.clk(clk),.FP_Z(z_add_sc));



logic enable;
logic reset;
logic [3:0]select_precision;
logic  [1:0]enable_fp_unit;
logic active_chain;
real input_data;
real weight;
real res_mac_p;
real res_mac_next;
real res_mac_n_smac;

logic [63:0] input_data_bf;
logic [63:0]  weight_bf;
logic [63:0] res_mac_p_bf;

 smul #(.USE_FABRIC("YES")) // it does not matter for fp
 uut_smul_fp (
.clk             (clk),
.ce(enable),
.sclr(reset),
`ifndef  USE0_BFP16
.input_data(input_data),
.weight(weight),
`else 
.input_data(input_data_bf),
.weight(weight_bf),
`endif

.res_mac_next(res_mac_next),
.select_precision(select_precision),
.enable_fp_unit( enable_fp_unit),
 .active_chain(active_chain)
  );

 smac #(.USE_FABRIC("YES")) // it does not matter for fp
 uut_smac_fp(
.clk             (clk),
.ce(enable),
.sclr(reset),
`ifndef USE0_BFP16
    .data_input(input_data),
    .weight(weight),
    .res_mac_p(res_mac_p),
`else
    .data_input(input_data_bf),
    .weight(weight_bf),
    .res_mac_p(res_mac_p_bf),
`endif 
.res_mac_n(res_mac_n_smac),
.select_precision(select_precision),
.enable_fp_unit( enable_fp_unit),
 .active_chain(active_chain)
);


        

    always begin
    clk = 1'b1;
    #(clk_period/2) 
     clk = 1'b0;
    #(clk_period/2);
     end
                
    /// stimulus
    initial begin 
    $display("single test of fp units");

    a=32'h012345678;
    b=32'h9ABCDEF1;
    repeat(1)@ (posedge clk);
    $display("check the single cycle fp units");
    repeat(1)@ (posedge clk);


    // wait for results
    repeat(10)@ (posedge clk);

    if(z!==z_sc) begin 
    	$display("results are differents for multiplication ",);
    	$stop();
    end 
    if(z_add!==z_add_sc)begin 

    	$display("results are different for addition",);
    	$stop();
    end 
    repeat(1)@(posedge clk);
    $display("test the fp units integrated into the smac and smul subunits");
    `ifdef  USE0_FP32
    $display("testing floating point 32",);
    `elsif  USE0_FP16
    $display("testing floating point 16",);
    `elsif  USE0_BFP16  
    $display("testing brain floating point 16 using 32 bit hardware",);
    `endif

    reset='1;
    enable='0;
    enable_fp_unit='1;
    active_chain='0;
    select_precision=`INT32; //MATCHIGN THE SAME precision 
    repeat(1)@(posedge clk);
    reset='0;
    enable='1;
    // upper part is discarded
    `ifndef USE0_BFP16
    input_data={32'd0,32'hCAFECAFE } ;
    weight={32'd0, 32'HFFFFFFFF} ;
    res_mac_p={32'd0,32'h000000001 } ;
    `else
    input_data_bf={32'd0,16'hCAFE } ;
    weight_bf={32'd0, 16'HFFFF} ;
    res_mac_p_bf={32'd0,16'h00001 } ;
    `endif
    repeat(10)@(posedge clk);

    $display("check result");
    //todo clever check
    if((res_mac_next-$bitstoreal(input_data*weight))<=0.000001)begin
      $display("result of smuls is incorrect",);
      //$stop();
    end 
    if((res_mac_n_smac-$bitstoreal((input_data*weight)+res_mac_p))<=0.000001)begin
      $display("result of smac is incorrect");
    //  $stop();
    end
    

    $display("TEST IS PASSED!");
    $finish();
   end 

endmodule
