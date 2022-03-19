
module testbench1();
    reg [3:0] x;
    wire [3:0] y;
    SBox dut(.substituted(y), .orig(x));

    initial begin
        x = 4'h0; #10;
        if (y !== 4'hC) $display("Failed at x = 0");
        x = 4'h1; #10;
        if (y !== 4'h5) $display("Failed at x = 1");
        x = 4'h2; #10;
        if (y !== 4'h6) $display("Failed at x = 2");
       
       // edge case
        x = 4'hF; #10;
        if (y !== 4'h2) $display("Failed at x = F");
    end
endmodule
