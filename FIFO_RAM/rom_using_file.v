//-----------------------------------------------------
module rom_using_file (
address , // Address input
data    , // Data output
read_en , // Read Enable 
ce        // Chip Enable
);
input [7:0] address;
output [7:0] data; 
input read_en; 
input ce; 
           
reg [7:0] mem [0:255] ;  
      
assign data = (ce && read_en) ? mem[address] : 8'b0;

initial begin
  $readmemb("memory.list", mem); // memory_list is memory file
end

endmodule

//-----------------------------------------------------
// TB
//-----------------------------------------------------


module rom_tb;
 reg [7:0] address;
 reg read_en, ce;
 wire [7:0] data;
 integer i;
 
 initial begin
   address = 0;
   read_en = 0;
   ce      = 0;
   for (i = 0; i <256; i = i +1 )begin
     #5 address = i;
     read_en = 1;
     ce = 1;
     #5 read_en = 0;
     ce = 0;
     address = 0;
   end
 end
 
rom_using_file DUT(
address , // Address input
data    , // Data output
read_en , // Read Enable
ce        // Chip Enable
);

endmodule

