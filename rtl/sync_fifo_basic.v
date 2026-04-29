module sync_fifo(
    input clk,
    input rst,
    input wr_en,
    input rd_en,
    input [7:0] din,
    output reg [7:0] dout,
    output full,
    output empty
);

reg [7:0] mem [0:15];   // 16 locations, each 8-bit
reg [3:0] w_ptr;        // write pointer
reg [3:0] r_ptr;        // read pointer
reg [4:0] count; 
assign full  = (count == 16);
assign empty = (count == 0);
always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        w_ptr <= 0;
        r_ptr <= 0;
        count <= 0;
        dout  <= 0;
    end
    else
    begin
    if(wr_en && !full)
begin
    mem[w_ptr] <= din;
    w_ptr <= w_ptr + 1;
    count <= count + 1;
end
    if(rd_en && !empty)
begin
    dout <= mem[r_ptr];
    r_ptr <= r_ptr + 1;
    count <= count - 1;
end
    end
end       // stores number of items (0 to 16)

endmodule