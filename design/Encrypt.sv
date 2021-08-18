
`include "Constants.sv" 
module Encrypt(orig_key, plaintext, ciphertext, Clock, Done, Reset, Enable);
    // I/O
    input [`key_size - 1:0] orig_key;
    input [`size - 1:0] plaintext;
    input Clock, Reset, Enable;
    output [`size - 1:0] ciphertext;
    output Done;
    logic [4:0] count;
    logic [`key_size - 1:0] keys [0:num_rounds];
    logic [`size - 1:0] init_state, add_state, substituted, permuted;
    logic enable;

    // Creates the end signal for the process
    assign Done = (count == 31);

    // Set up keys
    InitPresent key_init (keys, orig_key);

    // iterations
    always @(posedge Clock or negedge Reset) begin
        if (Reset == 0 || Enable == 0)
            init_state <= plaintext;
        else if (Enable == 1)
            if (count == 31)
                init_state <= add_state;
            else
                init_state <= permuted;
            
    end

    always @(posedge Clock or negedge Reset) begin
        if (Reset == 0 || Enable == 0)
            count <= 0;
        else if (~Done && Enable == 1)
            count <= count + 1;
    end

    // Add Key
    AddRK key_summing (add_state, init_state, keys[count]);   // adds to last 64 bits

    // Substitution
    SubsLayer s_box (substituted, add_state);

    // Permutation
    PLayer p_box (permuted, substituted, Clock);

    // returns ciphered text
    assign ciphertext = init_state; 
endmodule
