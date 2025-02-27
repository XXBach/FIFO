`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UIT
// Engineer: Nguyen Tran Xuan Bach
// 
// Create Date: 02/21/2025 04:10:02 PM
// Design Name: FIFO
// Module Name: automatic test
// Project Name: SOC_FIFO
// Target Devices: VC707
// Tool Versions: Vivado 2023.2
// Description: A University project to learn how to use System Verilog for writing testbenches
// Dependencies: 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: A test program in testbench, which contain most part of the testbench except DUT and Interface
//////////////////////////////////////////////////////////////////////////////////


program automatic test 
    #(
    parameter WIDTH = 8,
    parameter DEPTH = 4
    )(
    FIFO_IO.TEST fifo_io
    );
    logic [1:0] W_R;
    logic [WIDTH - 1:0] data_out;
    logic [WIDTH - 1:0] cpr_data_in[$];
    logic [WIDTH - 1:0] cpr_data_out[$];
    logic [WIDTH - 1:0] cpr_data_out_DUT[$];
    bit [31:0] gen_randomize;
    integer i;
    initial begin
        reset();
        repeat(8) begin
        gen();
        repeat(gen_randomize) begin
            fork
                transact();
                monitor();
            join
        end
        check();
        #10;
        end
        $finish;
    end
    task reset();
        fifo_io.cb.RST <= 1;
        repeat(2) @(posedge fifo_io.cb);
        fifo_io.cb.RST <= 0;
    endtask: reset
    task gen();
        int seed = $realtime;
        W_R = $urandom(seed);
        gen_randomize = $urandom_range(1,DEPTH);
        cpr_data_in.delete();
        cpr_data_out.delete();
        cpr_data_out_DUT.delete();
        repeat(gen_randomize)
            cpr_data_in.push_back($urandom(seed));
        if(W_R[1]) cpr_data_out = cpr_data_in;
    endtask: gen
    task transact();
        drive_control();
        for(int i = 0; i < gen_randomize; i++) begin
            @(posedge fifo_io.cb);
            drive_DIN();
         end
    endtask: transact
    task drive_control();
        fifo_io.cb.WEn <= W_R[1];
        fifo_io.cb.REn <= W_R[0];
    endtask: drive_control
    task drive_DIN();
        fifo_io.cb.DIN <= cpr_data_in.pop_back;
    endtask: drive_DIN
    task monitor();
        for(int j = 0; j < gen_randomize; j++) begin
            @(posedge fifo_io.cb);
            cpr_data_out_DUT.push_back(fifo_io.cb.DOUT);
        end
    endtask: monitor
    task check();
        int check_param = compare();
        $display ("W or R: %b", W_R);
        if(check_param == 1) begin
            $display ("Read task correct");
            $display ("Expected Queue: %p", cpr_data_out);
            $display ("Actual Queue: %p", cpr_data_out_DUT);
        end
        else if (check_param == 0) begin
            $display ("Read task incorrect");
            $display ("Expected Queue: %p", cpr_data_out);
            $display ("Actual Queue: %p", cpr_data_out_DUT);
        end
        else $display ("No read task occured");
    endtask: check
    function int compare();
        if(W_R == 2'b01)begin
                foreach(cpr_data_out[i]) begin
                    if(cpr_data_out[i] != cpr_data_out_DUT[i]) return 0;
                end 
                return 1;
        end
        else return -1;
    endfunction: compare
endprogram: test
