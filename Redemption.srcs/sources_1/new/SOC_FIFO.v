`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UIT
// Engineer: Nguyen Tran Xuan Bach
// 
// Create Date: 11/11/2024 09:57:31 PM
// Design Name: FIFO
// Module Name: SOC_FIFO
// Project Name: SOC_FIFO
// Target Devices: VC707
// Tool Versions: Vivado 2023.2
// Description: A University project to learn how to use System Verilog for writing testbenches
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: This module is a top one
//////////////////////////////////////////////////////////////////////////////////
module SOC_FIFO #(
    parameter WIDTH = 8,
    parameter DEPTH = 4
)(
    input wire CLK,
    input wire RST,
    input wire [WIDTH - 1:0] DIN,
    input wire WEn,
    input wire REn,
    output wire Full,
    output wire Empty,
    output wire [WIDTH - 1:0]DOUT
    );
    wire w0,w1,w2,w3,w4;
    wire [$clog2(DEPTH) - 1:0] Waddr;
    wire [$clog2(DEPTH) - 1:0] Raddr;
    Controller#(
        .DEPTH(DEPTH)
    ) CTRL (
        .CLK(CLK),
        .RST(RST),
        .WEn(WEn),
        .REn(REn),
        .WEnable(w0),
        .Full(Full),
        .Empty(Empty),
        .ReadCnt(w1),
        .WriteCnt(w2)
    );
    Pointer#(
        .DEPTH(DEPTH)
    )WPTR(
        .CLK(CLK),
        .cntEn(w2),
        .addr(Waddr)
    );
    Pointer#(
        .DEPTH(DEPTH)
    )RPTR(
        .CLK(CLK),
        .cntEn(w1),
        .addr(Raddr)
    );
    RegArray #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH)
    )RA(
//        .CLK(CLK),
        .RST(RST),
        .DIN(DIN),
        .wen(w0),
        .waddr(Waddr),
        .raddr(Raddr),
        .DOUT(DOUT)
    );
endmodule
