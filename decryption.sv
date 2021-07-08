
module Decrypt(key, plaintext, ciphertext);
    // I/O
    input [keySize - 1:0] key;
    input [size - 1:0] plaintext;
    output [size - 1:0] ciphertext;
    integer round;

    // Set up keys
    Present(keys, key);

    // iterations
    for (round = numRounds; round > 1; rounds = rounds - 1) begin
        // Add Key
        addrk(plaintext, plaintext, keys[round]);   // adds to last 64 bits
        
        // Permutation
        pLayerDec(plaintext, plaintext);
        
        // Substitution
        SubsLayerDec(plaintext, plaintext);
        
    end
    
    // Add Key ?? Dr. G
    addrk(plaintext, plaintext, keys[1]);   // adds to last 64 bits

    // returns ciphered text
    ciphertext = plaintext; 
endmodule
