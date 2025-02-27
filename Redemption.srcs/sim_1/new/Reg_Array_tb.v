`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 10:08:36 PM
// Design Name: 
// Module Name: Reg_Array_tb
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


module Reg_Array_tb;
    parameter WIDTH = 8;
    parameter DEPTH = 4;
    reg CLK;
    reg [WIDTH - 1:0]DIN;
    reg wen;
    reg [$clog2(DEPTH) - 1:0]waddr;
    reg [$clog2(DEPTH) - 1:0]raddr;
    wire [WIDTH - 1:0]DOUT;
    RegArray dut(CLK,DIN,wen,waddr,raddr,DOUT);
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end
    initial begin
       DIN <= 0;
       wen <= 0;
       waddr <= 0;
       raddr <= 0;
       #10
       wen = 1;
       repeat(5) begin
            DIN <= $random;
            waddr <= waddr + 1;
            #10;
       end
       #10
       wen = 0;
       repeat(5) begin
            raddr <= raddr + 1;
            #10;
       end
       $stop;
    end
endmodule
