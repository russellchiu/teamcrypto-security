
`include "Constants.sv"
module SBoxDecrypt(substituted, orig);

    // Interface
    input [`BLOCKSIZE - 1:0] orig;
    output [`BLOCKSIZE - 1:0] substituted;
 
    logic [3:0] subs;

    // Selects proper SBox
    always @(orig) begin
        
        case (orig)
            4'h0: subs = 4'h5;
            4'h1: subs = 4'hE;
            4'h2: subs = 4'hF;
            4'h3: subs = 4'h8;
            4'h4: subs = 4'hC;
            4'h5: subs = 4'h1;
            4'h6: subs = 4'h2;
            4'h7: subs = 4'hD;
            4'h8: subs = 4'hB;
            4'h9: subs = 4'h4;
            4'hA: subs = 4'h6;
            4'hB: subs = 4'h3;
            4'hC: subs = 4'h0;
            4'hD: subs = 4'h7;
            4'hE: subs = 4'h9;
            
            default : subs = 4'hA;  
            
        endcase
    end
    assign substituted = subs;
endmodule

// Example usage:

// reg [63:0] data;
// SBoxDecrypt(data[3:0], data[3:0])
// In this example, the SBoxDecrypt is called upon 4 bits of data
// from a larger register which could be holding the text
// at any particular round in the encryption. The function
// would look at those bits and return the substituted bits.

// If we considered...
// substituted = 4'b1111 (decimal 15)
// orig = 4'b1010 (decimal 10)

// This module would use the table to find the "inverse substituted" value
// from the look up table and return 4'hA which is 4'b1010
// in binary.