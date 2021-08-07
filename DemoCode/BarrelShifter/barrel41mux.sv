module barrel41mux (input logic [7:0] a,b,c,d,
						  input logic [1:0] sel,
						 output logic [7:0] y);

assign y = sel[1] ?( sel[0] ? a : b ): 
                   ( sel[0] ? c : d );

endmodule