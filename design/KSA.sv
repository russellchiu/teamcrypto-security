`include "Constants.sv"
module KSA(new_key, clk, rst, key, round);

    // ports
    input clk, rst;
    input [`key_size-1:0] key;
    input [`rounds_size:0] round;
    output logic [`key_size-1:0] new_key;

    logic [3:0] subs;

    // Substitution Step
    SBox key_sub1(subs, new_key[18:15]);

    always @(posedge clk) begin
        if (rst == 0)
            new_key <= key;
        else begin
            new_key[75:20] <= {new_key[14:0], new_key[79:39]};
            new_key[79:76] <= subs;
            new_key[19:15] <= new_key[38:34] ^ (round + 1); // 11111 + 1 = 0
            new_key[14:0] <= new_key[33:19];
        end
    end
    
    /*always @(posedge clk or negedge rst) begin
        if (rst == 0)
            new_key <= key;
        else begin
            new_key[75:20] <= {key[14:0], key[79:39]};
            new_key[79:76] <= subs;
            new_key[19:15] <= key[38:34] ^ (round + 1);
            new_key[14:0] <= key[33:19];
        end
    end */
    
    // `ifndef KEY_128
    //     logic [4:0] subs;

    //     // Substitution Step
    //     SBox key_sub1(subs, key[18:15]);

       
    //     assign new_key[75:20] = {key[14:0], key[79:39]};
    //     assign new_key[79:76] = subs;
    //     assign new_key[19:15] = key[38:34] ^ (round + 1);
    //     assign new_key[14:0] = key[33:19];

        
    // `else
    //     logic [4:0] subs1;
    //     logic [3:0] subs2;

    //     // Substitution Step
    //     SBox key_sub2a(subs1, key[66:63]);
    //     SBox key_sub2b(subs2, key[62:59]);
        
    //     always @(round) begin
    //         if (round != 0) begin
    //             // Bit rotation
    //             new_key[119:67] = key[58:6];
    //             new_key[61:0] = key[128:67];

    //             // Apply subs
    //             new_key[`size - 1:124] = subs1;
    //             new_key[123:120] = subs2;

    //             // Summing the counter (salt)
    //             new_key[66:62] = key[5:1] ^ (round + 1);
    //         end
    //         else
    //             new_key = key;
    //     end
    // `endif
endmodule