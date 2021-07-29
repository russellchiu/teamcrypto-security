
`include "test-constants.sv"
module testbench2();
    reg clk, reset;
    reg [3:0] x; 
    reg [3:0] yexp;
    wire [3:0] y;
    reg [`counter_bits-1:0] vectornum, errors;
    reg [7:0] testvectors[`num_vectors-1:0];

    // instantiates the dut module
    SBox dut2(.substituted(y), .orig(x));

    // creates a clock signal
    always begin
        clk = 1; #5; clk = 0; #5;
    end

    // initializes variables and reads test cases
    initial begin
        $readmemh("cases-sb.mem", testvectors);
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

