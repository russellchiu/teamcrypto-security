
module testbench1();
    reg x;
    wire y;
    SBox dut(.substituted(y), .orig(x));

    initial begin
        x = 0; #10;
        if (y !== 4'hC) $display("Failed at x = 0");
        x = 1;
        if (y !== 4'h5) $display("Failed at x = 1");
        x = 2;
        if (y !== 4'h6) $display("Failed at x = 2");
    end
endmodule
