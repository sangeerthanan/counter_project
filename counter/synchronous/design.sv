// Code your design here
module four_bit_synchronous_counter
  (
    input logic clk,rstn,up_down,
    output logic [3:0] count
  );
  always_ff @(posedge clk)begin
    if (!rstn) count <=0;
    else if (up_down ==0) begin
      count<= count +1'b1;
    end else if (up_down ==1) begin
      count<= count -1'b1;
    end
  end
endmodule