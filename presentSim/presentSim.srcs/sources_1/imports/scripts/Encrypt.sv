
module Encrypt(orig_key, plaintext, ciphertext, Clock, Done, Reset);
    // I/O
    input [key_size - 1:0] orig_key;
    input [size - 1:0] plaintext;
    input Clock;
    input Reset;
    output [size - 1:0] ciphertext;
    output Done;
    logic [4:0] count;
    logic [key_size - 1:0] keys [0:num_rounds];
    logic [size - 1:0] plaintext1, plaintext2, plaintext3, plaintext4;

    // Creates the end signal for the process
    assign Done = (count == 31);

    // Set up keys
    InitPresent(keys, orig_key);

    // iterations


    always @(posedge Clock or negedge Reset) begin
        if (reset == 0)
            plaintext4 <= plaintext;
        else
            if (count == 31)
                plaintext4 <= plaintext1;
            else
                plaintext4 <= plaintext3;
            
    end

    always @(posedge Clock or negedge Reset) begin
        if (reset == 0)
            count <= 0;
        else
            count <= count + 1;
    end

    // Add Key
    AddRK inst1 (plaintext1, plaintext4, keys[count]);   // adds to last 64 bits

    // Substitution
    SubsLayer(plaintext2, plaintext1);

    // Permutation
    PLayer(plaintext3, plaintext2);

    // returns ciphered text
    assign ciphertext = plaintext4; 
endmodule
