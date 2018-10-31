`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:17:47 10/31/2018
// Design Name:   num_in
// Module Name:   D:/num4_comp/num_test.v
// Project Name:  num4_comp
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: num_in
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module num_test;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg [7:0] C;
	// Outputs
	wire Y1;
	wire Y2;
	wire Y0;

	// Instantiate the Unit Under Test (UUT)
	num_in uut (
		.A(A), 
		.B(B),
		.Y1(Y1), 
		.Y2(Y2), 
		.Y0(Y0)
	);

	initial begin
		// Initialize Inputs
			C =8'd0;
			while(C<8'd225)begin
				C = C + 1;
				A=	C[3:0];
				B= C[7:4];
				#1;
			end
		// Add stimulus here

	end
      
endmodule

