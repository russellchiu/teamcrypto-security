
`include "Constants.sv"
// module PLayerDec(permuted,original);

//     logic PBox [0:63] = {0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 
//             52, 56, 60, 1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 
//             49, 53, 57, 61, 2, 6, 10, 14, 18, 22, 26, 30, 34, 38, 42, 
//             46, 50, 54, 58, 62, 3, 7, 11, 15, 19, 23, 27, 31, 
//             35, 39, 43, 47, 51, 55, 59, 63};
            
//     input [`size - 1 : 0] original;
//     output [`size - 1 : 0] permuted;
    // generate
    //     genvar i;
    //     for (i = `size - 1; i >= 0; i = i - 4) begin
    //         assign permuted[i] = original[PBox[i]];
    //     end
    // endgenerate
module PLayer(
    input [`size - 1 : 0] original,
    output logic [`size - 1 : 0] permuted, 
    input Clock,
    output logic done
    );
    logic [5:0] i = `size - 1;

    always @(posedge Clock) begin
        if (i != 0)
            i = i - 1;
        else
            done = 1;
    end
    
    always @(*) begin
        if (i == 63) begin
            permuted[i] = original[i];
            done = 0;
        end
        else begin
            permuted[i] = original[(4 * i) % 63];
        end
        $display("original = %h", original);
        $display("permuted = %h", permuted);
    end

endmodule
