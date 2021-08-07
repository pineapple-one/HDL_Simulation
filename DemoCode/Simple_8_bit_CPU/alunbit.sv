module alunbit ( input logic [7:0] a,b,
				 input logic [1:0] ALUcontrol, 
				output logic [7:0] result,
				output logic [7:0] ALUflags);

				logic [7:0] cond_inv_b;
            logic [8:0] sum;
				logic neg,zero,Carry,overflow;
				
assign cond_inv_b = ALUcontrol [0] ? ~b : b;
assign sum = a + cond_inv_b + ALUcontrol[0];


always_comb
	casez (ALUcontrol)
		2'b0?: result = sum;
		2'b10: result = a & b;
		2'b11: result = a | b;
	endcase
	
assign neg = result[7];
assign zero = (result == 8'b0000_0000);
assign Carry = (ALUcontrol[1] == 1'b0) & sum[8];
assign overflow = ~(ALUcontrol[1]) & ~(a[7]^b[7]^ALUcontrol[0]) & (a[7]^sum[7]);

assign ALUflags = {neg,zero,Carry,overflow}	;
endmodule