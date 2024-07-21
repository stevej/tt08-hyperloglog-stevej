`default_nettype none
`timescale 1us/100 ns

`include "lzc.v"

module lzc_formal(
    input logic [31:0] in,
    output logic [31:0] out
);

lzc lzc(.in(in), .out(out));

always_comb begin
    cover(out == 32'h0); // only one solution which is 0xFFFF_FFFF
//    cover(out == 32'hFFFF_FFFF); // only one solution with is 0x0
end

endmodule
