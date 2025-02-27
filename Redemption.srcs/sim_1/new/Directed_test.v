`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 03:01:19 PM
// Design Name: 
// Module Name: Directed_test
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


module Directed_test();
    parameter WIDTH = 8;
    parameter DEPTH = 4;
    reg CLK;
    reg RST;
    reg [WIDTH-1:0] DIN;
    reg WEn, REn;
    wire Full, Empty;
    wire [WIDTH-1:0] DOUT;
    SOC_FIFO #(.WIDTH(WIDTH), .DEPTH(DEPTH)) uut (
        .CLK(CLK),
        .RST(RST),
        .DIN(DIN),
        .WEn(WEn),
        .REn(REn),
        .Full(Full),
        .Empty(Empty),
        .DOUT(DOUT)
    );
    always #5 CLK = ~CLK;
    initial begin
        CLK = 0;
        RST = 1;
        WEn = 0;
        REn = 0;
        DIN = 0;
        #10 RST = 0;
        #10;
        repeat (5) begin
            @(posedge CLK);
                WEn = 1;
                DIN = $random % 256;
        end
        WEn = 0;
        #10;
        repeat (DEPTH) begin
            @(posedge CLK);
            if (!Empty) begin
                REn = 1;
            end else begin
                REn = 0;
            end
        end
        REn = 0;
        #20;
        $stop;
    end
    initial begin
        $monitor("Time: %0t | DIN: %h | DOUT: %h | WEn: %b | REn: %b | Full: %b | Empty: %b",
                 $time, DIN, DOUT, WEn, REn, Full, Empty);
    end
endmodule
