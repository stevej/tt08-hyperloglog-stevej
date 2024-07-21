`ifndef _LZC_
`define _LZC_

`default_nettype none
`timescale 1us/100 ns

module lzc #(
    parameter bit W_IN = 32, // Must be power of 2, >=2
    parameter bit W_OUT = $clog2(W_IN) // Let this default
) (
    input wire  [W_IN-1:0] in,
    output wire [W_OUT-1:0] out
);

generate
if (W_IN == 2) begin: gen_base
    assign out = !in[1];
end else begin: gen_recurse
    wire [W_OUT-2:0] half_count;
    wire [W_IN / 2-1:0] lhs = in[W_IN / 2 +: W_IN / 2];
    wire [W_IN / 2-1:0] rhs = in[0        +: W_IN / 2];
    wire left_empty = ~|lhs;

    lzc #(
        .W_IN (W_IN / 2)
    ) inner (
        .in  (left_empty ? rhs : lhs),
        .out (half_count)
    );

    assign out = {left_empty, half_count};
end
endgenerate

endmodule
`endif // _LZC_
