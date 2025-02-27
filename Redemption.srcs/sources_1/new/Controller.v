`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UIT
// Engineer: Nguyen Tran Xuan Bach
// 
// Create Date: 11/11/2024 09:57:31 PM
// Design Name: FIFO
// Module Name: Controller
// Project Name: SOC_FIFO
// Target Devices: VC707
// Tool Versions: Vivado 2023.2
// Description: A University project to learn how to use System Verilog for writing testbenches
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: This module is a controller that control the FIFO behavior, this
// module is designed based on specification that can be found by the name spec.pdf 
//////////////////////////////////////////////////////////////////////////////////


module Controller #(
    parameter DEPTH = 4
)(
    input wire CLK,
    input wire RST,
    input wire WEn,
    input wire REn,
    output reg WEnable,
    output reg Full,
    output reg Empty,
    output reg ReadCnt,
    output reg WriteCnt
    );
    reg [$clog2(DEPTH) - 1:0] element_count;
    initial begin
        element_count <= 0;
    end
    always@(posedge CLK or posedge RST) begin
        if(RST) begin
            Full <= 0;
            Empty <= 0;
            ReadCnt <= 0;
            WriteCnt <= 0;
            WEnable <= 0;
        end
        else begin
                if(WEn && !REn) begin
                    if(element_count < DEPTH - 1) begin
                        WEnable <= 1;
                        WriteCnt <= 1;
                        ReadCnt <= 0;
                        element_count <= element_count + 1;
                    end
                    else begin
                        WEnable <= 0;
                        WriteCnt <= 0;
                        ReadCnt <= 0;
                        element_count <= element_count;
                    end
                end
                else if(REn && !WEn) begin
                    WEnable <= 0;
                    WriteCnt <= 0;
                    ReadCnt <= 1;
                    element_count <= element_count - 1;
                end
                else begin
                    WEnable <= 0;
                    WriteCnt <= 0;
                    ReadCnt <= 0;
                    element_count <= element_count;
                end          
        end
        Full <= ( element_count >= DEPTH - 1) ?  1 : 0;
        Empty <= ( element_count == 0 ) ? 1 : 0;
    end
endmodule
