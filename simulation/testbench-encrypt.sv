
`include "test-constants.sv"
module testbench_encrypt();
// change all data types to logic
    logic clk, reset;
    // check with Dr. G
    logic test_reset;
    logic [`size-1:0] plaintext; 
    logic [`size-1:0] yexp;
    logic [`key_size-1:0] key;
    logic [`size-1:0] y;
    logic test_done;
    logic [`counter_bits-1:0] vectornum, errors;
    logic [`size*2 + key_size-1:0] testvectors [`num_vectors-1:0];

    // instantiates the dut module
    Encrypt dut_enc(.orig_key(key), .plaintext(plaintext), .ciphertext(y), 
                .Clock(clk), .Done(test_done), .Reset(test_reset));

    // creates a clock signal
    always begin
        clk = 1; #5; clk = 0; #5;
    end

    // set up reset
    initial begin
        test_reset = 1; #5; 
        test_reset = 0; #15;
        test_reset = 1;
    end

    // initializes variables and reads test cases
    initial begin
        $readmemh("cases-encrypt.mem", testvectors);
        vectornum = 0; errors = 0;
    end

    // reads specific case
    always @(posedge clk) begin
        #1; {plaintext, key, yexp} = testvectors[vectornum];
    end

    // applies test case and tracks errors
    always @(negedge clk) begin
        if (test_done) begin
            if (y !== yexp) begin
                $display("Error: inputs = %h, %h", plaintext, key);
                $display("  outputs = %h (%h exp)", y, yexp);
                errors = errors + 1;
            end
            
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 8'bx) begin
                $display("%d tests completed with %d errors", vectornum, errors);
                $finish;
            end
        end
    end
                
endmodule
