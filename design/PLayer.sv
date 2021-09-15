`include "Constants.sv"
module PLayer(
    input [`size - 1 : 0] original,
    output logic [`size - 1 : 0] permuted
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
    
    assign permuted[0] = original[0];
    assign permuted[4] = original[1];
    assign permuted[8] = original[2];
    assign permuted[12] = original[3];
    assign permuted[16] = original[4];
    assign permuted[20] = original[5];
    assign permuted[24] = original[6];
    assign permuted[28] = original[7];
    assign permuted[32] = original[8];
    assign permuted[36] = original[9];
    assign permuted[40] = original[10];
    assign permuted[44] = original[11];
    assign permuted[48] = original[12];
    assign permuted[52] = original[13];
    assign permuted[56] = original[14];
    assign permuted[60] = original[15];
    assign permuted[1] = original[16];
    assign permuted[5] = original[17];
    assign permuted[9] = original[18];
    assign permuted[13] = original[19];
    assign permuted[17] = original[20];
    assign permuted[21] = original[21];
    assign permuted[25] = original[22];
    assign permuted[29] = original[23];
    assign permuted[33] = original[24];
    assign permuted[37] = original[25];
    assign permuted[41] = original[26];
    assign permuted[45] = original[27];
    assign permuted[49] = original[28];
    assign permuted[53] = original[29];
    assign permuted[57] = original[30];
    assign permuted[61] = original[31];
    assign permuted[2] = original[32];
    assign permuted[6] = original[33];
    assign permuted[10] = original[34];
    assign permuted[14] = original[35];
    assign permuted[18] = original[36];
    assign permuted[22] = original[37];
    assign permuted[26] = original[38];
    assign permuted[30] = original[39];
    assign permuted[34] = original[40];
    assign permuted[38] = original[41];
    assign permuted[42] = original[42];
    assign permuted[46] = original[43];
    assign permuted[50] = original[44];
    assign permuted[54] = original[45];
    assign permuted[58] = original[46];
    assign permuted[62] = original[47];
    assign permuted[3] = original[48];
    assign permuted[7] = original[49];
    assign permuted[11] = original[50];
    assign permuted[15] = original[51];
    assign permuted[19] = original[52];
    assign permuted[23] = original[53];
    assign permuted[27] = original[54];
    assign permuted[31] = original[55];
    assign permuted[35] = original[56];
    assign permuted[39] = original[57];
    assign permuted[43] = original[58];
    assign permuted[47] = original[59];
    assign permuted[51] = original[60];
    assign permuted[55] = original[61];
    assign permuted[59] = original[62];
    assign permuted[63] = original[63];

    
endmodule
