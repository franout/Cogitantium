`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 14:38:54
// Design Name: 
// Module Name: tb_smac
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_ls_array(    );

parameter clk_period= 10;
parameter ROWS=8;
parameter COLUMNS=8;
parameter data_in_mem=64 ;
parameter data_in_width=64;
parameter address_leng_wm=32;

reg clk,resetn,enable,enable_load,enable_store;
reg [63:0] data_load_input;
reg [63:0] data_store_input;
reg [3:0] select_precision;
reg infifo_read;
reg outfifo_write;
reg read_weight_memory;
reg [data_in_width-1:0] input_data_from_fifo;
reg enable_cnt;
reg ld_max_cnt;
reg enable_down_cnt;
reg ld_max_down_cnt;
reg [$clog2(COLUMNS):0]max_cnt_from_cu;
reg [$clog2(ROWS):0]max_down_cnt_from_cu;
reg enable_cnt_weight;
reg ld_max_cnt_weight;
reg [$clog2(ROWS):0]max_cnt_weight_from_cu;
reg enable_load_activation_data;
reg enable_store_activation_data;
reg [data_in_mem-1:0]data_from_weight_memory;
reg [data_in_width*ROWS-1:0]data_from_mxu;


wire [data_in_width*COLUMNS-1:0] data_to_mxu;
wire [data_in_width*ROWS-1:0] weight_to_mxu;
wire [data_in_width-1:0]data_to_fifo_out;
wire  [address_leng_wm-1:0]wm_address;
wire [63:0]data_load_output; 
wire [63:0] data_store_output;

ls_unit #(data_in_width) uut_ls_unit (
 .clk(clk),
 .resetn(resetn),
 .enable(enable),
 .load_enable(enable_load),
 .store_enable(enable_store),
 .data_load_input(data_load_input),
 .data_load_output(data_load_output),
 .data_store_input(data_store_input),
 .data_store_output(data_store_output)
);



ls_array 
#( .ROWS(ROWS),
    .COLUMNS(COLUMNS),
    .max_data_width(8),
    .data_in_width(data_in_width),
    .data_in_mem(data_in_mem),
    .address_leng_wm(address_leng_wm)) uut_ls_array
( 
.clk(clk),
.reset_n(resetn),
.enable_load_array(enable),
.data_precision(select_precision),
.infifo_read(infifo_read),
.outfifo_write(outfifo_write),
.read_weight_memory(read_weight_memory),
.input_data_from_fifo(input_data_from_fifo),
.data_to_fifo_out(data_to_fifo_out),
.enable_load_activation_data(enable_load_activation_data),
.enable_store_activation_data(enable_store_activation_data),
.data_from_weight_memory(data_from_weight_memory),
.data_from_mxu(data_from_mxu),
.data_to_mxu(data_to_mxu),
.weight_to_mxu(weight_to_mxu),
.wm_address(wm_address),
.enable_cnt(enable_cnt),
.ld_max_cnt(ld_max_cnt),
.enable_down_cnt(enable_down_cnt),
.ld_max_down_cnt(ld_max_down_cnt),
.max_cnt_from_cu(max_cnt_from_cu),
.max_down_cnt_from_cu(max_down_cnt_from_cu),
.enable_cnt_weight(enable_cnt_weight),
.ld_max_cnt_weight(ld_max_cnt_weight),
.max_cnt_weight_from_cu(max_cnt_weight_from_cu)
);

      always begin
         clk = 1'b1;
         #(clk_period/2) 
         clk = 1'b0;
         #(clk_period/2);
      end
       integer i,OK;

// no mxu in the middle 
    
    always @(data_to_mxu) begin 
     data_from_mxu= data_to_mxu;
    end 


        initial begin
        OK=1;
        enable_load=1'b0;
        enable_store=1'b0;
        $display("global reset");
        resetn=1'b1;
        enable=1'b0;
        #clk_period;
        if(!(data_store_output==64'd0 && data_load_output==64'd0))begin 
          OK=0;
        end
        resetn=1'b0;
        data_load_input=64'hAAAAAAAAAAAAAAAA;
        #clk_period;  
        if(!(data_store_output==64'd0 && data_load_output==64'd0))begin 
          OK=0;
        end
        $display("CHECK of load store units of activation data");
        // load 
        data_load_input=64'hAAAAAAAAAAAAAAAA;
        enable_load=1'b1;
        enable=1'b1;
        #clk_period;#clk_period;
        if((data_load_output!=64'hAAAAAAAAAAAAAAAA))begin
          OK=0;
        end
        enable_load=1'b0; 
        #clk_period;
        // store
        data_store_input=64'hBBBBBBBBBBBBBBBB;
        enable_store=1'b1;
        enable=1'b1;
        #clk_period;#clk_period;
        if((data_store_output!=64'hBBBBBBBBBBBBBBBB))begin
          OK=0;
        end 
        enable_store=1'b0;
        // load 2 
        data_load_input=64'h1111111111111111;
        enable_load=1'b0;
        enable=1'b1;
        #clk_period;#clk_period;
        if((data_load_output==64'h1111111111111111))begin
          OK=0;
        end 
        enable_load=1'b0;
        // store 2 
        data_store_input=64'hFFFFFFFFFFFFFFFF;
        enable_store=1'b0;
        enable=1'b1;
        #clk_period;#clk_period;
        if((data_store_output==64'hFFFFFFFFFFFFFFFF))begin
          OK=0;
        end     
        enable_store=1'b0;
        #clk_period;
        if (OK!=1) begin 
        $display("load store subunits do not pass the test");
        $finish();
        end  


        ///////////////////////////////////////////////////
        ////////////////  8  BIT //////////////////////////
        ///////////////////////////////////////////////////
        data_from_weight_memory= 64'hFFFFFFFFFFFFFFFF;
        input_data_from_fifo=64'hCAFECAFECAFECAFE ;
        max_cnt_from_cu=COLUMNS ;
        max_down_cnt_from_cu= ROWS;
        max_cnt_weight_from_cu= ROWS;
        ld_max_down_cnt=1'b0 ;
        ld_max_cnt=1'b0 ;
        ld_max_cnt_weight=1'b0 ;

        select_precision=4'h0;
        infifo_read=1'b0 ;
        outfifo_write=1'b0 ;
        read_weight_memory=1'b0 ;        
        enable_cnt=1'b0 ;
        enable_down_cnt=1'b0 ;
        enable_cnt_weight=1'b0;
        enable_load_activation_data= 1'b0;
        enable_store_activation_data=1'b0 ;
            
        $display("Check of load store unit + filter select and compacter for activation data and output data");
        $display("global reset");
        enable=1'b0;
        resetn=1'b1;
        #clk_period;
        resetn=1'b0;
        #clk_period;
        if( data_to_mxu!=64'd0 || weight_to_mxu!=64'd0 || data_to_fifo_out!=64'd0 || wm_address!=64'd0) begin 
            $display("WRONG INIT");
            OK=0;
        end 
        #clk_period;
        if( data_to_mxu!=64'd0 || weight_to_mxu!=64'd0 || data_to_fifo_out!=64'd0 || wm_address!=64'd0) begin 
            $display("WRONG it works even without enable signals");
            OK=0;
        end 
        max_cnt_from_cu=1 ;
        max_down_cnt_from_cu= 1;
        max_cnt_weight_from_cu= ROWS;
        select_precision<=4'h1;
        $display("precision 8bit");    
        enable=1'b1;
        #clk_period;
        $display("enable and load max value for coutners");
        ld_max_down_cnt=1'b1 ;
        ld_max_cnt=1'b1;
        ld_max_cnt_weight=1'b1;        
        #clk_period;
        ld_max_down_cnt=1'b0 ;
        ld_max_cnt=1'b0;
        ld_max_cnt_weight=1'b0;
        infifo_read=1'b1 ;
        outfifo_write=1'b0 ;
        read_weight_memory=1'b1 ;        
        enable_cnt=1'b1 ;
        enable_down_cnt=1'b1 ;
        enable_cnt_weight=1'b1;
        enable_load_activation_data= 1'b1;
        enable_store_activation_data=1'b1 ;
               
        $display("read from fifo and store in the internal register of ls units");

        $display("wait for some time for the mxu, check the correct generation of weight address (incremental)");
        #clk_period;
        if(wm_address!=32'd0)begin
            $display("PROBLEM WITH ADDRESS GENERATION");
            OK=0;
        end
        #clk_period;
        if(wm_address!=32'd1)begin
            $display("PROBLEM WITH ADDRESS GENERATION");
            OK=0;
        end
        $display("check the page increment");
        for(i=0;i< ROWS+2 ;i=i+1)begin
                #clk_period;
        end 
        

        $display("outfifo read");
        infifo_read=1'b0 ;
        outfifo_write=1'b1 ;
        read_weight_memory=1'b0 ;        
        enable_cnt=1'b0 ;
        enable_down_cnt=1'b0 ;
        enable_cnt_weight=1'b0;
        enable_load_activation_data= 1'b0;
        enable_store_activation_data=1'b1 ;
        #clk_period;
        #clk_period;

        #clk_period;
        if(data_to_fifo_out!=input_data_from_fifo) begin
            $display("input and output data to fifo are different");
            OK=0;
        end
        if (OK!=1) begin 
        $display("load store array does not pass the test for 8 bits");
        $finish();
        end  





        ///////////////////////////////////////////////////
        ////////////////  16 BIT //////////////////////////
        ///////////////////////////////////////////////////
        data_from_weight_memory= 64'hFFFFFFFFFFFFFFFF;
        input_data_from_fifo=64'hCAFECAFECAFECAFE ;
        max_cnt_from_cu=COLUMNS ;
        max_down_cnt_from_cu= ROWS;
        max_cnt_weight_from_cu= ROWS;
        ld_max_down_cnt=1'b0 ;
        ld_max_cnt=1'b0 ;
        ld_max_cnt_weight=1'b0 ;

        infifo_read=1'b0 ;
        outfifo_write=1'b0 ;
        read_weight_memory=1'b0 ;        
        enable_cnt=1'b0 ;
        enable_down_cnt=1'b0 ;
        enable_cnt_weight=1'b0;
        enable_load_activation_data= 1'b0;
        enable_store_activation_data=1'b0 ;
        
        #clk_period;
        max_cnt_from_cu=2 ;
        max_down_cnt_from_cu= 2;
        max_cnt_weight_from_cu= ROWS;
        select_precision<=4'h3;
        $display("precision 16bit");
        #clk_period;
        #clk_period;
        $display("enable and load max value for coutners");
        ld_max_down_cnt=1'b1 ;
        ld_max_cnt=1'b1;
        ld_max_cnt_weight=1'b1;        
        #clk_period;
        ld_max_down_cnt=1'b0 ;
        ld_max_cnt=1'b0;
        ld_max_cnt_weight=1'b0;
        infifo_read=1'b1 ;
        outfifo_write=1'b0 ;
        read_weight_memory=1'b1 ;        
        enable_cnt=1'b1 ;
        enable_down_cnt=1'b1 ;
        enable_cnt_weight=1'b1;
        enable_load_activation_data= 1'b1;
        enable_store_activation_data=1'b1 ;
               
        $display("read from fifo and store in the internal register of ls units");

        $display("wait for some time for the mxu, check the correct generation of weight address (incremental)");
        #clk_period;
        if(wm_address!=32'd0)begin
            $display("PROBLEM WITH ADDRESS GENERATION");
            OK=0;
        end
        #clk_period;
        if(wm_address!=32'd1)begin
            $display("PROBLEM WITH ADDRESS GENERATION");
            OK=0;
        end
        $display("check the page increment");
        for(i=0;i< ROWS+2 ;i=i+1)begin
                #clk_period;
        end 
        

        $display("outfifo read");
        infifo_read=1'b0 ;
        outfifo_write=1'b1 ;
        read_weight_memory=1'b0 ;        
        enable_cnt=1'b0 ;
        enable_down_cnt=1'b0 ;
        enable_cnt_weight=1'b0;
        enable_load_activation_data= 1'b0;
        enable_store_activation_data=1'b1 ;
        #clk_period;
        #clk_period;

        #clk_period;
        if(data_to_fifo_out!=input_data_from_fifo) begin
            $display("input and output data to fifo are different ON 16 BIT");
            OK=0;
        end
        if (OK!=1) begin 
        $display("load store array does not pass the test for 16 bits");
        $finish();
        end  



        ///////////////////////////////////////////////////
        ////////////////  32 BIT //////////////////////////
        ///////////////////////////////////////////////////
        data_from_weight_memory= 64'hFFFFFFFFFFFFFFFF;
        input_data_from_fifo=64'hCAFECAFECAFECAFE ;
        max_cnt_from_cu=COLUMNS ;
        max_down_cnt_from_cu= ROWS;
        max_cnt_weight_from_cu= ROWS;
        ld_max_down_cnt=1'b0 ;
        ld_max_cnt=1'b0 ;
        ld_max_cnt_weight=1'b0 ;

        select_precision=4'h0;
        infifo_read=1'b0 ;
        outfifo_write=1'b0 ;
        read_weight_memory=1'b0 ;        
        enable_cnt=1'b0 ;
        enable_down_cnt=1'b0 ;
        enable_cnt_weight=1'b0;
        enable_load_activation_data= 1'b0;
        enable_store_activation_data=1'b0 ;
        
        #clk_period;
        max_cnt_from_cu=4 ;
        max_down_cnt_from_cu= 4;
        max_cnt_weight_from_cu= ROWS;
        select_precision<=4'h7;
        $display("precision 32bit");
        #clk_period;
        #clk_period;
        $display("enable and load max value for coutners");
        ld_max_down_cnt=1'b1 ;
        ld_max_cnt=1'b1;
        ld_max_cnt_weight=1'b1;        
        #clk_period;
        ld_max_down_cnt=1'b0 ;
        ld_max_cnt=1'b0;
        ld_max_cnt_weight=1'b0;
        infifo_read=1'b1 ;
        outfifo_write=1'b0 ;
        read_weight_memory=1'b1 ;        
        enable_cnt=1'b1 ;
        enable_down_cnt=1'b1 ;
        enable_cnt_weight=1'b1;
        enable_load_activation_data= 1'b1;
        enable_store_activation_data=1'b1 ;
               
        $display("read from fifo and store in the internal register of ls units");

        $display("wait for some time for the mxu, check the correct generation of weight address (incremental)");
        #clk_period;
        if(wm_address!=32'd0)begin
            $display("PROBLEM WITH ADDRESS GENERATION");
            OK=0;
        end
        #clk_period;
        if(wm_address!=32'd1)begin
            $display("PROBLEM WITH ADDRESS GENERATION");
            OK=0;
        end
        $display("check the page increment");
        for(i=0;i< ROWS+2 ;i=i+1)begin
                #clk_period;
        end 
        

        $display("outfifo read");
        infifo_read=1'b0 ;
        outfifo_write=1'b1 ;
        read_weight_memory=1'b0 ;        
        enable_cnt=1'b0 ;
        enable_down_cnt=1'b0 ;
        enable_cnt_weight=1'b0;
        enable_load_activation_data= 1'b0;
        enable_store_activation_data=1'b1 ;
        #clk_period;
        #clk_period;

        #clk_period;
        if(data_to_fifo_out!=input_data_from_fifo) begin
            $display("input and output data to fifo are different ON 32 BIT");
            OK=0;
        end
        if (OK!=1) begin 
        $display("load store array does not pass the test for 32 bits");
        $finish();
        end  




        ///////////////////////////////////////////////////
        ////////////////  64 BIT //////////////////////////
        ///////////////////////////////////////////////////
        data_from_weight_memory= 64'hFFFFFFFFFFFFFFFF;
        input_data_from_fifo=64'hCAFECAFECAFECAFE ;
        max_cnt_from_cu=COLUMNS ;
        max_down_cnt_from_cu= ROWS;
        max_cnt_weight_from_cu= ROWS;
        ld_max_down_cnt=1'b0 ;
        ld_max_cnt=1'b0 ;
        ld_max_cnt_weight=1'b0 ;

        select_precision=4'h0;
        infifo_read=1'b0 ;
        outfifo_write=1'b0 ;
        read_weight_memory=1'b0 ;        
        enable_cnt=1'b0 ;
        enable_down_cnt=1'b0 ;
        enable_cnt_weight=1'b0;
        enable_load_activation_data= 1'b0;
        enable_store_activation_data=1'b0 ;
        
        #clk_period;
        max_cnt_from_cu=COLUMNS ;
        max_down_cnt_from_cu= COLUMNS;
        max_cnt_weight_from_cu= ROWS;
        select_precision<=4'hf;
        $display("precision 64bit");
        #clk_period;
        #clk_period;
        $display("enable and load max value for coutners");
        ld_max_down_cnt=1'b1 ;
        ld_max_cnt=1'b1;
        ld_max_cnt_weight=1'b1;        
        #clk_period;
        ld_max_down_cnt=1'b0 ;
        ld_max_cnt=1'b0;
        ld_max_cnt_weight=1'b0;
        infifo_read=1'b1 ;
        outfifo_write=1'b0 ;
        read_weight_memory=1'b1 ;        
        enable_cnt=1'b1 ;
        enable_down_cnt=1'b1 ;
        enable_cnt_weight=1'b1;
        enable_load_activation_data= 1'b1;
        enable_store_activation_data=1'b1 ;
               
        $display("read from fifo and store in the internal register of ls units");

        $display("wait for some time for the mxu, check the correct generation of weight address (incremental)");
        #clk_period;
        if(wm_address!=32'd0)begin
            $display("PROBLEM WITH ADDRESS GENERATION");
            OK=0;
        end
        #clk_period;
        if(wm_address!=32'd1)begin
            $display("PROBLEM WITH ADDRESS GENERATION");
            OK=0;
        end
        $display("check the page increment");
        for(i=0;i< ROWS+2 ;i=i+1)begin
                #clk_period;
        end 
        

        $display("outfifo read");
        infifo_read=1'b0 ;
        outfifo_write=1'b1 ;
        read_weight_memory=1'b0 ;        
        enable_cnt=1'b0 ;
        enable_down_cnt=1'b0 ;
        enable_cnt_weight=1'b0;
        enable_load_activation_data= 1'b0;
        enable_store_activation_data=1'b1 ;
        #clk_period;
        #clk_period;

        #clk_period;
        if(data_to_fifo_out!=input_data_from_fifo) begin
            $display("input and output data to fifo are different ON 64 BIT");
            OK=0;
        end
        if (OK!=1) begin 
        $display("load store array does not pass the test for 64 bits");
        $finish();
        end  



        

        $finish();
        end

endmodule
