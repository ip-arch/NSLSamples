LED = 0xA002;
UART_DAT = 0xA040;
UART_ST  = 0xA041;

for (i=0; i< 1000; i++) ;

*LED=*UART_ST;

while ((*UART_ST & 2) == 0) ;
*UART_DAT = 0x48;
while ((*UART_ST & 2) == 0) ;
*UART_DAT = 0x65;
while ((*UART_ST & 2) == 0) ;
*UART_DAT = 0x6c;
while ((*UART_ST & 2) == 0) ;
*UART_DAT = 0x6c;
while ((*UART_ST & 2) == 0) ;
*UART_DAT = 0x6f;
while ((*UART_ST & 2) == 0) ;
*UART_DAT = 0x0a;
while ((*UART_ST & 2) == 0) ;
*UART_DAT = 0x0d;

while(1) {
  while ((*UART_ST & 1) == 0) ;
*LED=*UART_ST;
  data=*UART_DAT;
  while ((*UART_ST & 2) == 0) ;
*LED=*UART_ST;
  *UART_DAT = data + 1;
}
halt;
