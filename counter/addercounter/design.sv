// Code your design here

// Write your modules here
`timescale 1ns / 1ps
module T_Flipflop(
input logic T ,clk,rstn,
output logic Q
);
  always_ff @(negedge clk or negedge rstn) begin
    if (!rstn) Q<= 0;
    else if (T) Q<=~Q;
  end
endmodule
module four_bit_ripple_counter(
  input trigger, rstn,
  output logic [3:0] count
);
  logic T=1;
  
  T_Flipflop T0 (.T(T), .clk(trigger), .rstn(rstn), .Q(count[0]));
  T_Flipflop T1 (.T(T), .clk(count[0]), .rstn(rstn), .Q(count[1]));
  T_Flipflop T2 (.T(T), .clk(count[1]), .rstn(rstn), .Q(count[2]));
  T_Flipflop T3 (.T(T), .clk(count[2]), .rstn(rstn), .Q(count[3]));
endmodule
