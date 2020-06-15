//==================================================================================================
//  Filename      : tb_hint.sv
//  Created On    : 2020-05-09 23:47:05
//  Last Modified : 2020-05-31 16:45:13
//  Revision      : 
//  Author        : Angione Francesco
//  Company       : Chalmers University of Technology, Sweden - Politecnico di Torino, Italy
//  Email         : francescoangione8@gmail.com angione@student.chalmers.se s262620@studenti.polito.it  
//
//  Description   : testbench in sv for testing also the axi protocol outcome
//
//
//==================================================================================================

`timescale 1ns / 1ps



/*synthesizable*/
interface example ();
logic banan;

modport random (output banan);
endinterface

// normally instantiated inside interfaces
clocking ran clk_event:
item list;
  endclocking ran

clocking bus @(posedge clk);
  parameter INPUT_SKEW=1;
  default inoo #10;
  input #3 banan;
  endclocking

  // program block simimlat to a module for solving race condition
  program
    helloWorld();
    initial
    begin: hello
      $display("helloWorld",);
    end

    initial
    begin: there
      $display("hello there",);
    end 
  endprogram: helloWorld

sequence d (data,en);
  (!en) #1 data=0;
endsequence

// if start match execture the next
// with |=> evaluation start in next cc otherwise it is overlapped
property p1;
  @(posedge clk) disable iff(!active)
  start |-> request ##2 (grant==1);
endproperty

  assert property (p1); // property can be concatenated with logical operators 
// inside property first_match , within and throughout
//also if then else in property


// there can be local variable and fucntion calls in property
//$rose  1 -> , $fell 0->  // used when the changes happen between 2 clock events
// $stable , $past for sample in the past


// ## number of sample edges or delay ##[1:5] it can be checkef for the next 4cc
// $ -> infinite number of cycles
// [*3] sequence of 3 events must be true for 3 consecutive cc
// [=3] sequence of 3 event which can be non consecutive [=3:5] min 3 max 4