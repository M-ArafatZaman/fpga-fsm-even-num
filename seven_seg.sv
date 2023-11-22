module seven_seg(output logic [6:0] seg, input logic [3:0] digit);
    always_comb begin
        case (digit)
            //gfedcba DE10_lite 0=on so we invert in the labs_top.sv
            0 : seg = 7'b0111111;
            1 : seg = 7'b0000110;
            2 : seg = 7'b1011011;
            3 : seg = 7'b1001111;
            4 : seg = 7'b1100110;
            5 : seg = 7'b1101101;
            6 : seg = 7'b1111101;
            7 : seg = 7'b0000111;
            8 : seg = 7'b1111111;
            9 : seg = 7'b1101111;
            default : seg = 7'b0000000;
        endcase
    end
endmodule