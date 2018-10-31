`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:42:06 10/31/2018 
// Design Name: 
// Module Name:    num_in 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module num_in(A,B,Y1,Y2,Y0);
input [3:0]A,B;
output Y1,Y2,Y0;
reg Y1,Y2,Y0,C;
always@(A or B)
	begin
		if(A>B)
			begin
				Y1 = 1;
				Y2 = 0;
				Y0 = 1;
			end
		else if(A==B)
			begin
				Y2 = 1;
				Y0 = 1;
				Y1 = 0;
			end
		else
			begin
				Y0 = 0;
				Y2 = 1;
				Y1 = 1;
			end
		end
endmodule
