
module Encrypt(key, plaintext, ciphertext);
    // I/O
    input [keySize - 1:0] key;
    input [size - 1:0] plaintext;
    output [size - 1:0] ciphertext;
    integer round;
    reg [keySize - 1:0] keys [0:numRounds];

    // Set up keys
    Present(keys, key);

    // iterations
    for (round = 1; round < numRounds; rounds = rounds + 1) begin

        // Add Key
        addrk(plaintext, plaintext, keys[round]);   // adds to last 64 bits

        // Substitution
        SubsLayer(plaintext, plaintext);

        // Permutation
        pLayer(plaintext, plaintext);
    end
    
    // Add Key ?? Dr. G
    addrk(plaintext, plaintext, keys[numRounds]);   // adds to last 64 bits

    // returns ciphered text
    ciphertext = plaintext; 
endmodule
