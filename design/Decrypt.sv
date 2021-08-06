
`include "Constants.sv"
module Decrypt(orig_key, ciphertext, plaintext, Clock, Done, Reset, Enable);
    // I/O
    input [`key_size - 1:0] orig_key;
    input [`size - 1:0] ciphertext;
    input Clock, Reset, Enable;
    output [`size - 1:0] plaintext;
    output Done;
    logic [4:0] count;
    logic [`key_size - 1:0] keys [0:num_rounds];
    logic [`size - 1:0] init_state, add_state, permuted, substituted;

    // Creates the end signal for the process
    assign Done = (count == 2);

    // Set up keys
    InitPresent key_init (keys, orig_key);

    // Iterate
    always @(posedge Clock or negedge Reset) begin
        if (Reset == 0 || Enable == 0)
            init_state <= ciphertext;
        else if (Enable == 1)
            if (count == 2)
                init_state <= add_state;
            else
                init_state <= substituted;
            
    end

    // Decrements counter
    always @(posedge Clock or negedge Reset) begin
        if (Reset == 0 || Enable == 0)
            count <= num_rounds;
        else if (Enable == 1 && ~Done)
            count <= count - 1;
    end

    // Add Key
    AddRK key_summing (add_state, init_state, keys[count]);   // adds to last 64 bits

    // Permutation
    PLayer p_box (permuted, add_state);

    // Substitution
    SubsLayer s_box (substituted, permuted);

    // returns ciphered text
    assign plaintext = init_state; 
endmodule
