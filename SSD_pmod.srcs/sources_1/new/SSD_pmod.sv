`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2016 21:19:20
// Design Name: 
// Module Name: SSD_pmod
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SSD_pmod(
	input	    [7:0]	number,
	input		    	clk,
	input	    [3:0]	SSD_in1,
	input	    [3:0]	SSD_in2,
	output	    [3:0]	SSD_ena1,
	output	    [3:0]	SSD_ena2,
	output	reg [3:0]	SSD_out1,
	output	reg [3:0]	SSD_out2
    );

logic [7:0]	segments;
logic		counter = 0;
logic [3:0] digit;

	assign SSD_ena1 = 0;
	assign SSD_ena2 = 0;

//	logic [7:0] number = 8'h42;

	always_ff @(posedge clk)
	begin
		counter <= ~counter;
		if (counter)	digit = number[3:0];
		else			digit = number[7:4];
	end

	always_comb
		case (digit)
			4'h0:		segments <= 7'b0111111;
			4'h1:		segments <= 7'b0000110;
			4'h2:		segments <= 7'b1011011;
			4'h3:		segments <= 7'b1001111;
			4'h4:		segments <= 7'b1100110;
			4'h5:		segments <= 7'b1101101;
			4'h6:		segments <= 7'b1111101;
			4'h7:		segments <= 7'b0000111;
			4'h8:		segments <= 7'b1111111;
			4'h9:		segments <= 7'b1101111;
			4'ha:		segments <= 7'b1110111;
			4'hb:		segments <= 7'b1111100;
			4'hc:		segments <= 7'b0111001;
			4'hd:		segments <= 7'b1011110;
			4'he:		segments <= 7'b1111001;
			4'hf:		segments <= 7'b1110001;
			default:	segments <= 7'b1001001;
		endcase

    always_ff @(posedge clk)
    begin
        SSD_out1 <= segments[3:0];
        SSD_out2[2:0] <= segments[6:4];
        SSD_out2[3] <= counter;
    end

endmodule
