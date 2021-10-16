module KSA(new_key, orig_key, round);

    // ports
    input [`key_size-1:0] orig_key;
    input [`num_rounds-1:0] round;
    output reg [`key_size-1:0] new_key;

    logic [`key_size-1:0] key;
    always @(*) begin
        if (round == 0) begin
            key = orig_key;
        end
        else begin
            key = new_key;
        end
    end
    

    `ifndef KEY_128
        logic [3:0] subs;

        // Substitution Step
        SBox key_sub1(subs, key[18:15]);

        always @(round or key) begin
            if (round != 0) begin
                // Bit rotation
                new_key[75:20] = {key[14:0], key[`key_size - 1:39]};
                
                // Use the substituted value
                new_key[`key_size - 1:76] = subs;

                // Summing the counter (salt)
                new_key[19:15] = key[38:34] ^ (round + 1);
            end
            else
                new_key = key;
        end
        
    `else
        logic [4:0] subs1;
        logic [3:0] subs2;

        // Substitution Step
        SBox key_sub2a(subs1, key[66:63]);
        SBox key_sub2b(subs2, key[62:59]);
        
        always @(round) begin
            if (round != 0) begin
                // Bit rotation
                new_key[119:67] = key[58:6];
                new_key[61:0] = key[128:67];

                // Apply subs
                new_key[`size - 1:124] = subs1;
                new_key[123:120] = subs2;

                // Summing the counter (salt)
                new_key[66:62] = key[5:1] ^ (round + 1);
            end
            else
                new_key = key;
        end
    `endif
endmodule