/* hello.c */

/* Direttive */
#include <stdlib.h>
#include "advio.h"


/* Prototipi delle procedure secondarie */

char AcquisisceCornice ();

void AcquisisceSaluto (char *saluto);

void StampaSaluto (char *saluto, char cornice);


/* Programma principale */
int main (int argc, char *argv[])
{
  /* Parte dichiarativa */
  char cornice;
  char saluto[ROW_LENGTH];


  /* Parte esecutiva */

  /* Acquisisce il carattere che si vuole usare per la cornice */
  cornice = AcquisisceCornice();

  /* Acquisisce il saluto che si vuole stampare */
  AcquisisceSaluto(saluto);

  /* Stampa il saluto incorniciato */
  StampaSaluto(saluto,cornice);

  return EXIT_SUCCESS;
}


/* Definizione delle procedure secondarie */
char AcquisisceCornice ()
{
  /* Parte dichiarativa */
  char cornice;

  /* Parte esecutiva */
  StampaStringa("Inserire il carattere da usare per la cornice: ");
  cornice = LeggeCarattere();
  return cornice;
}


void AcquisisceSaluto (char *saluto)
{
  /* Parte dichiarativa */

  /* Parte esecutiva */
  StampaStringa("Inserire il saluto da stampare: ");
  LeggeRiga(saluto);
}


void StampaSaluto (char *saluto, char cornice)
{
  int larghezza;


  /* Determina la larghezza della cornice */
  larghezza = LunghezzaStringa(saluto) + 4;

  /* Va a capo */
  ACapo();

  /* Stampa la cornice superiore */
  StampaCarattere(cornice,larghezza);

  /* Va a capo */
  ACapo();

  /* Stampa la cornice sinistra */
  StampaCarattere(cornice,1);

  /* Stampa uno spazio */
  StampaCarattere(' ',1);

  /* Stampa il saluto */
  StampaStringa(saluto);

  /* Stampa uno spazio */
  StampaCarattere(' ',1);

  /* Stampa la cornice destra */
  StampaCarattere(cornice,1);

  /* Va a capo */
  ACapo();

  /* Stampa la cornice inferiore */
  StampaCarattere(cornice,larghezza);
}
