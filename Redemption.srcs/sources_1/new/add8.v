`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2024 10:31:05 PM
// Design Name: 
// Module Name: add8
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


module add8(
    input wire [7:0] A,
    input wire [7:0] B,
    input wire Cin,
    output wire [7:0] S,
    output wire Cout
    );
    wire w0,w1,w2,w3;
    wire [3:0]w4;
    wire [3:0]w5;
    add4 add03 (A[3:0],B[3:0],Cin,S[3:0],w0);
    add4 add740 (A[7:4],B[7:4],0,w4,w1);
    add4 add741 (A[7:4],B[7:4],1,w5,w2);
    mux2_4b muxS (w0,w4,w5,S[7:4]);
    mux2_1b muxcout (w0,w1,w2,Cout);
endmodule
