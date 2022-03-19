// write_file_ex.v
// note that, we need to create Modelsim project to run this file,
// or provide full path to the input-file i.e. adder_data.txt  

`include "test-constants.sv"
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module testbench_pl2;
    
    logic [`size-1:0] x; 
    logic [`size-1:0] yexp;
    logic [`size-1:0] y;
    logic [`counter_bits-1:0] vectornum;
    logic [`size*2-1:0] testvectors [`num_vectors-1:0];
    integer i;

    PLayer dut_pl2(.permuted(y), .original(x));

    initial
    begin 

        $readmemh("cases-pl.mem", testvectors);
        
        for (i=0; i<5; i=i+1)
        begin
            {x, yexp} = testvectors[vectornum];
            #20;
        end

    end


endmodule