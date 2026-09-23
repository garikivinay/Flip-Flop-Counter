module d_flip_flop (
    input wire clk,
    input wire rst_n,
    input wire clk_en,
    input wire d_in,
    output reg q_out
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q_out <= 1'b0;
        else if (clk_en)
            q_out <= d_in;
    end
endmodule

module smart_4bit_counter (
    input wire clk,
    input wire rst_n,
    input wire count_en,
    input wire dir_up_down,
    output wire [3:0] count_out,
    output wire terminal_count
);
    wire [3:0] next_count;
    wire [3:0] current_count;

    assign next_count = (dir_up_down) ? (current_count + 1'b1) : (current_count - 1'b1);

    d_flip_flop bit_0 (.clk(clk), .rst_n(rst_n), .clk_en(count_en), .d_in(next_count[0]), .q_out(current_count[0]));
    d_flip_flop bit_1 (.clk(clk), .rst_n(rst_n), .clk_en(count_en), .d_in(next_count[1]), .q_out(current_count[1]));
    d_flip_flop bit_2 (.clk(clk), .rst_n(rst_n), .clk_en(count_en), .d_in(next_count[2]), .q_out(current_count[2]));
    d_flip_flop bit_3 (.clk(clk), .rst_n(rst_n), .clk_en(count_en), .d_in(next_count[3]), .q_out(current_count[3]));

    assign count_out = current_count;
    assign terminal_count = (dir_up_down) ? (&current_count) : (~|current_count);

endmodule
