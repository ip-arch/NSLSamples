/* SNX class comment body */ 
declare    snx_system  {   
    input    datai[16]; 
    output    datao[16]; 
    output    adrs[16];   
    func_in     intr();
    func_out    memory_read(adrs); 
    func_out    memory_write(adrs,datao); 
    func_out debug();
} 
  
