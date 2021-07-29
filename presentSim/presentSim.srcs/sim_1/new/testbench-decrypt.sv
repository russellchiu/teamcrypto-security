
include "Constants.sv"
module testbench_decrypt();
    reg clk, reset;
    // ask Dr. G about how to set these registers
    reg test_clock, test_done, test_reset;
    reg [`size-1:0] ciphertext; 
    reg [`size-1:0] yexp;
    reg [`key_size-1:0] key;
    wire [`size-1:0] y;
    reg [`counter_bits-1:0] vectornum, errors;
    reg [`size*2 + key_size-1:0] testvectors [`num_vectors-1:0];

    // instantiates the dut module
    Decrypt dut_dec(.orig_key(key), .ciphertext(ciphertext), .plaintext(y), .Clock(test_clock), .Done(test_done), .Reset(test_reset));

    // makes test clock for module
    always begin
        test_clock = 1; #2; test_clock = 0; #2;
    end


    // creates a clock signal
    always begin
        clk = 1; #7; clk = 0; #7;
    end

    // initializes variables and reads test cases
    initial begin
        $readmemh("cases-decrypt.mem", testvectors);
        vectornum = 0; errors = 0;
        reset = 1; #27; reset = 0;
    end

    // reads specific case
    always @(posedge clk) begin
        #1; {key, ciphertext, yexp} = testvectors[vectornum];
    end

    // applies test case and tracks errors
    always @(negedge clk) begin
        if (~reset) begin
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
