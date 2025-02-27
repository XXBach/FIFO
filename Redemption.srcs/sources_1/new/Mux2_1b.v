`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2024 11:14:48 PM
// Design Name: 
// Module Name: Mux2_1b
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


module mux2_1b(
    input wire Sel,
    input wire A,
    input wire B,
    output reg C
    );
    always@(*) begin
        if(!Sel) C = A;
        else C = B;
    end
endmodule
