
include "test-constants.sv"
module testbench_decrypt();
    logic clk, reset;
    // ask Dr. G about how to set these registers
    logic test_done, test_reset;
    logic [`size-1:0] ciphertext; 
    logic [`size-1:0] yexp;
    logic [`key_size-1:0] key;
    logic [`size-1:0] y;
    logic [`counter_bits-1:0] vectornum, errors;
    logic [`size*2 + key_size-1:0] testvectors [`num_vectors-1:0];

    // instantiates the dut module
    Decrypt dut_dec(.orig_key(key), .ciphertext(ciphertext), .plaintext(y), .Clock(clk), .Done(test_done), .Reset(test_reset));

    // creates a clock signal
    always begin
        clk = 1; #7; clk = 0; #7;
    end

    // initializes variables and reads test cases
    initial begin
        $readmemh("cases-decrypt.mem", testvectors);
        vectornum = 0; errors = 0;
    end

    // reads specific case
    always @(posedge clk) begin
        #1; {key, ciphertext, yexp} = testvectors[vectornum];
    end

    // applies test case and tracks errors
    always @(negedge clk) begin
        if (test_done) begin
            if (y !== yexp) begin
                $display("Error: inputs = %h, %h", ciphertext, key);
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
