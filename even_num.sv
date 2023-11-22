module even_num (
        output logic [6:0] HEX0,
        //output logic [6:0] HEX1,
        input logic [1:0] KEY
);

    // Get next even number
    logic [3:0] num;
    parameter INIT = 2;
    logic n_r = 0;
    logic KEY0_inverted;
    assign KEY0_inverted = ~KEY[0];
    fsm  #(INIT) DUT_num(.cur(num), .clock(KEY0_inverted), .reset(n_r));

    // Segment display
    logic [6:0] HEX0_inverted;
    assign HEX0 = ~HEX0_inverted;
    seven_seg DUT_seg(.seg(HEX0_inverted), .digit(num));



endmodule
