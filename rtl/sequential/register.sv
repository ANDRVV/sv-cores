module sr_latch (
    input logic reset,
    input logic set,
    output logic q,
    output logic q_n
);
    assign q = ~(set | q_n);
    assign q_n = ~(reset | q);

endmodule

module d_latch (
    input logic clk,
    input logic d,
    output logic q,
    output logic q_n
);
    logic g1;
    logic g2;

    assign g1 = clk & ~d;
    assign g2 = clk & d;
    sr_latch i1 (
        .reset(g1),
        .set(g2),
        .q(q),
        .q_n(q_n)
    );

endmodule

module d_flip_flop (
        input logic clk,
        input logic d,
        output logic q,
        output logic q_n
    );

    logic g1;

    d_latch master (
        .clk(clk),
        .d(d),
        .q(g1)
        .q_n()
    );
    d_latch slave (
        .clk(~clk),
        .d(g1),
        .q(q),
        .q_n(q_n)
    )

endmodule