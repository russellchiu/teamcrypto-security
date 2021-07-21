
`include "Constants.sv"
// calculates next 80-bit key in key schedule
module KSA(round, key, new_key);
    if (`key_size == 80)
        // Interface
        input [`key_size - 1:0] key;
        input [4:0] round;
        output [`size - 1:0] new_key;

        // Bit rotation
        assign new_key[75:20] = {key[18:0], key[`size - 1:39]};
        
        // Substitution Step
        SBox(new_key[`size - 1:76], key[19:15]);
        
        // Summing the counter (salt)
        assign new_key[20:15] = key[38:34] ^ (round + 1);
        // current assumption: starting at 1 (rounds)
    if (key_size == 128)
        // Interface
        input [`key_size - 1:0] key;
        input [4:0] round;
        output [`size - 1:0] new_key;

        // Bit rotation
       assign new_key[119:67] = key[58:6];
       assign new_key[61:0] = key[128:67];

        // Substitution Step
        SBox(new_key[`size - 1:124], key[66:63]);
        SBox(new_key[123:120], key[62:59]);
        
        // Summing the counter (salt)
        assign new_key[66:62] = key[5:1] ^ (round + 1);
        // current assumption: starting at 1 (rounds)
        //error

endmodule