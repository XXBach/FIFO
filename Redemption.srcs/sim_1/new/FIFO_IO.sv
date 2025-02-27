`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UIT
// Engineer: Nguyen Tran Xuan Bach
// 
// Create Date: 02/23/2025 04:13:42 PM
// Design Name: FIFO
// Module Name: FIFO_IO
// Project Name: SOC_FIFO
// Target Devices: VC707
// Tool Versions: Vivado 2023.2
// Description: A University project to learn how to use System Verilog for writing testbenches
// Dependencies: 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: An Interface that connect DUT and the test environment
// 
//////////////////////////////////////////////////////////////////////////////////


interface FIFO_IO #(
    parameter WIDTH = 8
    )(
    input bit clk
    );
    logic CLK;
    assign CLK = clk;
    logic RST;
    logic [WIDTH - 1 : 0] DIN;
    logic WEn;
    logic REn;
    logic Full;
    logic Empty;
    logic [WIDTH - 1 : 0] DOUT;
    clocking cb @(posedge clk);
        default input #0 output #0;
        output RST;
        output DIN;
        output WEn;
        output REn;
        input Full;
        input Empty;
        input DOUT;
    endclocking: cb
    modport TEST (clocking cb);
    modport DUT (input RST,DIN,WEn,REn,
                 output Full,Empty, DOUT);
    modport MONITOR (input RST, DIN, WEn, REn, Full, Empty, DOUT );      
endinterface: FIFO_IO
