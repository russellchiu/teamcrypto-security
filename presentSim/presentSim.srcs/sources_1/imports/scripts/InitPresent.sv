
// Constants
`define key_size 80
// `define key_size 128;
`define size 64
`define num_rounds 32

module InitPresent(keys, orig_key);
    integer i;
    input [key_size - 1:0] orig_key;
    output [key_size - 1:0] keys [0:num_rounds];

    assign keys[1] = orig_key;
    for (i = 1; i < num_rounds + 1; i = i + 1) begin
        // Generate Key
        KSA(round, keys[i], keys[i+1]);   // stores new key into the existing variable
    end
endmodule
