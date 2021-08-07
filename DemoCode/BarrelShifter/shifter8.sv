module shifter8 (input logic [7:0] a,
					  input logic [1:0] amt,
					 output logic [7:0] LSL,LSR,ASR,ROR);
always_comb
	case(amt) 
		2'b00: begin
					LSL = a;
					LSR = a;
					ASR = a;
					ROR = a;
				end
		2'b01: begin
					LSL = a<<1;
					LSR = a>>1;
					ASR = a>>>1;
					ROR = {a[0], a[7], a[6], a[5],a[4], a[3], a[2], a[1]};
				end
		2'b10: begin
					LSL = a<<2;
					LSR = a>>2;
					ASR = a>>>2;
					ROR = {a[1], a[0], a[7], a[6],a[5], a[4], a[3], a[2]};
				end
		2'b11:  begin
					LSL = {3'b000, a[4],a[3], a[2], a[1], a[0]};  
					LSR = {a[7], a[6], a[5], a[4],a[3], 3'b000}; 
					ASR = a>>>3;
					ROR = {a[2], a[1], a[0], a[7],a[6], a[5], a[4], a[3]};
				end
			default:  begin
					LSL = a;
					LSR = a;
					ASR = a;
					ROR = a;
				end
	endcase


endmodule