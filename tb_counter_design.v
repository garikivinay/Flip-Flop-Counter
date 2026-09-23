`timescale 1ns / 1ps

module tb_counter_design;
    reg clk;
    reg rst_n;
    reg count_en;
    reg dir_up_down;
    wire [3:0] count_out;
    wire terminal_count;

    smart_4bit_counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .count_en(count_en),
        .dir_up_down(dir_up_down),
        .count_out(count_out),
        .terminal_count(terminal_count)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst_n = 0; count_en = 0; dir_up_down = 1; #12;
        rst_n = 1; #10;
        count_en = 1; #100;
        dir_up_down = 0; #100;
        count_en = 0; #30;
        $finish;
    end
endmodule
