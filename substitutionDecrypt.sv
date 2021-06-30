// sizes are defined for the blocks that are used
parameter BLOCKSIZE = 4;
parameter ARRSIZE = 16;
// bit substitution for 4 bit segment
module SBoxDecrypt(substituted, orig)

    // Interface
    input [BLOCKSIZE - 1:0] orig;
    output [BLOCKSIZE - 1:0] substituted;

    // Variables & Initialization

    // there are 16 possible substitutions each for a 4 bit
    // constant defined in hexadecimal
    wire [BLOCKSIZE - 1:0] lut[0:ARRSIZE - 1];
    
    // assign lut = {4'hC, 4'h5, 4'h6, 4'hB, 
    //             4'h9, 4'h0, 4'hA, 4'hD, 
    //             4'h3, 4'hE, 4'hF, 4'h8, 
    //             4'h4, 4'h7, 4'h1, 4'h2};
    lut[0] = 4'h5;
    lut[1] = 4'hE;
    lut[2] = 4'hF;
    lut[3] = 4'h8;
    lut[4] = 4'h9;
    lut[5] = 4'h1;
    lut[6] = 4'h2;
    lut[7] = 4'hD;
    lut[8] = 4'hB;
    lut[9] = 4'h4;
    lut[10] = 4'h6;
    lut[11] = 4'h3;
    lut[12] = 4'h0;
    lut[13] = 4'h7;
    lut[14] = 4'h9;
    lut[15] = 4'hA;

    // Module functionality
    // looks up the index from the input and returns constant
    always @(orig) begin
        substituted = lut[orig];
    end

endmodule

// Example usage:
// reg [63:0] data;
// SBox(data[3:0], data[3:0])

// In this example, the SBox is called upon 4 bits of data
// from a larger register which could be holding the text
// at any particular round in the encryption. The function
// would look at those bits and return the substituted bits.

// If we considered...
// orig = 4'b1010 (decimal 10)
// substituted = 4'b1111 (decimal 15)

// This module would use the table to find the "substituted" value
// from the look up table and return 4'hF which is 4'b1111
// in binary.