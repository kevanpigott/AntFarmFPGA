//Author:Kevan Pigott
module threeToFour(in, out);
input [2:0]in;
output reg [3:0]out;

always@(*)
begin
out=in;
end
endmodule