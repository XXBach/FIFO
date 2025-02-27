
//////////////////////////////////////////////////////////////////////////////////
// Company: UIT
// Engineer: Nguyen Tran Xuan Bach
// 
// Create Date: 02/21/2025 04:14:16 PM
// Design Name: FIFO
// Module Name: FIFO_TEST_TOP
// Project Name: SOC_FIFO
// Target Devices: VC707
// Tool Versions: Vivado 2023.2
// Description: A University project to learn how to use System Verilog for writing testbenches
// Dependencies: 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: A testbench top module, testbench designed based on what I learn in
// the book that can be found by the name book.pdf 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps
module FIFO_TEST_TOP;
    parameter simulation_cycle = 100;
    parameter WIDTH = 8;
    parameter DEPTH = 4;
    bit SystemClock;
    FIFO_IO top_io(SystemClock);
    test t (top_io);
    SOC_FIFO #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH)
    ) DUT (
    .CLK(top_io.CLK),
    .RST(top_io.RST),
    .DIN(top_io.DIN),
    .WEn(top_io.WEn),
    .REn(top_io.REn),
    .Full(top_io.Full),
    .Empty(top_io.Empty),
    .DOUT(top_io.DOUT)
    );
    initial begin 
        SystemClock = 0;
        forever begin
            #(simulation_cycle/2)
            SystemClock = ~SystemClock;
        end
    end
endmodule
