// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module ripple_counter_tb;
  logic trigger =1;
  logic rstn =1;
  logic[3:0] count;
  four_bit_ripple_counter dut(.*);
  initial begin
    $dumpfile("dump.vcd");$dumpvars(0,dut);
    #5 rstn<=0;
    #6 rstn<=1;
    repeat (100) #5 trigger <= ~trigger;
    #5 $finish();
  end
endmodule