
`include "Constants.sv"
module SubsLayer(substituted, original);

    // Interface
    input [`size - 1:0] original;
    output [`size - 1:0] substituted;

    // Module functionality
    // loops through and substitutes blocks of 4 bits
    // for (index = size - 1; index >= 0; index = index - 4) begin
    //     // Use no for loop here
    //     SBox(substituted[index:index-3], original[index:index-3]);
    // end
    
    SBox inst0 (substituted[63:60], original[63:60]);
    SBox inst1 (substituted[59:56], original[59:56]);
    SBox inst1 (substituted[55:52], original[55:52]);
    SBox inst3 (substituted[51:48], original[51:48]);

    SBox inst4 (substituted[47:44], original[47:44]);
    SBox inst5 (substituted[43:40], original[43:40]);
    SBox inst6 (substituted[39:36], original[39:36]);
    SBox inst7 (substituted[35:32], original[35:32]);

    SBox inst8 (substituted[31:28], original[31:28]);
    SBox inst9 (substituted[27:24], original[27:24]);
    SBox instA (substituted[23:20], original[23:20]);
    SBox instB (substituted[19:16], original[19:16]);

    SBox instC (substituted[15:12], original[15:12]);
    SBox instD (substituted[11: 8], original[11: 8]);
    SBox instE (substituted[ 7: 4], original[ 7: 4]);
    SBox instF (substituted[ 3: 0], original[ 3: 0]);

endmodule

// Example usage:
// reg [63:0] data;
// SubsLayer(data[63:0], data[63:0])

// In this example, the SubsLayer is called upon 64 bits of data
// from a register which could be holding the text
// at any particular round in the encryption. The function
// would call the SBox module upon groupings of 4.
