// parameter size = 64;

module AddRK(
    output [size - 1: 0] y, 
    input [size - 1:0] a, 
    input [size - 1:0] b
);
    assign y = a ^ b;
endmodule
