
`include "Constants.sv"
module InitPresent(keys, orig_key, clk, reset);
    integer i;
    input [`key_size - 1:0] orig_key;
    input clk, reset;
    output [`key_size - 1:0] keys [0:`num_rounds];
    logic [4:0] round;

    // intializes first key
    assign keys[0] = orig_key; 
    
    // advancing round
    always @((posedge clk or negedge reset) and (round != 32)) begin
        if(reset == 0) 
            round <= 1;
        else   
            round <= round + 1;
    end

    // instantiates scheduler
    KSA key_gen(round, keys[round - 1], keys[round]);

    // Done signal ?

    // Prof G?

    // for (i = 1; i < `num_rounds + 1; i = i + 1) begin
    //     // Generate Key
    //     KSA(round, keys[i], keys[i+1]);   // stores new key into the existing variable
    // end

endmodule
