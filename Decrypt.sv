
module Decrypt(orig_key, plaintext, ciphertext);
    // I/O
    input [key_size - 1:0] orig_key;
    input [size - 1:0] plaintext;
    output [size - 1:0] ciphertext;
    integer round;

    // Set up keys
    Present(keys, orig_key);

    // iterations
    for (round = num_rounds; round > 1; rounds = rounds - 1) begin
        // Add Key
        AddRK(plaintext, plaintext, keys[round]);   // adds to last 64 bits
        
        // Permutation
        PLayerDec(plaintext, plaintext);
        
        // Substitution
        SubsLayerDec(plaintext, plaintext);
        
    end
    
    // Add Key ?? Dr. G
    AddRK(plaintext, plaintext, keys[1]);   // adds to last 64 bits

    // returns ciphered text
    ciphertext = plaintext; 
endmodule
