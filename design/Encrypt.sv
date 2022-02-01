
`include "Constants.sv" 
module Encrypt(orig_key, plaintext, ciphertext, Clock, Done, Reset, Enable);
    // I/O
    input [`key_size - 1:0] orig_key;
    input [`size - 1:0] plaintext;
    input Clock, Reset, Enable;
    output [`size - 1:0] ciphertext;
    output Done;
    logic [4:0] count;
    logic [`key_size-1:0] key; //, key2;
    // logic [`key_size - 1:0] keys [0:`num_rounds];
    logic [`size - 1:0] init_state, add_state, substituted, permuted;

    logic [`rounds_size:0] round;

    // Creates the end signal for the process
    assign Done = (count == 31);

    // Set up keys
//    InitPresent key_init (keys, orig_key);

    always @(posedge Clock or negedge Reset) begin
        if (Reset == 0)
            round <= 0;
        else if (round == 32)
            round <= 1;
        else
            round <= round + 1;
    end

    /*always @(posedge Clock or negedge Reset) begin
        if (Reset == 0)
            key <= orig_key;
        else
            key <= key2;
    end*/

    // iterations
    always @(posedge Clock or negedge Reset) begin
        if (Reset == 0 || Enable == 0)
            init_state <= plaintext;
        else if (Enable == 1) begin
            if (count == 31)
                init_state <= add_state;
            else
                init_state <= permuted;
        end
    end
    // round count
    always @(posedge Clock or negedge Reset) begin
        if (Reset == 0 || Enable == 0)
            count <= 0;
        else if (~Done && Enable == 1)
            count <= count + 1;
    end

    // KSA
    // KSA scheduler (key2, Clock, Reset, key, round);
    KSA scheduler (key, Clock, Reset, orig_key, round);

    // Add Key
    AddRK key_summing (add_state, init_state, key[(`key_size-1):(`key_size-`size)]);   // adds to last 64 bits

    // Substitution
    SubsLayer s_box (substituted, add_state);

    // Permutation
    PLayer p_box (permuted, substituted);

    // returns ciphered text
    assign ciphertext = init_state; 
    
endmodule
