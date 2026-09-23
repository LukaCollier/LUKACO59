;Programme demo td2

        org 0           ; positionnement au début de la mémoire
        jmp debut       ; saut au début du programme pricipal

        org 8
nombre:cst 4       ; déclaration de la constante "nombre"
mult:cst 3       ; "mult"
resultat:var ?       ; 
        org 20                  ; début du programme principal
debut:  ldr r0,[nombre]     ; recup cste taille
        ldr r1,r0           ; taille dans r1 (servira de compteur)
        ldr r0,[mult]    ; recup val de remplissage
        ldr r2,r0           ; val de remplissage dans r2
        ldr r0,0               ;
bcle:   add r0,r0r1    ;
        dec r2              ; incrémentation de la val de remplissage
        jnz bcle            ; saut tant que le compteur n'est pas à 0
        str [resultat],r0   ;
fin:    hlt                 ; fin