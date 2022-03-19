
`include "test-constants.sv"
module testbench_initpresent();
    logic clk, reset;
    logic [`key_size-1:0] x; 
    logic [`key_size-1:0] yexp [0:`num_rounds];
    logic [`key_size-1:0] y [0:`num_rounds];
    logic [`counter_bits-1:0] vectornum, errors;
    logic [`key_size*34-1:0] testvectors [`num_vectors-1:0];

    // instantiates the dut module
    InitPresent dut_ip(.keys(y), .orig_key(x));

    // creates a clock signal
    always begin
        clk = 1; #5; clk = 0; #5;
    end

    // initializes variables and reads test cases
    initial begin
        $readmemh("cases-initpresent.mem", testvectors);
        vectornum = 0; errors = 0;
        reset = 1; #27; reset = 0;
    end

    // reads specific case
    always @(posedge clk) begin
        #1; {x, yexp} = testvectors[vectornum];
    end

    // applies test case and tracks errors
    always @(negedge clk) begin
        if (~reset) begin
            if (y !== yexp) begin
                $display("Error: inputs = %h", x);
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