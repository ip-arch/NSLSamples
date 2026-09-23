// SPDX-License-Identifier: GPL-3.0-or-later
// Copyright (C) 2026 Naohiko Shimizu <nshimizu@ip-arch.jp>
/*
* UART declaration
*
* Only asynchronous txd/rxd are supported
* RS232C signals: rxd, txd
* Host signals:
*   Recieve data: data_in
*    When data is ready, rx_ready is asserted.
*   Send data: data_out
*    Host can send send_txdata(data_out) only when txready is asserted
*   Clock devider:
*    Host can set clock devider to set the baud rate
*    The value is F/baud_rate
*/
declare uart {
 input rxd;            // Serial RXD
 output data_in[8];    // To Host data
 func_in read_rxdata(): data_in; // Host to UART Data
 func_out rxready(); // UART to Host data ready

 output txd;           // Serial TXD
 input  data_out[8];   // Host to Serial DATA
 func_in send_txdata(data_out); // Host sending request
 func_out txready();   // UART ready to send

 input  ck_div[16];
 func_in set_divider(ck_div);
}

#ifdef DEBUG
#define DEFAULT_DIV 20
#else
#define DEFAULT_DIV (50000000/9600)
#endif
