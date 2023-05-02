/* ricerca.c */

/* Direttive */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "abr.h"

#define ROW_LENGTH 256


/* Prototipi delle procedure secondarie */

void InterpretaLineaComando (int argc, char *argv[], char *file_dati);

/* Carica i dati contenuti in file_dati in un ABR */
ABR CaricaABR (char *file_dati);

/* Esegue sull'ABR T i comandi forniti da tastiera */
ABR EsegueComandi (ABR T);


/* Programma principale */
int main (int argc, char *argv[])
{
  /* Parte dichiarativa */
  char file_dati[ROW_LENGTH];
  ABR T;


  /* Parte esecutiva */
  InterpretaLineaComando(argc,argv,file_dati);

  /* Carica i dati contenuti in file_dati in un ABR */
  T = CaricaABR(file_dati);

  /* Esegue i comandi forniti da tastiera */
  T = EsegueComandi(T);

  /* Distrugge l'ABR */
  distruggeABR(&T);

  return EXIT_SUCCESS;
}


/* Definizione delle procedure secondarie */

void InterpretaLineaComando (int argc, char *argv[], char *file_dati)
{
  if (argc != 2)
  {
    fprintf(stderr,"Errore nella linea di comando!\n");
    fprintf(stderr,"%s [file_dati]\n",argv[0]);
    exit(EXIT_FAILURE);
  }

  strcpy(file_dati,argv[1]);
}


/* Carica i dati contenuti in file_dati in un ABR */
ABR CaricaABR (char *file_dati)
{
  FILE *fp;
  ABR T;
  int i;

  /* Apre il file file_dati */
  fp = fopen(file_dati,"r");
  if (fp == NULL)
  {
    fprintf(stderr,"Errore nell'apertura del file %s!\n",file_dati);
    exit(EXIT_FAILURE);
   }

  /* Crea un ABR vuoto */
  T = creaABR();

  /* Finche' ci sono numeri interi nel file */
  /* li inserisce nell'ABR */
  while (fscanf(fp,"%d",&i) == 1)
    T = insertABR(i,T);

  /* Chiude il file file_dati */
  fclose(fp);

  return T;
}


/* Esegue sull'ABR T i comandi forniti da tastiera */
ABR EsegueComandi (ABR T)
{
  boolean fine;
  char Comando[ROW_LENGTH];
  char op[ROW_LENGTH];
  int i;
  int cont;

  /* Finche' l'utente fornisce comandi */
  fine = FALSE;
  while (!fine)
  {
    /* Stampa un prompt per segnalare che si attende un comando */
    printf("> ");

    /* Legge il comando dell'utente */
    fgets(Comando,ROW_LENGTH,stdin);

    /* Identifica il comando dell'utente e l'eventuale argomento */
    cont = sscanf(Comando,"%s %d",op,&i);

    /* A seconda del comando (member, insert, delete, print, empty, min, max, exit)
       esegue le operazioni appropriate */
    if (strcmp(op,"member") == 0)
    {
      if (cont == 2)
      {
        if (memberABR(i,T))
          printf("%d in T\n",i);
        else
          printf("%d non in T\n",i);
      }
    }
    else if (strcmp(op,"insert") == 0)
    {
      if (cont == 2)
        T = insertABR(i,T);
    }
    else if (strcmp(op,"delete") == 0)
    {
      if (cont == 2)
        T = deleteABR(i,T);
    }
    else if (strcmp(op,"print") == 0)
    {
      stampaABR(T);
      printf("\n");
    }
    else if (strcmp(op,"empty") == 0)
    {
      if (ABRvuoto(T))
        printf("T e' vuoto\n");
      else
        printf("T non e' vuoto\n");
    }
    else if (strcmp(op,"min") == 0)
      printf("min(T) = %d\n",minABR(T));
    else if (strcmp(op,"max") == 0)
      printf("max(T) = %d\n",maxABR(T));
    else if (strcmp(op,"exit") == 0)
      fine = TRUE;
    else
      printf("Comando non riconosciuto!\n");
  }

  return T;
}

