`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UIT
// Engineer: Nguyen Tran Xuan bach
// 
// Create Date: 11/11/2024 09:57:31 PM
// Design Name: FIFO
// Module Name: RegArray
// Project Name: SOC_FIFO
// Target Devices: VC707
// Tool Versions: Vivado 2023.2
// Description: A University Project to learn how to use System Verilog for testing
// Dependencies: 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: An array of register that can be read and written base on control signal and addressed
//////////////////////////////////////////////////////////////////////////////////


module RegArray #(
    parameter WIDTH = 8,
    parameter DEPTH = 4
)(
//    input wire CLK,
    input wire RST,
    input wire [WIDTH - 1:0]DIN,
    input wire wen,
    input wire [$clog2(DEPTH) - 1:0]waddr,
    input wire [$clog2(DEPTH) - 1:0]raddr,
    output reg [WIDTH - 1:0]DOUT
    );
    reg [0:WIDTH - 1]reg_array[DEPTH - 1:0];
    always@(*) begin
        if(RST) DOUT = 0;
        else begin
            if(wen) begin
                reg_array[waddr] <= DIN;
                DOUT <= DOUT;
            end
            else DOUT <= reg_array[raddr];
        end
    end
endmodule
