
module Decrypt(orig_key, ciphertext, plaintext, Clock, Done, Reset);
    // I/O
    input [key_size - 1:0] orig_key;
    input [size - 1:0] ciphertext;
    input Clock, Reset;
    output [size - 1:0] plaintext;
    output Done;
    logic [4:0] count;
    logic [key_size - 1:0] keys [0:num_rounds];
    logic [size - 1:0] init_state, add_state, permuted, substituted;

    // Creates the end signal for the process
    assign Done = (count == 2);

    // Set up keys
    InitPresent key_init (keys, orig_key);

    // iterations


    always @(posedge Clock or negedge Reset) begin
        if (Reset == 0)
            init_state <= ciphertext;
        else
            if (count == 2)
                init_state <= add_state;
            else
                init_state <= substituted;
            
    end

    always @(posedge Clock or negedge Reset) begin
        if (Reset == 0)
            count <= num_rounds;
        else
            count <= count - 1;
    end

    // Add Key
    AddRK key_summing (add_state, init_state, keys[count]);   // adds to last 64 bits

    // Permutation
    PLayer p_box (permuted, substituted);

    // Substitution
    SubsLayer s_box (substituted, add_state);

    // returns ciphered text
    assign plaintext = init_state; 
endmodule
