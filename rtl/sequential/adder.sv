module full_adder (
    input logic a,
    input logic b,
    input logic carry_in,
    output logic s,
    output logic carry_out
);

    logic g1;
    logic g2;

    assign g1 = a ^ b;
    assign s = g1 ^ carry_in;
    assign g2 = g1 & carry_in;
    assign carry_out = g2 | (a & b)

endmodule