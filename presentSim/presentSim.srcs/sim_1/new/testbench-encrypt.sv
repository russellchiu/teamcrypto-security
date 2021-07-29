
`include "Constants.sv"
module testbench_encrypt();
    reg clk, reset;
    // check with Dr. G
    reg test_clock, test_done, test_reset;
    reg [`size-1:0] plaintext; 
    reg [`size-1:0] yexp;
    reg [`key_size-1:0] key;
    wire [`size-1:0] y;
    reg [`counter_bits-1:0] vectornum, errors;
    reg [`size*2 + key_size-1:0] testvectors [`num_vectors-1:0];

    // instantiates the dut module
    Encrypt dut_e(.orig_key(key), .plaintext(plaintext), .ciphertext(y), 
                .Clock(test_clock), .Done(test_done), .Reset(test_reset));

    // creates a clock signal
    always begin
        clk = 1; #5; clk = 0; #5;
    end

    // initializes variables and reads test cases
    initial begin
        $readmemh("cases-encrypt.mem", testvectors);
        vectornum = 0; errors = 0;
        reset = 1; #27; reset = 0;
    end

    // reads specific case
    always @(posedge clk) begin
        #1; {plaintext, key, yexp} = testvectors[vectornum];
    end

    // applies test case and tracks errors
    always @(negedge clk) begin
        if (~reset) begin
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
