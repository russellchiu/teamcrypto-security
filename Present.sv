
// Constants
parameter keySize = 80;
// parameter keySize = 128;
parameter size = 64;
parameter numRounds = 32;

module InitPresent(keys, origKey);
    integer i;
    input [keySize - 1:0] origKey;
    output [keySize - 1:0] keys [0:numRounds];

    keys[1] = origKey;
    for (i = 1; i < numRounds + 1; i = i + 1) begin
        // Generate Key
        KSA(round, keys[i], keys[i+1]);   // stores new key into the existing variable
    end
endmodule