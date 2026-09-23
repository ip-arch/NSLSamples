
/*Produced by NSL Core(version=20171221), IP ARCH, Inc. Tue Jun 14 13:44:24 2022
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module imem ( clock , address , data , wren , q );
  input clock;
  wire clock;
  input [11:0] address;
  wire [11:0] address;
  input [15:0] data;
  wire [15:0] data;
  input wren;
  wire wren;
  output [15:0] q;
  wire [15:0] q;
  wire [15:0] sub_wire0;
  wire [11:0] _altsyncram_component_address_a;
  wire _altsyncram_component_clock0;
  wire [15:0] _altsyncram_component_data_a;
  wire _altsyncram_component_wren_a;
  wire [15:0] _altsyncram_component_q_a;
  wire _altsyncram_component_aclr0;
  wire _altsyncram_component_aclr1;
  wire [11:0] _altsyncram_component_address_b;
  wire _altsyncram_component_addressstall_a;
  wire _altsyncram_component_addressstall_b;
  wire _altsyncram_component_byteena_a;
  wire _altsyncram_component_byteena_b;
  wire _altsyncram_component_clock1;
  wire _altsyncram_component_clocken0;
  wire _altsyncram_component_clocken1;
  wire _altsyncram_component_clocken2;
  wire _altsyncram_component_clocken3;
  wire [15:0] _altsyncram_component_data_b;
  wire _altsyncram_component_eccstatus;
  wire [15:0] _altsyncram_component_q_b;
  wire _altsyncram_component_rden_a;
  wire _altsyncram_component_rden_b;
  wire _altsyncram_component_wren_b;
altsyncram altsyncram_component (.wren_b(_altsyncram_component_wren_b), .rden_b(_altsyncram_component_rden_b), .rden_a(_altsyncram_component_rden_a), .q_b(_altsyncram_component_q_b), .eccstatus(_altsyncram_component_eccstatus), .data_b(_altsyncram_component_data_b), .clocken3(_altsyncram_component_clocken3), .clocken2(_altsyncram_component_clocken2), .clocken1(_altsyncram_component_clocken1), .clocken0(_altsyncram_component_clocken0), .clock1(_altsyncram_component_clock1), .byteena_b(_altsyncram_component_byteena_b), .byteena_a(_altsyncram_component_byteena_a), .addressstall_b(_altsyncram_component_addressstall_b), .addressstall_a(_altsyncram_component_addressstall_a), .address_b(_altsyncram_component_address_b), .aclr1(_altsyncram_component_aclr1), .aclr0(_altsyncram_component_aclr0), .q_a(_altsyncram_component_q_a), .wren_a(_altsyncram_component_wren_a), .data_a(_altsyncram_component_data_a), .clock0(_altsyncram_component_clock0), .address_a(_altsyncram_component_address_a));
defparam altsyncram_component.read_during_write_mode_port_a = "NEW_DATA_NO_NBE_READ";
defparam altsyncram_component.power_up_uninitialized = "FALSE";
defparam altsyncram_component.outdata_reg_a = "UNREGISTERED";
defparam altsyncram_component.outdata_aclr_a = "NONE";
defparam altsyncram_component.operation_mode = "SINGLE_PORT";
defparam altsyncram_component.lpm_type = "altsyncram";
defparam altsyncram_component.lpm_hint = "ENABLE_RUNTIME_MOD=YES,INSTANCE_NAME=imem";
defparam altsyncram_component.intended_device_family = "Cyclone III";
defparam altsyncram_component.clock_enable_output_a = "BYPASS";
defparam altsyncram_component.clock_enable_input_a = "BYPASS";
defparam altsyncram_component.numwords_a = 4096;
defparam altsyncram_component.width_byteena_a = 1;
defparam altsyncram_component.width_a = 16;
defparam altsyncram_component.widthad_a = 12;

   assign  sub_wire0 = _altsyncram_component_q_a;
   assign  _altsyncram_component_address_a = address;
   assign  _altsyncram_component_clock0 = clock;
   assign  _altsyncram_component_data_a = data;
   assign  _altsyncram_component_wren_a = wren;
   assign  _altsyncram_component_aclr0 = 1'b0;
   assign  _altsyncram_component_aclr1 = 1'b0;
   assign  _altsyncram_component_address_b = 12'b000000000001;
   assign  _altsyncram_component_addressstall_a = 1'b0;
   assign  _altsyncram_component_addressstall_b = 1'b0;
   assign  _altsyncram_component_byteena_a = 1'b1;
   assign  _altsyncram_component_byteena_b = 1'b1;
   assign  _altsyncram_component_clock1 = 1'b1;
   assign  _altsyncram_component_clocken0 = 1'b1;
   assign  _altsyncram_component_clocken1 = 1'b1;
   assign  _altsyncram_component_clocken2 = 1'b1;
   assign  _altsyncram_component_clocken3 = 1'b1;
   assign  _altsyncram_component_data_b = 16'b0000000000000000;
   assign  _altsyncram_component_rden_a = 1'b1;
   assign  _altsyncram_component_rden_b = 1'b1;
   assign  _altsyncram_component_wren_b = 1'b0;
   assign  q = sub_wire0;
endmodule

/*Produced by NSL Core(version=20171221), IP ARCH, Inc. Tue Jun 14 13:44:24 2022
 Licensed to :EVALUATION USER*/
