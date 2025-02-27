`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2024 10:31:05 PM
// Design Name: 
// Module Name: mux2_4b
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


module mux2_4b(
    input wire Sel,
    input wire [3:0] A,
    input wire [3:0] B,
    output reg [3:0] C
    );
    always@(*) begin
        if(!Sel) C = A;
        else C = B;
    end
endmodule
