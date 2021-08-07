module Barrel8bit(input logic [7:0] a,
						input logic [1:0] amt,
						input logic [1:0] opbarrel,
					  output logic [7:0] rmout);

	logic [7:0] w_LSL,w_LSR,w_ASR,w_ROR;

shifter8 sfifter8_inst (.a(a), .amt(amt),.ASR(w_ASR),.ROR(w_ROR),.LSL(w_LSL),.LSR(w_LSR));
barrel41mux mux_inst (.a(w_ASR),.b(w_ROR),.c(w_LSL),.d(w_LSR),.sel(opbarrel),.y(rmout));
 

endmodule