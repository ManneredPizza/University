#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>

void show(int r, int c, int G[r][c]) {
  char s;

  for(int i=0 ; i<r; i++) {
    for(int j=0; j<c; j++) {
      switch(G[i][j]) {
        case 0:
        s=' ';
        break;
        case 1:
        s='+'; //utente
        break;
        case 2:
        s='*'; //computer
        break;
        default:
        //non dovrebbe mai arrivare qui;
        break;
      }
      printf("|%c", s);
    }
    printf("|\n");
  }


  return;
}

/*
funzione controllo_riga(righe, colonne, numero_per_vincere, matrice, riga da controlare)
return
  0->non c'è un vincitore sulla riga
  1->ha vinto l'utente
  2->ha vinto il PC
*/
int controllo_riga(int r, int c, int n, int G[r][c], int row) {
  int vincitore=0;
  int counter=0;

  for(int i=0; i<c; i++) { //per ogni colonna di quella riga
    if(G[row][i]!=0) { //se c'è un 1 o un 2
      if(G[row][i]==vincitore) { //se è già quello che stavo controllando da prima
        counter++; //ha una pedina in più di fila sulla riga
        if(counter==n) { //se arriva alla quota vittoria si esce
          break;
        }
      }
      else { //se non è quello che controllavo
        vincitore = G[row][i]; //controlliamo l'altro
        counter = 1; //è la prima che vedo
      }
    }
    else {
      counter = 0;
      vincitore = 0;
    }
  }

  if(counter==n) { //controllo di essere arrivato ad n per evitare il caso in cui sono all'ultima colonna e cambio giocatore, si esce dal for, lui è sotto controllo ma non ha vinto 
    return vincitore;
  }
  return 0;
}

/*
funzione controllo_colonna(righe, colonne, numero_per_vincere, matrice, colonna da controlare)
return
  0->non c'è un vincitore sulla colonna
  1->ha vinto l'utente
  2->ha vinto il PC
*/
int controllo_colonna(int r, int c, int n, int G[r][c], int col) {
  int vincitore=0;
  int counter=0;

  for(int i=0; i<r; i++) { //per ogni riga di quella colonna
    if(G[i][col]!=0) { //se c'è un 1 o un 2
      if(G[i][col]==vincitore) { //se è già quello che stavo controllando da prima
        counter++; //ha una pedina in più di fila sulla riga
        if(counter==n) { //se arriva alla quota vittoria si esce
          break;
        }
      }
      else { //se non è quello che controllavo
        vincitore = G[i][col]; //controlliamo l'altro
        counter = 1; //è la prima che vedo
      }
    }
    else {
      counter = 0;
      vincitore = 0;
    }
  }

  if(counter==n) { //controllo di essere arrivato ad n per evitare il caso in cui sono all'ultima riga e cambio giocatore, si esce dal for, lui è sotto controllo ma non ha vinto 
    return vincitore;
  }
  return 0;
}

/*
funzione game_over(righe, colonne, numero_per_vincere, matrice)
return 
  -1->partita in corso
   0->pareggio
   1->vince l'utente
   2->vince il pc
*/
int game_over(int r, int c, int n, int G[r][c]) {
  int status=-1;

  for(int i=0; i<r; i++) {
    status = controllo_riga(r, c, n, G, i); //controllo per ogni riga se c'è una combinazione vincente
    if(status==1 || status==2) { //se c'è un vincitore
      return status;
    }
  }

  status = -1;

  for(int i=0; i<c; i++) {
    status = controllo_colonna(r, c, n, G, i); //controllo per ogni colonna se c'è una combinazione vincente
    if(status==1 || status==2) { //se c'è un vincitore
      return status;
    }
  }

  int in_corso = 0;

  //ora ho due possibilità o pareggio (0) o partita in corso (-1)
  /*
  una partita è in pareggio quando non è più possibile fare una combinazione vincente:
    1. è tutto pieno e non c'è un vincitore
  */
  for(int i=0; i<c; i++) {
    if(G[0][i]==0) { //se nella riga più alta c'è uno spazio vuoto si continua
      in_corso = 1;
    }
  }

  if(in_corso == 0 && status == 0) { //se la partita è in corso e nessuno ha vinto (controllo ridondante)
    return 0; //è un pareggio
  }
  else {
    return -1; //se no si sta ancora giocando
  }
}


