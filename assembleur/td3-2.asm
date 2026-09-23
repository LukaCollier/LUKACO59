;Programme td3
SModeEtat EQU 0xFF5;
SRxTx EQU 0xFF4;
Masque EQU 0x0003;

        org 0           ;
        

        jmp debut       ; 
        
        org 10
message: cst 'Simcal IENAC ';
taille: cst 13;

        org 50                  ; 
debut:  ldr r0, 2;
        str [SModeEtat], r0;
reinit: ldr r0, [taille];
        ldr r1, r0;
        ldr r0, message;
        ldr r4, r0;
        

bcle:   ldr r0, [SModeEtat];
        ldr r2, [Masque];
        and r0, r0r2;
        jz bcle;
        ldr r0, [r4]    ;
        str [SRxTx], r0;
        inc r4;
        dec r1              ; 
        jnz bcle            ; 
        jmp reinit;
fin:    hlt                 ; fin

