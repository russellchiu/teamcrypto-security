
`include "Constants.sv"
module InitPresent(keys, orig_key, round);
    input [`key_size - 1:0] orig_key;
    input [4:0] round;
    output [`key_size - 1:0] keys [0:`num_rounds];
    
    // intializes first key
    assign keys[0] = orig_key; 

    // instantiates scheduler
    KSA key_gen(round, keys[round], keys[round + 1]);

    // Done signal ?

    // Prof G?

    // for (i = 1; i < `num_rounds + 1; i = i + 1) begin
    //     // Generate Key
    //     KSA(round, keys[i], keys[i+1]);   // stores new key into the existing variable
    // end

endmodule
