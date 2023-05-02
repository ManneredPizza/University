#include "abr.h"

ABR creaABR() {
	return EMPTY_TREE;
}

void distruggeABR(ABR *pT) { 
	if(!ABRvuoto((*pT)->Ts)) {
		distruggeABR(&((*pT)->Ts));
	}
	if(!ABRvuoto((*pT)->Td)) {
		distruggeABR(&((*pT)->Td));
	}

	(*pT)->padre = EMPTY_TREE;
	free(pT);
	*pT = EMPTY_TREE;
}

boolean ABRvuoto(ABR T) {
	return (T == EMPTY_TREE);
}

boolean memberABR(int i, ABR T) {
	if(ABRvuoto(T)) {
		return FALSE;
	}
	else if(T->val == i) {
		return TRUE;
	}
	return (memberABR(i, T->Ts) || memberABR(i, T->Td));
}

ABR newABR(int i, ABR padre) {
	ABR T = creaABR();
	T->val = i;
	T->Ts = EMPTY_TREE;
	T->Td = EMPTY_TREE;
	T->padre = padre;

	return T;
}

ABR insertABR(int i, ABR T) {
	if(ABRvuoto(T)) {
		T = newABR(i, EMPTY_TREE);
		return T;
	}
	else if(T->val == i) {
		return T;
	}
	else if(T->val > i) {
		if(ABRvuoto(T->Ts)) {
			T->Ts = newABR(i, T);
		}
		else {
			return insertABR(i, T->Ts);
		}
	}
	else if(T->val < i) {
		if(ABRvuoto(T->Td)) {
			T->Td = newABR(i, T);
		}
		else {
			return insertABR(i, T->Td);
		}
	}

	return T;
}

nodo *argmaxABR (ABR T) {
  if (T == EMPTY_TREE) return NULL;
  while (T->Td != EMPTY_TREE)
  	T = T->Td;
  return T;
}

ABR deleteABR(int i, ABR T) {
	ABR n = creaABR();

	if(!memberABR(i, T)) return T;

	else if(T->val > i) {
		return deleteABR(i, T->Ts);
	}
	else if(T->val < i) {
		return deleteABR(i, T->Td);
	}
	else {
		if(ABRvuoto(T->Ts)) {
			/* se T è Ts di suo padre */
			/* non so se confrontarli così o con *T o &T */
			if(T == T->padre->Ts) {
				T->padre->Ts = T->Td;
				T->Td->padre = T->padre;
				T->padre = EMPTY_TREE;
				T->Td = EMPTY_TREE;
				distruggeABR(&T);
			}
			/* allora T è Td di suo padre */
			else {
				T->padre->Td = T->Td;
				T->Td->padre = T->padre;
				T->padre = EMPTY_TREE;
				T->Td = EMPTY_TREE;
				distruggeABR(&T);
			}
		}
		else if(ABRvuoto(T->Td)) {
			/* se T è Ts di suo padre */
			/* non so se confrontarli così o con *T o &T */
			if(T == T->padre->Ts) {
				T->padre->Ts = T->Ts;
				T->Ts->padre = T->padre;
				T->padre = EMPTY_TREE;
				T->Ts = EMPTY_TREE;
				distruggeABR(&T);
			}
			/* allora T è Td di suo padre */
			else {
				T->padre->Td = T->Ts;
				T->Ts->padre = T->padre;
				T->padre = EMPTY_TREE;
				T->Ts = EMPTY_TREE;
				distruggeABR(&T);
			}
		}
		else {
			n = argmaxABR(T->Ts);
	    T->val = n->val;
	    n->padre = EMPTY_TREE;
	    distruggeABR(&n);
		}
		return T;
	}
}

int minABR(ABR T) {
	if(ABRvuoto(T)) {
		return MIN_INT;
	}
	else if(ABRvuoto(T->Ts)) {
		return T->val;
	}
	return minABR(T->Ts);
}

int maxABR(ABR T) {
	if(ABRvuoto(T)) {
		return MAX_INT;
	}
	else if(ABRvuoto(T->Td)) {
		return T->val;
	}
	return maxABR(T->Td);
}

void stampaABR(ABR T) {
	if (T != EMPTY_TREE) {
	    stampaABR(T->Ts);
	    printf(" %d",T->val);
	    stampaABR(T->Td);
  }
}
