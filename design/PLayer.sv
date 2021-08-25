`include "Constants.sv"
module PLayer(
    input [`size - 1 : 0] original,
    output logic [`size - 1 : 0] permuted, 
    input Clock,
    output logic done
    );
    logic [5:0] i = `size - 1;
/*    
    logic PBox[0:63] = {0,16,32,48,1,17,33,49,2,18,34,50,3,19,35,51,
        4,20,36,52,5,21,37,53,6,22,38,54,7,23,39,55,
        8,24,40,56,9,25,41,57,10,26,42,58,11,27,43,59,
        12,28,44,60,13,29,45,61,14,30,46,62,15,31,47,63};
*/
    always @(posedge Clock) begin
        if (i != 0)
            i <= i - 1;
        else
            done = 1;
    end
    
    always @(*) begin
        if (i == 63) begin
            permuted[i] = original[i];
            done = 0;
        end
        else begin
            permuted[i] = original[(16 * i) % 63];
        end
        $display("original = %h", original);
        $display("permuted = %h", permuted);
    end

endmodule
