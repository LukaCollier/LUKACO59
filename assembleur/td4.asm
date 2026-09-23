PicuMask EQU 0xFF8
PicuEOI EQU 0xFF9
PPMode EQU 0xFF3
PPPortC EQU 0xFF2
masque EQU 0x04
mode EQU 06
SModeEtat EQU 0xFF5;
SRxTx EQU 0xFF4;
Masque EQU 0x0003;

org 0
jmp init
org 1
ad_kbIT: VAR ?
org 2
ad_SPIt: VAR ?

org 10
valeur: VAR ?

org 20
pile: VAR 10?
fond_pile: VAR?

org 40

It_man: pop r0
        ldr r0,ici
        push r0
        ldr r0,0
        str [PicuEOI],r0
        iret
It_kb: push r0
       ldr r0,[SRxTx]
       str [SRxTx],r0
       ldr r0,0
       str [PicuEOI],r0
       pop r0
       iret



init:   ldr r0,0
        ldr fl,r0
        ldr r0,fond_pile
        ldr sp,r0
        ldr r0,It_man
        str [ad_SPIt],r0
        ldr r0,It_kb
        str [ad_kbIT],r0
        ldr r0,1
        str [PPMode],r0
        ldr r0,masque
        str [PicuMask],r0
        ldr r0,masque
        str [PicuMask],r0
        ldr r0,1
        ldr fl,r0
        ldr r0, 7
        str [SModeEtat], r0

        ldr r0,0xff
        ldr r1,r0
ici:    ldr r0,0
        str [valeur],r0

bcle:   ldr r0,[valeur]
        str [PPPortC],r0
        inc r0
        str [valeur],r0
        sub r4,r0r1
        jnz bcle
        jmp ici
        hlt

