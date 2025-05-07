#include<stdio.h>
typedef struct n132{
    char buf[0x18];
    size_t overflow;
} n132;
int init(){
    fclose(stderr);
    setvbuf(stdin,  0, 2, 0);
    setvbuf(stdout, 0, 2, 0);
}
int main(){
    init();
    n132 node;
	char buffer[24];

	/*
	char overflow_data[] = "This string is longer than 24 bytes and will cause an overflow!";
	strcpy(buffer, overflow_data);
	printf("Buffer contents: %s\n", buffer);
	*/

    memset(&node,0,sizeof(node));
    puts("You are allowed to input 24 bytes:");
    read(0,node.buf, sizeof(node));
    if(node.overflow){
        //system("/bin/sh");
		system("ls -al");
    }
    else{
        puts("bye bye");
    }
}
