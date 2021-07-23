
module testbench2();
    reg clk, reset, x, yexp;
    wire y;
    reg [31:0] vectornum, errors;
    reg[3:0] testvectors[10000:0];

    // instantiates the dut module
    SBox dut2(.substituted(y), .orig(x));

    // creates a clock signal
    always begin
        clk = 1; #5; clk = 0; #5;
    end

    // initializes variables and reads test cases
    initial begin
        $readmemh("sbox-test.tv", testvectors);
        vectornum = 0; errors = 0;
        reset = 1; #27; reset = 0;
    end

    // reads specific case
    always @(posedge clk) begin
        #1; {x, yexp} = testvectors[vectornum];
    end

    // applies test case and tracks errors
    always @(negedge clk) begin
        if (~reset)
            if (y !== yexp)
                $display("Error: inputs = %h", x);
                $display("  outputs = %h (%h exp)", y, yexp);
                errors = errors + 1;
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 4'bx)
                $display("%d tests completed with %d errors", vectornum, errors);
                $finish;
    end
                
endmodule
