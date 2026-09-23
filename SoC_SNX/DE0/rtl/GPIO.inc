/*******************************************************************************
*LED: GPIO control module
********************************************************************************
* 2011.09.11   Initial version  by Y. Okuyama
* 2022.06.13   modified from LED by N. Shimizu
*******************************************************************************/

declare GPIO {
	input		adrs[3];
	input		datai[16];
	output		datao[16];
	inout		GPIO_0[36];
	inout		GPIO_1[36];
	func_in		write(adrs,datai);
	func_in		direction(adrs,datai);
	func_in		read(adrs):datao;
}
