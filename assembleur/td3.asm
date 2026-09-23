;Programme td3
ModeEtat  EQU  0x0FF3;
PortEntree EQU 0x0FF0;
PortSortie EQU 0x0FF2;
        org 0           ; 
        jmp debut       ; 
        org 8
nombre:cst 4       ; 
mult:cst 3       ; "mult"
resultat:var ?       ; 
        org 20                  ; 
debut:  ldr r0,1;
        str [ModeEtat], r0;
        ldr r0,[PortEntree]     ; 
        ldr r1,r0           ; 
        ldr r0,[mult]    ; 
        ldr r2,r0           ; 
        ldr r0,0               ;
bcle:   add r0,r0r1    ;
        dec r2              ; 
        jnz bcle            ; 
        str [PortSortie],r0   ;
fin:    hlt                 ; fin

