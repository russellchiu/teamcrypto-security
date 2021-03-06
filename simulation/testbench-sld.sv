
`include "test-constants.sv"
module testbench_sld();
    logic clk, reset;
    logic [`size-1:0] x; 
    logic [`size-1:0] yexp;
    logic [`size-1:0] y;
    logic [`counter_bits-1:0] vectornum, errors;
    logic [`size*2-1:0] testvectors [`num_vectors-1:0];

    // instantiates the dut module
    SubsLayerDecryption dut_sld(.substituted(y), .original(x));

    // creates a clock signal
    always begin
        clk = 1; #5; clk = 0; #5;
    end

    // initializes variables and reads test cases
    initial begin
        $readmemh("cases-sld.mem", testvectors);
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

