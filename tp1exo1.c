#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>
#include<math.h>
#include<time.h>
#define N 10000
#define N2 30


void is_perfect(){
    int res=0;
    for(int i=2;i<=N;i++){
        for(int j=1;j<i;j++){
            if(i%j==0) res=res+j;
        }
        if(res==i){
            printf("%d est un nombre parfait\n",i);
        }
        res=0;
    }
    return ;
}


void exo2(){
    int res=1;
    double sqrti;
    for(int i=2;i<=N;i++){
        sqrti=sqrt(i);
        for(int j=2;j<=sqrti;j++){
            if(i%j==0){
                res=res+j+i/j;
            }
        }
        if(res==i) printf("%d\n",res);
        res=1;
    }
}

void is_perfectv2(){
    int res=0;
    double sqrti;
    for(int i=2;i<=N;i++){
        sqrti=sqrt(i);
        for(int j=1;j<=sqrti;j++){
            if(i%j==0){
                res=res+j+(i/j);
            }
        }
        if(res==i){
            printf("%d est un nombre parfait\n",i);
        }
        res=0;
        }
    return ;
}

bool is_premier(long int n){
    for(long int i=2;i<=sqrtl(n);i++){
        if(n%i==0) return false;
    }
    return true;
}

void is_perfect_long(){
    for(int i=1;i<=N2;i++){
        long double a =powl(2,(i+1))-1;
        if(is_premier(a)){
            printf("2**%d*(2**(%d +1)-1)\n",i,i);
        }
    }
}

void exo4(int n){
    long int res=0;
    for(long int i=2;i<=n;i++){
        if(is_premier(i)){
            res++;
        }
    }
    printf("%ld\n",res);
    return ;
}

int main(int argc,char * argv[]){
    float start =clock();
    is_perfect();
    printf("temps de calcul : %f \n ", (clock()-start) / CLOCKS_PER_SEC) ;
    start=clock();
    exo2();
    printf("temps de calcul : %f \n ", (clock()-start) / CLOCKS_PER_SEC) ;
    is_perfect_long();
    int n=1000000;
    exo4(n);
    return 0;

}
