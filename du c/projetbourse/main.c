#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <assert.h>
#include <string.h>

char twist(char c,int i){
    if(c>=65 && c<=90){
        //Majuscule
        char res = ((c+i-65) %26) + 65;
        return res;
    }
    else{
        // 97 minuscule
        char res = ((c+i-97) %26) + 97;
        return res;
    }
}

int main(int argc, char *argv[]){
    char c='c';
    char c2=twist(c,2);
    char c27=twist(c,27);
    printf("%c -> %c\n",c,c2);
    printf("%c -> %c\n",c,c27);

    return 0;
}