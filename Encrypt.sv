
module Encrypt(orig_key, plaintext, ciphertext);
    // I/O
    input [key_size - 1:0] orig_key;
    input [size - 1:0] plaintext;
    output [size - 1:0] ciphertext;
    integer round;
    reg [key_size - 1:0] keys [0:num_rounds];

    // Set up keys
    InitPresent(keys, orig_key);

    // iterations
    for (round = 1; round < num_rounds; rounds = rounds + 1) begin

        // Add Key
        AddRK(plaintext, plaintext, keys[round]);   // adds to last 64 bits

        // Substitution
        SubsLayer(plaintext, plaintext);

        // Permutation
        PLayer(plaintext, plaintext);
    end
    
    // Add Key ?? Dr. G
    AddRK(plaintext, plaintext, keys[num_rounds]);   // adds to last 64 bits

    // returns ciphered text
    ciphertext = plaintext; 
endmodule
