
`include "Constants.sv"
module SubsLayerDecryption(substituted, original);

    // Interface
    input [`size - 1:0] original;
    output [`size - 1:0] substituted;

    // Module functionality
    // loops through and substitutes blocks of 4 bits
   // for (index = size - 1; index >= 0; index = index - 4) begin
     //   SBoxDecrypt(substituted[index:index-3], original[index:index-3]);
    //end
    
    SBoxDecrypt  inst0 (substituted[63:60], original[63:60]);
    SBoxDecrypt  inst1 (substituted[59:56], original[59:56]);
    SBoxDecrypt  inst2 (substituted[55:52], original[55:52]);
    SBoxDecrypt  inst3 (substituted[51:48], original[51:48]);

    SBoxDecrypt  inst4 (substituted[47:44], original[47:44]);
    SBoxDecrypt  inst5 (substituted[43:40], original[43:40]);
    SBoxDecrypt  inst6 (substituted[39:36], original[39:36]);
    SBoxDecrypt  inst7 (substituted[35:32], original[35:32]);

    SBoxDecrypt  inst8 (substituted[31:28], original[31:28]);
    SBoxDecrypt  inst9 (substituted[27:24], original[27:24]);
    SBoxDecrypt  instA (substituted[23:20], original[23:20]);
    SBoxDecrypt  instB (substituted[19:16], original[19:16]);

    SBoxDecrypt  instC (substituted[15:12], original[15:12]);
    SBoxDecrypt  instD (substituted[11: 8], original[11: 8]);
    SBoxDecrypt  instE (substituted[ 7: 4], original[ 7: 4]);
    SBoxDecrypt  instF (substituted[ 3: 0], original[ 3: 0]);
    
endmodule

// Example usage:
// reg [63:0] data;
// SubsLayerDecryption(data[63:0], data[63:0])

// SubsLayerDecryption is called on 64 bits of data
// from a register which could be holding the text
// at any particular round in the decryption. The function
// would call the SBoxDecrypt module upon groupings of 4.
