`timescale 1ns / 1ps

module tb_sync_fifo;

reg clk;
reg rst;
reg wr_en;
reg rd_en;
reg [7:0] din;

wire [7:0] dout;
wire full;
wire empty;

// Instantiate DUT
sync_fifo uut (
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .din(din),
    .dout(dout),
    .full(full),
    .empty(empty)
);
always #5 clk = ~clk;
initial
begin
    clk   = 0;
    rst   = 1;
    wr_en = 0;
    rd_en = 0;
    din   = 0;

    #20 rst = 0;
    #10;
wr_en = 1; din = 8'h11;

#10;
din = 8'h22;

#10;
din = 8'h33;

#10;
wr_en = 0;
#10;
rd_en = 1;

#30;
rd_en = 0;
#10;
wr_en = 1;
rd_en = 1;
din   = 8'h44;

#10;
wr_en = 0;
rd_en = 0;

#20;
$finish;
end
endmodule