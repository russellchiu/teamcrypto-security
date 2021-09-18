`include "Constants.sv"
module PLayer(
    input [`size - 1 : 0] original,
    output logic [`size - 1 : 0] permuted
    );

    // Assigns bits of permuted to the pbox position in original
    assign permuted[0] = original[0];
    assign permuted[16] = original[1];
    assign permuted[32] = original[2];
    assign permuted[48] = original[3];
    assign permuted[1] = original[4];
    assign permuted[17] = original[5];
    assign permuted[33] = original[6];
    assign permuted[49] = original[7];
    assign permuted[2] = original[8];
    assign permuted[18] = original[9];
    assign permuted[34] = original[10];
    assign permuted[50] = original[11];
    assign permuted[3] = original[12];
    assign permuted[19] = original[13];
    assign permuted[35] = original[14];
    assign permuted[51] = original[15];
    assign permuted[4] = original[16];
    assign permuted[20] = original[17];
    assign permuted[36] = original[18];
    assign permuted[52] = original[19];
    assign permuted[5] = original[20];
    assign permuted[21] = original[21];
    assign permuted[37] = original[22];
    assign permuted[53] = original[23];
    assign permuted[6] = original[24];
    assign permuted[22] = original[25];
    assign permuted[38] = original[26];
    assign permuted[54] = original[27];
    assign permuted[7] = original[28];
    assign permuted[23] = original[29];
    assign permuted[39] = original[30];
    assign permuted[55] = original[31];
    assign permuted[8] = original[32];
    assign permuted[24] = original[33];
    assign permuted[40] = original[34];
    assign permuted[56] = original[35];
    assign permuted[9] = original[36];
    assign permuted[25] = original[37];
    assign permuted[41] = original[38];
    assign permuted[57] = original[39];
    assign permuted[10] = original[40];
    assign permuted[26] = original[41];
    assign permuted[42] = original[42];
    assign permuted[58] = original[43];
    assign permuted[11] = original[44];
    assign permuted[27] = original[45];
    assign permuted[43] = original[46];
    assign permuted[59] = original[47];
    assign permuted[12] = original[48];
    assign permuted[28] = original[49];
    assign permuted[44] = original[50];
    assign permuted[60] = original[51];
    assign permuted[13] = original[52];
    assign permuted[29] = original[53];
    assign permuted[45] = original[54];
    assign permuted[61] = original[55];
    assign permuted[14] = original[56];
    assign permuted[30] = original[57];
    assign permuted[46] = original[58];
    assign permuted[62] = original[59];
    assign permuted[15] = original[60];
    assign permuted[31] = original[61];
    assign permuted[47] = original[62];
    assign permuted[63] = original[63];

endmodule
