`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2024 10:53:39 PM
// Design Name: 
// Module Name: FA_tb
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


module FA_tb;
    reg A;
    reg B;
    reg Cin;
    wire S;
    wire Cout;
    FA uut(A,B,Cin,S,Cout);
    initial begin
    A = 0; B = 0; Cin = 0;
    #10
    A = 0; B = 0; Cin = 1;
    #10
    A = 0; B = 1; Cin = 0;
    #10
    A = 0; B = 1; Cin = 1;
    #10
    A = 1; B = 0; Cin = 0;
    #10
    A = 1; B = 0; Cin = 1;
    #10
    A = 1; B = 1; Cin = 0;
    #10
    A = 1; B = 1; Cin = 1;
    #10
    $stop;
end          
endmodule
