module next_pattern #(parameter MAX_n) (output logic [3:0] next, input logic [3:0] curr);
    // Even numbers upto MAX_n

    always_comb begin
        case (curr)
            MAX_n: next = 0;
            default: next = curr + 2;
        endcase
    end

endmodule


// pos edge d flip-flop with init
module my_dff #(parameter N=4, init=0) (
    output logic [N-1:0] q, input logic [N-1:0] d,
    input logic clk, r);
        always_ff @(posedge clk) q <= r ? init : d;
endmodule

module fsm #(parameter init=0) (
    output logic [3:0] cur, input logic clock, reset );

    logic [3:0] n;
    my_dff #(4, init) DUT_state( .q(cur), .d(n), .clk(clock), .r(reset));
    next_pattern #(8) next_fn( .next(n), .curr(cur) );
endmodule