/*
funzione colonna_piena (righe, colonne, matrice, colonna da controllare)
return 
  0->c'è spazio
  1->piena
*/
int colonna_piena(int r, int c, int G[r][c], int col) {
  if(G[0][col]==0)
    return 0;
  else {
    printf("La colonna e' piena \n");
    return 1;
  }
}

/*
funzione leggi_mossa(righe, colonne, numero per vincere, matrice)
return
  colonna scelta dallo user
*/
int leggi_mossa(int r, int c, int n, int G[r][c]) {
  char str[BUFSIZ]; //carattere inserito dall'user, uso stringhe per eventuali errori di inserimento
  int col;

  do {
    printf("Inserisci una colonna tra 1 e %u \n", c);
    printf("> ");
    fgets(str, BUFSIZ, stdin);


    col = atoi(str); //torna zero se sono solo caratteri o è solo uno zero

    if(col < 1 || col > c) {
      printf("Inserisci un valore corretto \n");
      return -1;
    }

    col--; //lui scrive da 1 a c io li uso da 0 a c-1
  }
  while(colonna_piena(r, c, G, col) && game_over(r, c, n, G) != 0); //per evitare un loop se è tutto pieno e quindi tutte le colonne sono sempre piene

  return col;
}

/*
funzione scrivi (righe, colonne, matrice, colonna su cui si gioca, giocatore)
return
  void
*/
void scrivi(int r, int c, int G[r][c], int col, int giocatore) {
  //sono sicuro non sia piena per i controlli fatti

  int i;
  for(i=r-1; i>=0; i--) {
    if(G[i][col] == 0) {
      break;
    }
  }

  G[i][col] = giocatore;

  return;
}


int main(int argc, char *argv[]) {
  if(argc < 4) {
    printf("Servono una larghezza una lunghezza e il numero necessario per vincere \n");
    return -1;
  }

  int r = atoi(argv[1]), c = atoi(argv[2]), n = atoi(argv[3]);

  if(r <= 0 || c <= 0 || n <=0) {
    printf("I tre parametri devono essere strettamente positivi \n");
    return -2;
  }

  if(n > r && n > c) {
    printf("Gioco impossibile da vincere \n");
    return -3;
  }

  srand(time(NULL)); //seed

  int G[r][c];
  for(int i=0; i<r; i++) {
    for(int j=0; j<c; j++) {
      G[i][j] = 0; //inizializzo la matrice di gioco
    }
  }

  int col;
  int vincitore = 0;

  do {
    col = leggi_mossa(r, c, n, G);
  
    if(col!=-1) {
      scrivi(r, c, G, col, 1);

      show(r, c, G);
      printf("\n");

      if(game_over(r, c, n, G)==1) { //se l'utente ha vinto
        vincitore = 1;
        break;
      }

      do {
        col = rand()%c; //mossa del pc
      }
      while(colonna_piena(r, c, G, col) && game_over(r, c, n, G) != 0);

      scrivi(r, c, G, col, 2);

      show(r, c, G);
      printf("\n");

      if(game_over(r, c, n, G)==2) {
        vincitore = 2;
        break;
      }
    }
  }
  while(game_over(r, c, n, G)==-1);

  char *vin[] = {"l'utente", "il computer"};

  if(vincitore != 0)
    printf("Il vincitore e' %s \n", vin[vincitore-1]);
  else
    printf("La partita e' finita in pareggio \n");

  return 0;
}