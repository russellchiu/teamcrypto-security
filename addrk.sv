// parameter size = 64;

module addrk(
    output [size - 1: 0] y, 
    input [size - 1:0] a, 
    input [size - 1:0] b
);
    assign y = xor(a, b);
    
endmodule