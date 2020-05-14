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
`include "precision_def.vh"
module tb_ls_array(    );

parameter clk_period= 10;
parameter ROWS=8;
parameter COLUMNS=8;
parameter data_in_mem=64 ;
parameter data_in_width=64;
parameter address_leng_wm=32;

logic clk,reset,enable,enable_load,enable_store;
logic [63:0] data_load_input;
logic [63:0] data_store_input;
logic [3:0] select_precision;
logic infifo_read;
logic outfifo_write;
logic [data_in_width-1:0] input_data_from_fifo;
logic enable_cnt;
logic ld_max_cnt;
logic [$clog2(COLUMNS):0]max_cnt_from_cu;
logic enable_cnt_weight;
logic ld_max_cnt_weight;
logic [$clog2(ROWS*COLUMNS):0]max_cnt_weight_from_cu;
logic [data_in_mem-1:0]data_from_weight_memory;
logic [data_in_width*ROWS-1:0]data_from_mxu;
logic [ROWS*COLUMNS-1:0]read_weight_memory;
logic [COLUMNS:0]enable_load_activation_data;
logic [COLUMNS:0]enable_store_activation_data;
logic [address_leng_wm-1:0]start_value_wm;
logic [data_in_width*COLUMNS-1:0] data_to_mxu;
logic [data_in_width*ROWS*COLUMNS-1:0] weight_to_mxu;
logic [data_in_width-1:0]data_to_fifo_out;
logic  [address_leng_wm-1:0]wm_address;
logic [63:0]data_load_output; 
logic [63:0] data_store_output;
logic ld_weight_page_cnt;

ls_unit #(data_in_width) uut_ls_unit (
 .clk(clk),
 .reset(reset),
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
    .data_in_width(data_in_width),
    .data_in_mem(data_in_mem),
    .address_leng_wm(address_leng_wm),
    .size_wmemory(2048)) uut_ls_array
( 
.clk(clk),
.reset(reset),
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
.start_value_wm(start_value_wm),
.ld_weight_page_cnt(ld_weight_page_cnt),
.ld_max_cnt(ld_max_cnt),
.max_cnt_from_cu(max_cnt_from_cu),
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
       integer i,OK,j;
       integer address;

// no mxu in the middle 
    always @(data_to_mxu) begin 
     data_from_mxu= data_to_mxu;
    end 


        initial begin
        OK=1;
        start_value_wm=0;
        enable_load=1'b0;
        enable_store=1'b0;
        $display("global reset");
        reset=1'b1;
        enable=1'b0;
        #clk_period;
        if(!(data_store_output==64'd0 && data_load_output==64'd0))begin 
          OK=0;
        end
        reset=1'b0;
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
        max_cnt_weight_from_cu= ROWS*COLUMNS;
        ld_max_cnt=1'b0 ;
        ld_max_cnt_weight=1'b0 ;

        select_precision=4'h0;
        infifo_read=1'b0 ;
        outfifo_write=1'b0 ;
        read_weight_memory=1'b0 ;        
        enable_cnt=1'b0 ;
        enable_cnt_weight=1'b0;
        enable_load_activation_data= 1'b0;
        enable_store_activation_data=1'b0 ;
            
        $display("Check of load store unit + filter select and compacter for activation data and output data");
        $display("global reset");
        enable=1'b0;
        reset=1'b1;
        #clk_period;
        reset=1'b0;
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
        start_value_wm=32'd0;
        max_cnt_weight_from_cu= ROWS*COLUMNS;
        select_precision<=`INT8;
        $display("precision 8bit");    
        enable=1'b1;
        #clk_period;
        $display("enable and load max value for coutners");
        ld_max_cnt=1'b1;
        ld_weight_page_cnt=1'b1;
        ld_max_cnt_weight=1'b1;        
        #clk_period;
        ld_weight_page_cnt=1'b0;
        ld_max_cnt=1'b0;
        ld_max_cnt_weight=1'b0;
        infifo_read=1'b1 ;
        outfifo_write=1'b0 ;
        // first ls unit for every row
        repeat(1)@(posedge clk);
        $display("loading weight",);
        enable_cnt=1'b1 ;
        enable_cnt_weight=1'b1;
        for(i=0;i<COLUMNS/(64/8);i=i+1)begin
        enable_load_activation_data|= (1'b1<<COLUMNS*i);
        enable_store_activation_data|=(1'b1<<COLUMNS*i);
        end 
         address=0;
        for(i=0;i<ROWS;i=i+1)begin 
            read_weight_memory=(1'b1<<(8*i));
            repeat(2)@(posedge clk);
        end
        read_weight_memory=0;
        
        $display("read from fifo and store in the internal register of ls units");

        $display("wait for some time for the mxu, check the correct generation of weight address (incremental)");
        #clk_period;
        $display("outfifo read");
        infifo_read=1'b0 ;
        outfifo_write=1'b1 ;
        read_weight_memory=1'b0 ;        
        enable_cnt=1'b0 ;
        enable_cnt_weight=1'b0;
        enable_load_activation_data= 1'b0;
        enable_store_activation_data=1'b1 ;
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
        max_cnt_weight_from_cu= ROWS*COLUMNS;
        ld_max_cnt=1'b0 ;
        ld_max_cnt_weight=1'b0 ;

        infifo_read=1'b0 ;
        outfifo_write=1'b0 ;
        read_weight_memory=1'b0 ;        
        enable_cnt=1'b0 ;
        enable_cnt_weight=1'b0;
        enable_load_activation_data= 0;
        enable_store_activation_data=0;
        
        #clk_period;
        max_cnt_from_cu=(COLUMNS/(64/16));
        select_precision<=`INT16;
        $display("precision 16bit");
        #clk_period;
         enable=1'b1;
        #clk_period;
        $display("enable and load max value for coutners");
        ld_max_cnt=1'b1;
        ld_weight_page_cnt=1'b1;
        ld_max_cnt_weight=1'b1;        
        #clk_period;
        ld_weight_page_cnt=1'b0;
        ld_max_cnt=1'b0;
        ld_max_cnt_weight=1'b0;
        repeat(1)@(posedge clk);
        enable_load_activation_data= (2'b01);
        infifo_read=1'b1 ;
        repeat(2)@(posedge clk);
        enable_load_activation_data= (2'b10);
        repeat(2)@(posedge clk);
        enable_store_activation_data=(2'b11);       
        outfifo_write=1'b0 ;
        // first ls unit for every row
        repeat(1)@(posedge clk);
        enable_cnt_weight=1'b1;
        enable_load_activation_data=0;
        enable_store_activation_data=0;
        $display("loading weight",);        
        for(i=0;i<ROWS;i=i+1)begin 
            read_weight_memory=(2'b11<<(8*i));
            repeat(2)@(posedge clk);
        end
        read_weight_memory=0;
        
        $display("read from fifo and store in the internal register of ls units");

        $display("wait for some time for the mxu, check the correct generation of weight address (incremental)");
        #clk_period;
        $display("outfifo read");
        infifo_read=1'b0 ;
        outfifo_write=1'b1 ;
        read_weight_memory=1'b0 ;        
        
        enable_cnt_weight=1'b0; 
        enable_cnt=1'b1 ; // start to count after the first chunk is gone 
        #clk_period;
            if(data_to_fifo_out!=input_data_from_fifo) begin
                $display("input and output data to fifo are different");
                OK=0;
            end
        #clk_period;
            if(data_to_fifo_out!=input_data_from_fifo) begin
                $display("input and output data to fifo are different");
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
        max_cnt_weight_from_cu= ROWS*COLUMNS;
        ld_max_cnt=1'b0 ;
        ld_max_cnt_weight=1'b0 ;

        infifo_read=1'b0 ;
        outfifo_write=1'b0 ;
        read_weight_memory=1'b0 ;        
        enable_cnt=1'b0 ;
        enable_cnt_weight=1'b0;
        enable_load_activation_data= 0;
        enable_store_activation_data=0;
        
        #clk_period;
        max_cnt_from_cu=(COLUMNS/(64/32));
        select_precision<=`INT32;
        $display("precision 32bit");
        #clk_period;
         enable=1'b1;
        #clk_period;
        $display("enable and load max value for coutners");
        ld_max_cnt=1'b1;
        ld_weight_page_cnt=1'b1;
        ld_max_cnt_weight=1'b1;        
        #clk_period;
        ld_weight_page_cnt=1'b0;
        ld_max_cnt=1'b0;
        ld_max_cnt_weight=1'b0;
        repeat(1)@(posedge clk);
        enable_load_activation_data= (4'h1);
        infifo_read=1'b1 ;
        repeat(2)@(posedge clk);
        enable_load_activation_data= (4'h2);
        repeat(2)@(posedge clk);
        enable_load_activation_data= (4'h4);
        repeat(2)@(posedge clk);
        enable_load_activation_data= (4'h8);
        repeat(2)@(posedge clk);
        enable_store_activation_data=(4'hF);       
        outfifo_write=1'b0 ;
        // first ls unit for every row
        repeat(1)@(posedge clk);
        enable_cnt_weight=1'b1;
        enable_load_activation_data=0;
        enable_store_activation_data=0;
        $display("loading weight",);        
        for(i=0;i<ROWS;i=i+1)begin 
            read_weight_memory=(4'hf<<(8*i));
            repeat(2)@(posedge clk);
        end
        read_weight_memory=0;
        
        $display("read from fifo and store in the internal register of ls units");

        $display("wait for some time for the mxu, check the correct generation of weight address (incremental)");
        #clk_period;
        $display("outfifo read");
        infifo_read=1'b0 ;
        outfifo_write=1'b1 ;
        read_weight_memory=1'b0 ;        
        
        enable_cnt_weight=1'b0; 
        enable_cnt=1'b1 ; // start to count after the first chunk is gone 
        #clk_period;
            if(data_to_fifo_out!=input_data_from_fifo) begin
                $display("input and output data to fifo are different");
                OK=0;
            end
        #clk_period;
            if(data_to_fifo_out!=input_data_from_fifo) begin
                $display("input and output data to fifo are different");
                OK=0;
            end
        #clk_period;
            if(data_to_fifo_out!=input_data_from_fifo) begin
                $display("input and output data to fifo are different");
                OK=0;
            end
        #clk_period;
            if(data_to_fifo_out!=input_data_from_fifo) begin
                $display("input and output data to fifo are different");
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
        max_cnt_weight_from_cu= ROWS*COLUMNS;
        ld_max_cnt=1'b0 ;
        ld_max_cnt_weight=1'b0 ;

        infifo_read=1'b0 ;
        outfifo_write=1'b0 ;
        read_weight_memory=1'b0 ;        
        enable_cnt=1'b0 ;
        enable_cnt_weight=1'b0;
        enable_load_activation_data= 0;
        enable_store_activation_data=0;
        
        #clk_period;
        max_cnt_from_cu=(COLUMNS/(64/64));
        select_precision<=`INT64;
        $display("precision 64bit");
        #clk_period;
         enable=1'b1;
        #clk_period;
        $display("enable and load max value for coutners");
        ld_max_cnt=1'b1;
        ld_weight_page_cnt=1'b1;
        ld_max_cnt_weight=1'b1;        
        #clk_period;
        ld_weight_page_cnt=1'b0;
        ld_max_cnt=1'b0;
        ld_max_cnt_weight=1'b0;
        repeat(1)@(posedge clk);
        infifo_read=1'b1 ;
        for(i=0;i<(COLUMNS/(64/64));i=i+1)begin
        enable_load_activation_data= (1'b1 << i);    
        repeat(2)@(posedge clk);
        end
        
        repeat(2)@(posedge clk);
        enable_store_activation_data=(8'hff);       
        outfifo_write=1'b0 ;
        // first ls unit for every row
        repeat(1)@(posedge clk);
        enable_cnt_weight=1'b1;
        enable_load_activation_data=0;
        enable_store_activation_data=0;
        $display("loading weight",);        
        for(i=0;i<ROWS;i=i+1)begin 
            read_weight_memory=(8'hff<<(8*i));
            repeat(2)@(posedge clk);
        end
        read_weight_memory=0;
        
        $display("read from fifo and store in the internal register of ls units");

        $display("wait for some time for the mxu, check the correct generation of weight address (incremental)");
        #clk_period;
        $display("outfifo read");
        infifo_read=1'b0 ;
        outfifo_write=1'b1 ;
        read_weight_memory=1'b0 ;        
        
        enable_cnt_weight=1'b0; 
        enable_cnt=1'b1 ; // start to count after the first chunk is gone 

        for(i=0;i<(COLUMNS/(64/64));i=i+1)begin
        #clk_period;
            if(data_to_fifo_out!=input_data_from_fifo) begin
                $display("input and output data to fifo are different");
                OK=0;
            end
       
        end 
        
        if (OK!=1) begin 
        $display("load store array does not pass the test for 64 bits");
        $finish();
        end  

        $display("IF YOU ARE READING THIS ->>>>>> LS ARRAYS IS WORKING!!!",);


        

        $finish();
        end

endmodule
