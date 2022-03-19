
`include "Constants.sv"
module Test_Encrypt(orig_key, plaintext, ciphertext, clk, done, rst);
    // I/O
    input [`key_size - 1:0] orig_key;
    input [`size - 1:0] plaintext;
    input clk, rst;
    output [`size - 1:0] ciphertext;
    output done;

    // Vars
    logic [6:0] count;
    logic [`key_size-1:0] key, key_in;
    logic [`size - 1:0] init_state, add_state, substituted, permuted;

    assign done = (count == 31);

    // Round Count
    always @(posedge clk)
    	if (rst == 0)
    		count <= 0;
    	else if (count == 32)
    		count <= 1;
    	else
    		count <= count + 1;

    // iteration loop
    always @(posedge clk)
    	if (rst == 0)
    		init_state <= plaintext;
    	else begin
    		if (count == 31)
    			init_state <= add_state;
    		else
    			init_state <= permuted;
    	end

     always @(posedge clk)
     	if (rst == 0)
     		key_in <= orig_key;
     	else
     		key_in <= key;

    // KSA
    KSA scheduler (key, clk, rst, key_in, count);

    // Add Key
    AddRK key_summing (add_state, init_state, key[(`key_size-1):(`key_size-`size)]);   // adds to last 64 bits

    // Substitution
    SubsLayer s_box (substituted, add_state);

    // Permutation
    PLayer p_box (substituted, permuted);

    // returns ciphered text
    assign ciphertext = init_state; 
    
endmodule