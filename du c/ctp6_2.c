#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include "ctp6_2.h"

/* fonction affichant le contenu d'un fichier texte � l'�cran */
void afficher_fichier(char * nomfic)
{
    errno=0;
    char buffer;
    FILE *f= fopen(nomfic,"r");
    if(errno!=0) (stderr, "Impossible d'ouvrir le fichier '%s' : '%s'\n",nomfic, strerror(errno));
    while(fscanf(f,"%c",&buffer)==1){
        if(errno!=0) (stderr, "Impossible de récupérer le caractère '%s' : '%s'\n",nomfic, strerror(errno));
        printf("%c",buffer);
    }
    fclose(f);
}

/* fonction �crivant dans un fichier texte le contenu du deuxi�me param�tre : */
void ecrire_fichier(char * nomfic, char * texte){
    errno=0;
    FILE *f =fopen(nomfic,"w");
    if(errno!=0) (stderr, "Impossible d'ouvrir le fichier '%s' : '%s'\n",nomfic, strerror(errno));
    fputs(texte,f);
    if(errno!=0) (stderr, "Impossible d'écrire  dans le fichier '%s' : '%s'\n",nomfic, strerror(errno));
    fclose(f);

}

/****************************/
/* fonction qui saisit au clavier une cha�ne de longueur quelconque,
    ==> r�servation dynamique de la cha�ne
*/
int saisir_chaine(char * *ch)
{
 // � compl�ter
    char c;
    int taille=1;
    // réservation initiale de la chaîne :
    if (*ch != NULL)
        free(*ch);
    *ch = (char*)calloc(taille,sizeof(char));	/* chaîne de taille initiale 1 caractère */

    while ( (c=getchar()) != '\n' )
    {
        // on alloue une case en plus :
        *ch=realloc(*ch,sizeof(char)+taille);
        taille++;
        // on déplace le caractère de fin de chaîne :
        *(*ch + taille-1) = *(*ch + taille-2);
        // on stocke le caractère tapé :
        *(*ch + taille-2) = c;
    }

    return taille;

}
