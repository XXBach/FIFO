`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UIT
// Engineer: Nguyen Tran Xuan bach
// 
// Create Date: 11/11/2024 09:57:31 PM
// Design Name: FIFO
// Module Name: Pointer
// Project Name: SOC_FIFO
// Target Devices: VC707
// Tool Versions: Vivado 2023.2
// Description: A University Project to learn how to use System Verilog for testing
// Dependencies: 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: This module generate address, aka pointer in this scenerio, depend on cntEn 
// signal to accumulate the address with the boundary of DEPTH
//////////////////////////////////////////////////////////////////////////////////


module Pointer #(
    parameter DEPTH = 4
)(
    input wire CLK,
    input wire cntEn,
    output wire [$clog2(DEPTH) - 1:0]addr
);
    reg [$clog2(DEPTH) - 1:0]addr_temp;
    initial begin
        addr_temp = 0;
    end
    always@(posedge CLK) begin
      if(cntEn == 1) begin
          if(addr_temp < DEPTH) addr_temp = addr_temp + 1;
          else addr_temp = 0;
      end
      else addr_temp = addr_temp;
    end
    assign addr = addr_temp;  
endmodule
