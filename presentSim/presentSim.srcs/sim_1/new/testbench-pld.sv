
`include "test-constants.sv"
module testbench_pld();
    reg clk, reset;
    reg [`size-1:0] x; 
    reg [`size-1:0] yexp;
    wire [`size-1:0] y;
    reg [`counter_bits-1:0] vectornum, errors;
    reg [`size*2-1:0] testvectors [`num_vectors-1:0];

    // instantiates the dut module
    PLayerDec dut_pld(.permuted(y), .original(x));

    // creates a clock signal
    always begin
        clk = 1; #5; clk = 0; #5;
    end

    // initializes variables and reads test cases
    initial begin
        $readmemh("cases-pld.mem", testvectors);
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