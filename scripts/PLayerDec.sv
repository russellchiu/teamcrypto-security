
module PLayerDec(permuted,original);

    PBox = [0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 
            52, 56, 60, 1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 
            49, 53, 57, 61, 2, 6, 10, 14, 18, 22, 26, 30, 34, 38, 42, 
            46, 50, 54, 58, 62, 3, 7, 11, 15, 19, 23, 27, 31, 
            35, 39, 43, 47, 51, 55, 59, 63];
            
    integer i;
    input [size - 1 : 0] orignal;
    output [size - 1 : 0] permuted;

    for (i = size - 1; i >= 0; i = i - 4) begin
        permuted[i] = original[PBox[i: i- 1]];
    end

endmodule