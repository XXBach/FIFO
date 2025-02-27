`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2024 10:31:05 PM
// Design Name: 
// Module Name: add4
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


module add4(
    input wire [3:0] A,
    input wire [3:0] B,
    input wire Cin,
    output wire [3:0] S,
    output wire Cout
    );
    wire w1,w2,w3;
    FA fa0(A[0],B[0],Cin,S[0],w1);
    FA fa1(A[1],B[1],w1,S[1],w2);
    FA fa2(A[2],B[2],w2,S[2],w3);
    FA fa3(A[3],B[3],w3,S[3],Cout);    
endmodule
