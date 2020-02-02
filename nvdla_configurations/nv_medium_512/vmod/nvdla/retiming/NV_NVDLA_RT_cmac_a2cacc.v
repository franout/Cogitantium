// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_RT_cmac_a2cacc.v
// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_CMAC.h
`define DESIGNWARE_NOEXIST 1
module NV_NVDLA_RT_cmac_a2cacc (
   nvdla_core_clk
  ,nvdla_core_rstn
  ,mac2accu_src_pvld
  ,mac2accu_src_mask
  ,mac2accu_src_mode
//: for(my $i=0; $i<16/2; $i++){
//: print qq(
//: ,mac2accu_src_data${i} )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

,mac2accu_src_data0 
,mac2accu_src_data1 
,mac2accu_src_data2 
,mac2accu_src_data3 
,mac2accu_src_data4 
,mac2accu_src_data5 
,mac2accu_src_data6 
,mac2accu_src_data7 
//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,mac2accu_src_pd
  ,mac2accu_dst_pvld
  ,mac2accu_dst_mask
  ,mac2accu_dst_mode
//: for(my $i=0; $i<16/2; $i++){
//: print qq(
//: ,mac2accu_dst_data${i} )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

,mac2accu_dst_data0 
,mac2accu_dst_data1 
,mac2accu_dst_data2 
,mac2accu_dst_data3 
,mac2accu_dst_data4 
,mac2accu_dst_data5 
,mac2accu_dst_data6 
,mac2accu_dst_data7 
//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,mac2accu_dst_pd
  );
input nvdla_core_clk;
input nvdla_core_rstn;
input mac2accu_src_pvld; /* data valid */
input [16/2 -1:0] mac2accu_src_mask;
input mac2accu_src_mode;
//: for(my $i=0; $i<16/2; $i++){
//: print qq(
//: input [21 -1:0] mac2accu_src_data${i}; )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

input [21 -1:0] mac2accu_src_data0; 
input [21 -1:0] mac2accu_src_data1; 
input [21 -1:0] mac2accu_src_data2; 
input [21 -1:0] mac2accu_src_data3; 
input [21 -1:0] mac2accu_src_data4; 
input [21 -1:0] mac2accu_src_data5; 
input [21 -1:0] mac2accu_src_data6; 
input [21 -1:0] mac2accu_src_data7; 
//| eperl: generated_end (DO NOT EDIT ABOVE)
input [8:0] mac2accu_src_pd;
output mac2accu_dst_pvld; /* data valid */
output [16/2 -1:0] mac2accu_dst_mask;
output mac2accu_dst_mode;
//: for(my $i=0; $i<16/2; $i++){
//: print qq(
//: output [21 -1:0] mac2accu_dst_data${i}; )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

output [21 -1:0] mac2accu_dst_data0; 
output [21 -1:0] mac2accu_dst_data1; 
output [21 -1:0] mac2accu_dst_data2; 
output [21 -1:0] mac2accu_dst_data3; 
output [21 -1:0] mac2accu_dst_data4; 
output [21 -1:0] mac2accu_dst_data5; 
output [21 -1:0] mac2accu_dst_data6; 
output [21 -1:0] mac2accu_dst_data7; 
//| eperl: generated_end (DO NOT EDIT ABOVE)
output [8:0] mac2accu_dst_pd;
wire mac2accu_pvld_d0 = mac2accu_src_pvld;
wire [8:0] mac2accu_pd_d0 = mac2accu_src_pd;
wire [16/2 -1:0] mac2accu_mask_d0 = mac2accu_src_mask;
wire mac2accu_mode_d0 = mac2accu_src_mode;
//: my $delay = 2;
//: my $i;
//: my $j;
//: my $k;
//: my $kk=16/2;
//: my $jj=21;
//: for($k = 0; $k <16/2; $k ++) {
//: print "assign mac2accu_data${k}_d0 = mac2accu_src_data${k};\n";
//: }
//:
//: for($i = 0; $i < $delay; $i ++) {
//: $j = $i + 1;
//: &eperl::flop("-q mac2accu_pvld_d${j} -d mac2accu_pvld_d${i}");
//: &eperl::flop("-wid 9 -q mac2accu_pd_d${j} -en mac2accu_pvld_d${i} -d  mac2accu_pd_d${i}");
//: &eperl::flop("-q mac2accu_mode_d${j} -en mac2accu_pvld_d${i} -d  mac2accu_mode_d${i}");
//: &eperl::flop("-wid ${kk} -q mac2accu_mask_d${j} -d mac2accu_mask_d${i}");
//: for($k = 0; $k < 16/2; $k ++) {
//: &eperl::flop("-wid ${jj} -q mac2accu_data${k}_d${j} -en mac2accu_mask_d${i}[${k}] -d  mac2accu_data${k}_d${i}");
//: }
//: }
//:
//: $i = $delay;
//: print "assign mac2accu_dst_pvld = mac2accu_pvld_d${i};\n";
//: print "assign mac2accu_dst_pd = mac2accu_pd_d${i};\n";
//: print "assign mac2accu_dst_mask = mac2accu_mask_d${i};\n";
//: print "assign mac2accu_dst_mode = mac2accu_mode_d${i};\n";
//: for($k = 0; $k <16/2; $k ++) {
//: print "assign mac2accu_dst_data${k} = mac2accu_data${k}_d${i};\n";
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
assign mac2accu_data0_d0 = mac2accu_src_data0;
assign mac2accu_data1_d0 = mac2accu_src_data1;
assign mac2accu_data2_d0 = mac2accu_src_data2;
assign mac2accu_data3_d0 = mac2accu_src_data3;
assign mac2accu_data4_d0 = mac2accu_src_data4;
assign mac2accu_data5_d0 = mac2accu_src_data5;
assign mac2accu_data6_d0 = mac2accu_src_data6;
assign mac2accu_data7_d0 = mac2accu_src_data7;
reg  mac2accu_pvld_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_pvld_d1 <= 'b0;
   end else begin
       mac2accu_pvld_d1 <= mac2accu_pvld_d0;
   end
end
reg [8:0] mac2accu_pd_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_pd_d1 <= 'b0;
   end else begin
       if ((mac2accu_pvld_d0) == 1'b1) begin
           mac2accu_pd_d1 <= mac2accu_pd_d0;
       // VCS coverage off
       end else if ((mac2accu_pvld_d0) == 1'b0) begin
       end else begin
           mac2accu_pd_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg  mac2accu_mode_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_mode_d1 <= 'b0;
   end else begin
       if ((mac2accu_pvld_d0) == 1'b1) begin
           mac2accu_mode_d1 <= mac2accu_mode_d0;
       // VCS coverage off
       end else if ((mac2accu_pvld_d0) == 1'b0) begin
       end else begin
           mac2accu_mode_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] mac2accu_mask_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_mask_d1 <= 'b0;
   end else begin
       mac2accu_mask_d1 <= mac2accu_mask_d0;
   end
end
reg [20:0] mac2accu_data0_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data0_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[0]) == 1'b1) begin
           mac2accu_data0_d1 <= mac2accu_data0_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[0]) == 1'b0) begin
       end else begin
           mac2accu_data0_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [20:0] mac2accu_data1_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data1_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[1]) == 1'b1) begin
           mac2accu_data1_d1 <= mac2accu_data1_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[1]) == 1'b0) begin
       end else begin
           mac2accu_data1_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [20:0] mac2accu_data2_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data2_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[2]) == 1'b1) begin
           mac2accu_data2_d1 <= mac2accu_data2_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[2]) == 1'b0) begin
       end else begin
           mac2accu_data2_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [20:0] mac2accu_data3_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data3_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[3]) == 1'b1) begin
           mac2accu_data3_d1 <= mac2accu_data3_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[3]) == 1'b0) begin
       end else begin
           mac2accu_data3_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [20:0] mac2accu_data4_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data4_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[4]) == 1'b1) begin
           mac2accu_data4_d1 <= mac2accu_data4_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[4]) == 1'b0) begin
       end else begin
           mac2accu_data4_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [20:0] mac2accu_data5_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data5_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[5]) == 1'b1) begin
           mac2accu_data5_d1 <= mac2accu_data5_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[5]) == 1'b0) begin
       end else begin
           mac2accu_data5_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [20:0] mac2accu_data6_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data6_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[6]) == 1'b1) begin
           mac2accu_data6_d1 <= mac2accu_data6_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[6]) == 1'b0) begin
       end else begin
           mac2accu_data6_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [20:0] mac2accu_data7_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data7_d1 <= 'b0;
   end else begin
       if ((mac2accu_mask_d0[7]) == 1'b1) begin
           mac2accu_data7_d1 <= mac2accu_data7_d0;
       // VCS coverage off
       end else if ((mac2accu_mask_d0[7]) == 1'b0) begin
       end else begin
           mac2accu_data7_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg  mac2accu_pvld_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_pvld_d2 <= 'b0;
   end else begin
       mac2accu_pvld_d2 <= mac2accu_pvld_d1;
   end
end
reg [8:0] mac2accu_pd_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_pd_d2 <= 'b0;
   end else begin
       if ((mac2accu_pvld_d1) == 1'b1) begin
           mac2accu_pd_d2 <= mac2accu_pd_d1;
       // VCS coverage off
       end else if ((mac2accu_pvld_d1) == 1'b0) begin
       end else begin
           mac2accu_pd_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg  mac2accu_mode_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_mode_d2 <= 'b0;
   end else begin
       if ((mac2accu_pvld_d1) == 1'b1) begin
           mac2accu_mode_d2 <= mac2accu_mode_d1;
       // VCS coverage off
       end else if ((mac2accu_pvld_d1) == 1'b0) begin
       end else begin
           mac2accu_mode_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] mac2accu_mask_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_mask_d2 <= 'b0;
   end else begin
       mac2accu_mask_d2 <= mac2accu_mask_d1;
   end
end
reg [20:0] mac2accu_data0_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data0_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[0]) == 1'b1) begin
           mac2accu_data0_d2 <= mac2accu_data0_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[0]) == 1'b0) begin
       end else begin
           mac2accu_data0_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [20:0] mac2accu_data1_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data1_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[1]) == 1'b1) begin
           mac2accu_data1_d2 <= mac2accu_data1_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[1]) == 1'b0) begin
       end else begin
           mac2accu_data1_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [20:0] mac2accu_data2_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data2_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[2]) == 1'b1) begin
           mac2accu_data2_d2 <= mac2accu_data2_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[2]) == 1'b0) begin
       end else begin
           mac2accu_data2_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [20:0] mac2accu_data3_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data3_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[3]) == 1'b1) begin
           mac2accu_data3_d2 <= mac2accu_data3_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[3]) == 1'b0) begin
       end else begin
           mac2accu_data3_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [20:0] mac2accu_data4_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data4_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[4]) == 1'b1) begin
           mac2accu_data4_d2 <= mac2accu_data4_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[4]) == 1'b0) begin
       end else begin
           mac2accu_data4_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [20:0] mac2accu_data5_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data5_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[5]) == 1'b1) begin
           mac2accu_data5_d2 <= mac2accu_data5_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[5]) == 1'b0) begin
       end else begin
           mac2accu_data5_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [20:0] mac2accu_data6_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data6_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[6]) == 1'b1) begin
           mac2accu_data6_d2 <= mac2accu_data6_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[6]) == 1'b0) begin
       end else begin
           mac2accu_data6_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [20:0] mac2accu_data7_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mac2accu_data7_d2 <= 'b0;
   end else begin
       if ((mac2accu_mask_d1[7]) == 1'b1) begin
           mac2accu_data7_d2 <= mac2accu_data7_d1;
       // VCS coverage off
       end else if ((mac2accu_mask_d1[7]) == 1'b0) begin
       end else begin
           mac2accu_data7_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
assign mac2accu_dst_pvld = mac2accu_pvld_d2;
assign mac2accu_dst_pd = mac2accu_pd_d2;
assign mac2accu_dst_mask = mac2accu_mask_d2;
assign mac2accu_dst_mode = mac2accu_mode_d2;
assign mac2accu_dst_data0 = mac2accu_data0_d2;
assign mac2accu_dst_data1 = mac2accu_data1_d2;
assign mac2accu_dst_data2 = mac2accu_data2_d2;
assign mac2accu_dst_data3 = mac2accu_data3_d2;
assign mac2accu_dst_data4 = mac2accu_data4_d2;
assign mac2accu_dst_data5 = mac2accu_data5_d2;
assign mac2accu_dst_data6 = mac2accu_data6_d2;
assign mac2accu_dst_data7 = mac2accu_data7_d2;

//| eperl: generated_end (DO NOT EDIT ABOVE)
endmodule
