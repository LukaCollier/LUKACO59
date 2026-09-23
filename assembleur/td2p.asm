ORG 0;
jmp debut;

ModeEtat  EQU  0x0FF3;

org 8;
nombre1:cst 1       ; déclaration de la constante "nombre"
nombre2:cst 2       ;
nombre3:cst 3       ;
mult:cst 4       ; "mult"
resultat1:VAR ?; 
resultat2:VAR ?; 
resultat3:VAR ?; 

ORG 20;

pile: VAR 10?;
fondpile: VAR ?;


multiplier: push r1;
            push r2;
            ldr r0,0;
bcle:   add r0,r0r1;
        dec r2;
        jnz bcle;
        pop r2;
        pop r1;
        ret;

debut: ldr r0,1;
       str [ModeEtat],r0;
       ldr r0,fondpile;
       ldr sp,r0;
       ldr r1,[nombre1];
       ldr r2,[mult]    ; 
       ldr r0,0               ;
       call multiplier;
       str [resultat1],r0;
       ldr r0,0;
       ldr r1,[nombre2];
       call multiplier;
       str [resultat2],r0;
       ldr r0,0;
       ldr r1,[nombre3];
       call multiplier;
       str [resultat3],r0;
       hlt;
