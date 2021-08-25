`include "Constants.sv"
module PLayer(
    input [`size - 1 : 0] original,
    output logic [`size - 1 : 0] permuted, 
    // input Clock,
    // output logic done
    );
    // logic [5:0] i = `size - 1;
/*    
    logic PBox[0:63] = {0,16,32,48,1,17,33,49,2,18,34,50,3,19,35,51,
        4,20,36,52,5,21,37,53,6,22,38,54,7,23,39,55,
        8,24,40,56,9,25,41,57,10,26,42,58,11,27,43,59,
        12,28,44,60,13,29,45,61,14,30,46,62,15,31,47,63};
*/
    // always @(posedge Clock) begin
    //     if (i != 0)
    //         i = i - 1;
    //     else
    //         done = 1;
    // end
    
    // always @(*) begin
    //     if (i == 63) begin
    //         permuted[i] = original[i];
    //         done = 0;
    //     end
    //     else begin
    //         permuted[i] = original[(16 * i) % 63];
    //     end
    //     $display("original = %h", original);
    //     $display("permuted = %h", permuted);
    // end

    permuted[0] = original[0]
    permuted[1] = original[16]
    permuted[2] = original[32]
    permuted[3] = original[48]
    permuted[4] = original[1]
    permuted[5] = original[17]
    permuted[6] = original[33]
    permuted[7] = original[49]
    permuted[8] = original[2]
    permuted[9] = original[18]
    permuted[10] = original[34]
    permuted[11] = original[50]
    permuted[12] = original[3]
    permuted[13] = original[19]
    permuted[14] = original[35]
    permuted[15] = original[51]
    permuted[16] = original[4]
    permuted[17] = original[20]
    permuted[18] = original[36]
    permuted[19] = original[52]
    permuted[20] = original[5]
    permuted[21] = original[21]
    permuted[22] = original[37]
    permuted[23] = original[53]
    permuted[24] = original[6]
    permuted[25] = original[22]
    permuted[26] = original[38]
    permuted[27] = original[54]
    permuted[28] = original[7]
    permuted[29] = original[23]
    permuted[30] = original[39]
    permuted[31] = original[55]
    permuted[32] = original[8]
    permuted[33] = original[24]
    permuted[34] = original[40]
    permuted[35] = original[56]
    permuted[36] = original[9]
    permuted[37] = original[25]
    permuted[38] = original[41]
    permuted[39] = original[57]
    permuted[40] = original[10]
    permuted[41] = original[26]
    permuted[42] = original[42]
    permuted[43] = original[58]
    permuted[44] = original[11]
    permuted[45] = original[27]
    permuted[46] = original[43]
    permuted[47] = original[59]
    permuted[48] = original[12]
    permuted[49] = original[28]
    permuted[50] = original[44]
    permuted[51] = original[60]
    permuted[52] = original[13]
    permuted[53] = original[29]
    permuted[54] = original[45]
    permuted[55] = original[61]
    permuted[56] = original[14]
    permuted[57] = original[30]
    permuted[58] = original[46]
    permuted[59] = original[62]
    permuted[60] = original[15]
    permuted[61] = original[31]
    permuted[62] = original[47]
    permuted[63] = original[63]

endmodule
