// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module syncronous_counter_tb;
  logic clk=0;
  logic rstn =1;
  logic up_down;
  logic [3:0] count;
  
  four_bit_synchronous_counter dut(.*);  
  
  localparam clk_period =10;
  initial begin 
    forever #(clk_period/2)clk<=~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,dut);
    #1 rstn<=0;
    #6 rstn<=1;
    #1up_down<=0;
    #1000 $finish();
  end
endmodule