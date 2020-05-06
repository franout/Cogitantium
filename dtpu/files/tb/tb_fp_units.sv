
//==================================================================================================
//  Filename      : tb_fp_units.sv
//  Created On    : 2020-04-22 17:05:25
//  Last Modified : 2020-05-06 11:17:15
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

module tb_fp_units();

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

FPmul(.FP_A(a),.FP_B(b),.FP_Z(z),.clk(clk));
FPmul_sc(.FP_A(a),.FP_B(b),.FP_Z(z_sc),.clk(clk));


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
FPadd(.ADD_SUB('1),.FP_A(a),FP_B(b),.clk(clk),.FP_Z(z_add));
FPadd_sc(.ADD_SUB('1),.FP_A(a),FP_B(b),.clk(clk),.FP_Z(z_add_sc));

    always begin
    clk = 1'b1;
    #(clk_period/2) 
     clk = 1'b0;
    #(clk_period/2);
     end
                
    integer i;                   
    /// stimulus
    initial begin 
    $display("single test of fp units");

    a=32'h012345678;
    b=32'h9ABCDEF12;
    repeat(1)@ (posedge clk);
    $display("check the single cycle fp units");
    repeat(1)@ (posedge clk);


    // wait for results
    repeat(30)@ (posedge clk);

    if(z_s!=z_sc) begin 
    	$display("results are differents for multiplication ",);
    	$stop();
    end 
    if(z_add!=z_add_sc)begin 

    	$display("results are different for addition",);
    	$stop();
    end 
    $display("not test the fp units integrated into the smac and smul subunits");

    
    $finish();
   end 

endmodule
