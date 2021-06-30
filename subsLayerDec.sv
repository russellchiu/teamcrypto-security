// parameter size is set to either 64 or 128 depending on block size
// parameter size = 64;
// bit substitution for 64 bit segment
module SubsLayer(substituted, original)

    // Interface
    input [size - 1:0] original;
    output [size - 1:0] substituted;

    // Module functionality
    // loops through and substitutes blocks of 4 bits
    for (index = size - 1; index >= 0; index = index - 4)
        SBoxDec(substituted[index:index-3], original[index:index-3]);

endmodule

// Example usage:
// reg [63:0] data;
// SubsLayer(data[63:0], data[63:0])

// In this example, the SubsLayer is called upon 64 bits of data
// from a register which could be holding the text
// at any particular round in the encryption. The function
// would call the SBox module upon groupings of 4.
