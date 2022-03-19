
//`include "test-constants.sv"

`define key_size 80
// `define key_size 128;
`define size 64
`define num_rounds 32

// sizes are defined for the blocks that are used
`define BLOCKSIZE 4
`define ARRSIZE 16

`define num_vectors 20
`define counter_bits 5


module testbench_encrypt();
// change all data types to logic
    logic clk, reset;
    logic enable;
    // check with Dr. G
    logic test_reset;
    logic [`size-1:0] plaintext; 
    logic [`size-1:0] yexp;
    logic [`key_size-1:0] key;
    logic [`size-1:0] y;
    logic test_done;
    logic [`counter_bits-1:0] vectornum, errors;
    logic [`size*2 + `key_size-1:0] testvectors [`num_vectors-1:0];

    // instantiates the dut module
    Test_Encrypt dut_enc(.orig_key(key), .plaintext(plaintext), .ciphertext(y), 
                .clk(clk), .done(test_done), .rst(test_reset));

    // creates a clock signal
    always begin
        clk = 1; #5; clk = 0; #5;
    end
    
    // set up reset
    initial begin
        test_reset = 1; #5; 
        test_reset = 0; #30;
        test_reset = 1;
        enable = 1;
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
