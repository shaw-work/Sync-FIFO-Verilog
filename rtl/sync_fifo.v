`timescale 1ns / 1ps
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
    case ({wr_en, rd_en})

        2'b00: begin
            // no operation
        end

        2'b10: begin
            if(!full)
            begin
                mem[w_ptr] <= din;
                w_ptr <= w_ptr + 1;
                count <= count + 1;
            end
        end

        2'b01: begin
            if(!empty)
            begin
                dout <= mem[r_ptr];
                r_ptr <= r_ptr + 1;
                count <= count - 1;
            end
        end

        2'b11: begin
            if(!full && !empty)
            begin
                mem[w_ptr] <= din;
                w_ptr <= w_ptr + 1;

                dout <= mem[r_ptr];
                r_ptr <= r_ptr + 1;

                count <= count;
            end
        end

    endcase
end
end
endmodule