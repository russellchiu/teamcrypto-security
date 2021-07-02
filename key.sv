// calculates next 80-bit key in key schedule
module KSA(round, key, nkey)
    
    // Interface
    input [79:0] key;
    input [4:0] round;
    output [79:0] nkey;

    // Bit rotation
    nkey[75:20] = {key[18:0], key[79:39]};
    
    // Substitution Step
    SBox(nkey[79:76], key[19:15]);
    
    // Summing the counter (salt)
    nkey[20:15] = xor(key[38:34], round + 1);
    // current assumption: starting at 1 (rounds)

endmodule