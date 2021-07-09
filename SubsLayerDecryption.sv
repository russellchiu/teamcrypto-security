// parameter size is set to either 64 or 128 depending on block size
// parameter size = 64;
// bit substitution for 64 bit segment
module SubsLayerDecryption(substituted, original);

    // Interface
    input [size - 1:0] original;
    output [size - 1:0] substituted;

    // Module functionality
    // loops through and substitutes blocks of 4 bits
    for (index = size - 1; index >= 0; index = index - 4) begin
        SBoxDecrypt(substituted[index:index-3], original[index:index-3]);
    end
    
endmodule

// Example usage:
// reg [63:0] data;
// SubsLayerDecryption(data[63:0], data[63:0])

// SubsLayerDecryption is called on 64 bits of data
// from a register which could be holding the text
// at any particular round in the decryption. The function
// would call the SBoxDecrypt module upon groupings of 4.
