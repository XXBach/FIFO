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


module add8_tb;
    reg [7:0]A;
    reg [7:0]B;
    reg Cin;
    wire [7:0]S;
    wire Cout;
    add8 dut(A,B,Cin,S,Cout);
    initial begin
    A = 0; 
    B = 0; 
    Cin = 0;
    #10
    Cin = 1;
    #10
    A = $random; 
    B = $random;  
    #10
    Cin = 0;
    #10
    A = 8'h00; 
    B = 8'hFF;
    #10
    Cin = 1;
    #10
    A = 8'hFF;
    #10
    B = 8'h01;
    Cin = 0;
    #10
    A = $random; 
    B = $random;
    Cin = $random; 
    #10
    A = $random; 
    B = $random;
    Cin = $random;
    #10 
    $stop;
end          
endmodule
