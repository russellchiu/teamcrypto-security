module KSA(new_key, key, round)

    // ports
    input [`key_size-1:0] key;
    input [`num_rounds-1:0] round;
    output reg [`key_size] new_key;

    always @(round) begin
        if (round != 0) begin
            `ifndef KEY_128
                // Bit rotation
                assign new_key[75:20] = {key[14:0], key[`key_size - 1:39]};
                
                // Substitution Step
                SBox key_sub1(new_key[`key_size - 1:76], key[18:15]);
                
                // Summing the counter (salt)
                assign new_key[19:15] = key[38:34] ^ (round + 1);
                // current assumption: starting at 1 (rounds)
            `else
                // Bit rotation
                assign new_key[119:67] = key[58:6];
                assign new_key[61:0] = key[128:67];

                // Substitution Step
                SBox key_sub2a(new_key[`size - 1:124], key[66:63]);
                SBox key_sub2b(new_key[123:120], key[62:59]);
                
                // Summing the counter (salt)
                assign new_key[66:62] = key[5:1] ^ (round + 1);
                // current assumption: starting at 1 (rounds)
            `endif
        else
            assign new_key = key;
        end
    end

endmodule