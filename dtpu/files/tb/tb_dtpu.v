`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 16:57:45
// Design Name: 
// Module Name: tb_mxu_core
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


module tb_dtpu();
        parameter clk_period= 10;
              reg clk,reset;
              reg [(4)*(3)-1:0]input_data;
              reg [(4)*(3)-1:0]weight;
              reg [(4)*(4)-1:0]input_data4;
              reg [(4)*(4)-1:0]weight4;
              reg enable;
              wire test_mode;
              wire [4*3-1:0]y;
              wire [4*4-1:0]y4;
              integer k;
    
    /////////////////////////////////////
    `define SIMULATION 1
    `define VIVADO_MAC SIMULATION
     /////////////////////////////////////
     
        
      dtpu #(.DATA_WIDTH(4), .ROWS(3), .COLUMNS(3))
     (
         .clk(),
         .reset(),
         .intr_request(),
         .test_mode(),
        /////////////////////////////////
        //// AXI SLAVE PERIPHERAL ///////
        /////////////////////////////////
          .axi_s_awid(), // Write address ID (optional)
               .axi_s_awaddr(),// Write address (optional)
              .axi_s_awlen(), // Burst length (optional)
              axi_s_awsize(), // Burst size (optional)
              .axi_s_awburst(), // Burst type (optional)
              .axi_s_awlock(), // Lock type (optional)
              .axi_s_awcache(), // Cache type (optional)
              .axi_s_awprot(), // Protection type (optional)
              .axi_s_awregion(), // Write address slave region (optional)
              .axi_s_awqos(), // Transaction Quality of Service token (optional)\
              .axi_s_awuser(), // Write address user sideband (optional)\
              .axi_s_awvalid(), // Write address valid (optional)
               .axi_s_awready(), // Write address ready (optional)
              .axi_s_wid(), // Write ID tag (optional)
              .axi_s_wdata(), // Write data (optional)
              .axi_s_wstrb(), // Write strobes (optional)
              .axi_s_wlast(), // Write last beat (optional)
              .axi_s_wuser(), // Write data user sideband (optional)
              .axi_s_wvalid(), // Write valid (optional)
               .axi_s_wready(), // Write ready (optional)
              .axi_s_bid(), // Response ID (optional)
              .axi_s_bresp(), // Write response (optional)
              .axi_s_buser(), // Write response user sideband (optional)
               .axi_s_bvalid(), // Write response valid (optional)
              .axi_s_bready(), // Write response ready (optional)
              .axi_s_arid(), // Read address ID (optional)
              .axi_s_araddr(), // Read address (optional)
              .axi_s_arlen(), // Burst length (optional)
              .axi_s_arsize(), // Burst size (optional)
              .axi_s_arburst(), // Burst type (optional)
              .axi_s_arlock(), // Lock type (optional)
              .axi_s_arcache(), // Cache type (optional)
              .axi_s_arprot(), // Protection type (optional)
              .axi_s_arregion(), // Read address slave region (optional)
              .axi_s_arqos(), // Quality of service token (optional)
              .axi_s_aruser(), // Read address user sideband (optional)
              .axi_s_arvalid(), // Read address valid (optional)
               .axi_s_arready(), // Read address ready (optional)
              .axi_s_rid(), // Read ID tag (optional)
              .axi_s_rdata(), // Read data (optional)
              .axi_s_rresp(), // Read response (optional)
              .axi_s_rlast(), // Read last beat (optional)
              .axi_s_ruser(), // Read user sideband (optional)
               .axi_s_rvalid(), // Read valid (optional)
               .axi_s_rready() // Read ready (optional)
             );

                    always begin
                       clk = 1'b1;
                       #(clk_period/2) 
                       clk = 1'b0;
                       #(clk_period/2);
                    end
              

              
              initial begin 
              enable=1'b0;
              reset=1'b1;
              #clk_period;
              reset=1'b0;
              input_data=12'h253;
              weight=12'h312;
              input_data4=16'h8253;
              weight4=16'h7312;              
              #clk_period;
              enable=1'b1;
              #clk_period;
              // first input chaanges delay on second input of 1 cc and on third 1 of 2cc 
              // the delay of input chian depends from the number of columns 
               input_data=12'h353;
               input_data4=16'h1253;
              #clk_period;
              input_data=12'h463;
              input_data4=16'h3253;
              #clk_period;
              input_data=12'h564;
              input_data4=16'hA253;
              for(k=0;k<6;k=k+1) begin 
              #clk_period;
              end
              weight=12'h111;
              weight4=16'h111;
              for(k=0;k<10;k=k+1) begin 
                   #clk_period;
              end                          
                              
              end 

        
        
        
        
            
endmodule
