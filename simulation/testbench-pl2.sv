
`include "test-constants.sv"
module testbench_pl();
    logic [`size-1:0] x; 
    logic [`size-1:0] yexp;
    logic [`size-1:0] y;
    logic [`counter_bits-1:0] vectornum;
    logic [`size*2-1:0] testvectors [`num_vectors-1:0];

    // instantiates the dut module
    PLayer dut_pl(.permuted(y), .original(x));

    // initializes variables and reads test cases
    initial begin
        $readmemh("cases-pl.mem", testvectors); #10;
        {x, yexp} = testvectors[vectornum]; #10;

        if (y != yexp) begin
            $display("Error");
        end
        else begin
            $display("Works")
        end
    end

endmodule