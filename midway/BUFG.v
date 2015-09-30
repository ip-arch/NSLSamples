
module DCM (  CLKFB , CLKIN , PSCLK , PSEN , PSINCDEC , RST , STATUS , LOCKED , CLKFX180 , CLKFX , CLKDV , CLK2X180 , CLK2X , CLK270 , CLK180 , CLK90 , CLK0 , PSDONE );
   parameter CLK_FEEDBACK ="";
  parameter CLKDV_DIVIDE = 0;
 
input CLKFB;
input CLKIN;
input PSCLK;
input PSEN;
input PSINCDEC;
input RST;
output [7:0] STATUS;
output LOCKED;
output CLKFX180;
output CLKFX;
output CLKDV;
output CLK2X180;
output CLK2X;
output CLK270;
output CLK180;
output CLK90;
output CLK0;
output PSDONE;
   assign CLKDV = CLKIN;
/* Produced by sfl2vl: IP ARCH, Inc. http://www.ip-arch.jp/ */
/* Without purchased license, you are only allowed to use generated module for educational and/or your personal projects.  */
endmodule

module BUFG (  O , I );
output O;
input I;
   assign O = I;
/* Produced by sfl2vl: IP ARCH, Inc. http://www.ip-arch.jp/ */
/* Without purchased license, you are only allowed to use generated module for educational and/or your personal projects.  */
endmodule
