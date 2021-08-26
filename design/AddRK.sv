`include "Constants.sv"

module AddRK(
    output [`key_size - 1: 0] y, 
    input [`key_size - 1:0] a, 
    input [`key_size - 1:0] b
);
    // sums state variable with key
    assign y = a ^ b;
endmodule
