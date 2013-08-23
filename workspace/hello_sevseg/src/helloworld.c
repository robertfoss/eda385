#include <stdint.h>
#include <stdio.h>
#include "platform.h"
#include "xil_io.h"
#include "xparameters.h"

#define READ_KEYBOARD	(0xCB600000)
#define SS_BASEADDR		(0xCD600000)


#define sleep(ms) for(iiii = 0; iiii < ms*5000; ++iiii);
int iiii;

// Seven Seg
int score[4];
volatile u32 sevseg;
void update_sevseg();

int main()
{
    init_platform();

    xil_printf("\n\r\n\r\n\rHello PS2 Keyboard\n\r");

	score[0] = 0xD;
	score[1] = 0xE;
	score[2] = 0xA;
	score[3] = 0xD;
	update_sevseg();
    sleep(1000);



    volatile u32 kb_old=0, kb=0;
    kb_old = kb = Xil_In32(READ_KEYBOARD);
    xil_printf("Keyboard status: 0x%X%X%X%X\n\r", kb, *(&kb+1), *(&kb+2), *(&kb+3));
    xil_printf("Keyboard status: 0x%X%X\n\r", kb, *(&kb+2));

    volatile unsigned int tmp_sevseg = 1;
    while(1){
    	Xil_Out32(SS_BASEADDR, tmp_sevseg);
    	sleep(100);

    	kb = Xil_In32(READ_KEYBOARD);
    	if(kb != kb_old){
    	    xil_printf("Keyboard status: %X\n\r", kb);
    	    kb_old = kb;
    	    tmp_sevseg = 0;
    	    update_sevseg();
        	sleep(5000);
    	}
    	tmp_sevseg++;
    }

    cleanup_platform();
    return 0;
}
int is_1(){
	return(Xil_In32(READ_KEYBOARD) & 0x00000001);
}
int is_2(){
	return(Xil_In32(READ_KEYBOARD) & 0x00000002);
}
int is_3(){
	return(Xil_In32(READ_KEYBOARD) & 0x00000004);
}
int is_4(){
	return(Xil_In32(READ_KEYBOARD) & 0x00000008);
}
int is_q(){
	return(Xil_In32(READ_KEYBOARD) & 0x00000010);
}
int is_a(){
	return(Xil_In32(READ_KEYBOARD) & 0x00000020);
}
int is_t(){
	return(Xil_In32(READ_KEYBOARD) & 0x00000040);
}
int is_y(){
	return(Xil_In32(READ_KEYBOARD) & 0x00000080);
}
int is_o(){
	return(Xil_In32(READ_KEYBOARD) & 0x00000100);
}
int is_p(){
	return(Xil_In32(READ_KEYBOARD) & 0x00000200);
}
int is_6(){
	return(Xil_In32(READ_KEYBOARD) & 0x00000400);
}
int is_9(){
	return(Xil_In32(READ_KEYBOARD) & 0x00000800);
}

void update_sevseg(){
	sevseg = ((score[0] << 12) & 0xF000) |
			 ((score[1] <<  8) & 0x0F00) |
			 ((score[2] <<  4) & 0x00F0) |
			  (score[3]        & 0x000F);
	Xil_Out32(SS_BASEADDR, sevseg);
}
