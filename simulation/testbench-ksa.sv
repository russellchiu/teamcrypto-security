
`include "test-constants.sv"


module testbench_ksa();
    logic clk, reset;
    logic [`size:0] x;
    logic [5:0] round;
    logic [`size - 1:0] y;
    logic [`size - 1:0] yexp;

    logic [`counter_bits-1:0] vectornum, errors;
    logic [`key_size - 1:0] initvectors [0:4];
    logic [`size - 1:0] testvectors [0:4][1:32];

    logic index;
    integer count;

    // instantiates the dut module
    KSA dut_ksa (.new_key(y), .clk(clk), .rst(reset), .key(x), .round(round));

    // creates a clock signal
    always begin
        clk = 1; #5; clk = 0; #5;
    end

    // divides clock for test index updates
    always @(posedge clk)
        if (round == 32) begin
            if (index == 5)
                index = 0;
            else   
                index = index + 1;
        end

    // maintains round count
    always @(posedge clk)
        if (reset == 0 || round == 32)
            round <= 0;
        else
            round <= round + 1;

    // initializes variables and reads test cases
    initial begin
        $readmemh("origkeys", initvectors);
        $readmemh("cases-keys.mem", testvectors);
        vectornum = 0; errors = 0; count = 0;
        reset = 1; #27; reset = 0;
    end

    // reads specific case
    always @(posedge clk) begin
        if (~reset) begin
            if (round ==  0) begin
                #1; x = initvectors[index];
            end    
            else begin
                #1; yexp = testvectors[index][round];
            end
        end
    end

    // applies test case and tracks errors
    always @(posedge clk) begin
        if (~reset) begin
            if (y !== yexp) begin
                $display("Error in T %d R %d", index, round);
                $display("  output: %d, exp: %d", y, yexp);
                errors = errors + 1;
            end

            if (y == 8'bx)
                $display("%d tests completed with %d errors", index, errors);
        end
    end
                
endmodule

