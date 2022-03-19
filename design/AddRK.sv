`include "Constants.sv"

module AddRK(
    output [`size - 1: 0] y, 
    input [`size - 1:0] a, 
    input [`size - 1:0] b
);
    // sums state variable with key
    assign y = a ^ b;
endmodule
