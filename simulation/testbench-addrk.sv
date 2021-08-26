
`include "test-constants.sv"
module testbench_addrk();
    logic clk, reset;
    logic [`key_size - 1 :0] x;
    logic [`key_size - 1 :0] yexp;
    logic [`key_size - 1 :0] key;
    logic [`key_size - 1 :0] y;
    logic [`counter_bits-1:0] vectornum, errors;
    logic [`key_size *3-1:0] testvectors [`num_vectors-1:0];

    // instantiates the dut module
    AddRK dut_addrk(.y(y), .a(x), .b(key));

    // creates a clock signal
    always begin
        clk = 1; #5; clk = 0; #5;
    end

    // initializes variables and reads test cases
    initial begin
        $readmemh("cases-addrk.mem", testvectors);
        vectornum = 0; errors = 0;
        reset = 1; #27; reset = 0;
    end

    // reads specific case
    always @(posedge clk) begin
        #1; {x, key, yexp} = testvectors[vectornum];
    end

    // applies test case and tracks errors
    always @(negedge clk) begin
        if (~reset) begin
            if (y !== yexp) begin
                $display("Error: inputs = %h, %h", x, key);
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