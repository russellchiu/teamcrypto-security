
`include "Constants.sv"
module SBox(substituted, orig);

    // Interface
    input [`BLOCKSIZE - 1:0] orig;
    output [`BLOCKSIZE - 1:0] substituted;

logic substituted;
   
    always @(orig) begin
        
        case (orig)
            4'h0: subs = 4'hC;
            4'h1: subs = 4'h5;
            4'h2: subs = 4'h6;
            4'h3: subs = 4'hB;
            4'h4: subs = 4'h9;
            4'h5: subs = 4'h0;
            4'h6: subs = 4'hA;
            4'h7: subs = 4'hD;
            4'h8: subs = 4'h3;
            4'h9: subs = 4'hE;
            4'hA: subs = 4'hF;
            4'hB: subs = 4'h8;
            4'hC: subs = 4'h4;
            4'hD: subs = 4'h7;
            4'hE: subs = 4'h1;
            
            default: subs = 4'h2;   
        endcase
    end    

    // Module functionality
    // looks up the index from the input and returns constant
    // always @(orig) begin
    //     // Use case syntax
    //     // Optimize logic if possible
    //     case (orig):
    //         substituted = lut[orig];
    // end

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