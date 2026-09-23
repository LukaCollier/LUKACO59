;Programme demo td1

val_debut equ   0   ; directive

        org 0           ; positionnement au début de la mémoire
        jmp debut       ; saut au début du programme pricipal

        org 8
taille:cst 10       ; déclaration de la constante "taille"
tableau: var 10?    ; déclaration de la variable "tableau" (10 cases)

        org 20                  ; début du programme principal
debut:  ldr r0,[taille]     ; recup cste taille
        ldr r1,r0           ; taille dans r1 (servira de compteur)
        ldr r0,val_debut    ; recup val de remplissage
        ldr r2,r0           ; val de remplissage dans r2
        ldr r0,tableau      ; recup adresse de début de tableau dans r0
        ldr r4,r0           ; adresse de début de tableau dans r4
bcle:   str [r4],r2         ; r2 dans la case mémoire pointée par r4
        inc r2              ; incrémentation de la val de remplissage
        inc r4              ; incrémentation de l'adresse dans le tableau
        dec r1              ; décrémentation du compteur (taille)
        jnz bcle            ; saut tant que le compteur n'est pas à 0
fin:    hlt                 ; fin