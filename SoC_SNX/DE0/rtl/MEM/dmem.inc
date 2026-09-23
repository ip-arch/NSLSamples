/*******************************************************************************
*dmem: data memory for SN/X
*Verilog to NSL interface for MegaWizard generated module
********************************************************************************
* 2011.09.11   Initial version  by Y. Okuyama
*******************************************************************************/

declare dmem interface {
	input		clock; 			/* clock signal */
	input		address[12];
	input		data   [16];
	func_in		wren(address, data);
	output		q      [16];
}

