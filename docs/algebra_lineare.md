# Algebra Lineare

## Operazioni di base con vettori e matrici

I vettori sono per definizione vettori colonna, quindi per definire un vettore riga è necessario trasporre il vettore colonna. In Matlab, la trasposizione di un vettore è data dall'operatore `'` (apice singolo). Ad esempio, per definire un vettore riga a partire da un vettore colonna `v`, si può scrivere:

```matlab
v = [1; 2; 3]; % vettore colonna
v_riga = v'; % vettore riga
```

Inoltre, in Matlab è possibile definire un vettore riga direttamente utilizzando le parentesi quadre e separando gli elementi con spazi o virgole:

```matlab
v_riga = [1 2 3]; % vettore riga
```

In questo caso, non è necessario utilizzare l'operatore di trasposizione.

**Moltiplicando un vettore v per un numero a**, si ottiene un nuovo vettore in cui ogni elemento è moltiplicato per a. Ad esempio, se v = [1; 2; 3] e a = 2, allora il risultato sarà:

```matlab
v = [1; 2; 3]; % vettore colonna
a = 2; % numero
v_moltiplicato = a * v; % vettore colonna
```

In questo caso, il risultato sarà un vettore colonna in cui ogni elemento è moltiplicato per 2:

```matlab
v_moltiplicato = [2; 4; 6]; % vettore colonna
```

Per moltiplicare un vettore riga per un numero, si può utilizzare la stessa sintassi:

```matlab
v_riga = [1 2 3]; % vettore riga
a = 2; % numero
v_riga_moltiplicato = a * v_riga; % vettore riga
```

In questo caso, il risultato sarà un vettore riga in cui ogni elemento è moltiplicato per 2:

```matlab
v_riga_moltiplicato = [2 4 6]; % vettore riga
```

**Sommando due vettori**, si ottiene un nuovo vettore in cui ogni elemento è la somma dei corrispondenti elementi dei due vettori. Ad esempio, se v1 = [1; 2; 3] e v2 = [4; 5; 6], allora il risultato sarà:

```matlab
v1 = [1; 2; 3]; % vettore colonna
v2 = [4; 5; 6]; % vettore colonna
v_somma = v1 + v2; % vettore colonna
```

**La differenza tra due vettori** è simile alla somma, ma sottraendo i corrispondenti elementi dei due vettori. Ad esempio, se v1 = [1; 2; 3] e v2 = [4; 5; 6], allora il risultato sarà:

```matlab
v1 = [1; 2; 3]; % vettore colonna
v2 = [4; 5; 6]; % vettore colonna
v_differenza = v1 - v2; % vettore colonna
v_differenza = [-3; -3; -3]; % risultato della differenza
```

**Il prodotto scalare** tra due vettori è dato dalla somma dei prodotti dei corrispondenti elementi dei due vettori. Ad esempio, se v1 = [1; 2; 3] e v2 = [4; 5; 6], allora il prodotto scalare sarà:

```matlab
v1 = [1; 2; 3]; % vettore colonna
v2 = [4; 5; 6]; % vettore colonna
v_prodotto_scalare = v1' * v2; % prodotto scalare
v_prodotto_scalare = 32; % risultato del prodotto scalare
```

Il risultato sarà un numero scalare, che rappresenta il prodotto scalare tra i due vettori.

**Il prodotto esterno** tra due vettori è dato dal prodotto di un vettore colonna per un vettore riga. Ad esempio, se v1 = [1; 2; 3] e v2 = [4 5 6], allora il prodotto esterno sarà:

```matlab
v1 = [1; 2; 3]; % vettore colonna
v2 = [4 5 6]; % vettore riga
v_prodotto_esterno = v1 * v2'; % prodotto esterno
```

Se v1 è un vettore colonna di dimensione 3x1 e v2 è un vettore riga di dimensione 1x3, il risultato sarà una matrice di dimensione 3x3:

```matlab
v_prodotto_esterno = [4 5 6; 8 10 12; 12 15 18]; % matrice 3x3
```

**La grandezza di un vettore** è un numero non negativo associabile a un vettore. Essa è pensabile come una funzione di v detta norma di v e si indica con ||v||. La norma più comune è la norma euclidea, detta anche norma-2, che è definita come la radice quadrata della somma dei quadrati degli elementi del vettore. Ad esempio, se v = [1; 2; 3], allora la norma euclidea sarà:

```matlab
v = [1; 2; 3]; % vettore colonna
norma_euclidea = sqrt(v' * v); % norma euclidea
norma_euclidea = 3.7417; % risultato della norma euclidea
```

In matlab è possibile calcolare la norma euclidea di un vettore utilizzando la funzione `norm`:

```matlab
v = [1; 2; 3]; % vettore colonna
norma_euclidea = norm(v); % norma euclidea
norma_euclidea = 3.7417; % risultato della norma euclidea
```

**La norma euclidea** è una misura della lunghezza del vettore nello spazio euclideo. Altre norme comuni sono la norma-1 (somma dei valori assoluti degli elementi) e la norma-infinito (massimo valore assoluto tra gli elementi). In Matlab, è possibile calcolare queste norme utilizzando le funzioni `norm` con il secondo argomento specificato:

```matlab
v = [1; 2; 3]; % vettore colonna
norma_1 = norm(v, 1); % norma-1
norma_1 = 6; % risultato della norma-1

norma_infinito = norm(v, inf); % norma-infinito
norma_infinito = 3; % risultato della norma-infinito
```

Nei problemi applicativi, la scelta della norma dipende dal contesto e dalle proprietà desiderate del vettore. Ad esempio, la norma euclidea è spesso utilizzata in problemi di ottimizzazione e regressione, mentre la norma-1 può essere preferita in problemi di compressione dei dati o sparsità. La norma-infinito è utile quando si desidera considerare il valore massimo tra gli elementi del vettore.

**La norma infinito** di un vettore è definita come il massimo valore assoluto tra gli elementi del vettore. Ad esempio, se v = [1; -2; 3], allora la norma infinito sarà:

$$
||v||_\infty = 3
$$

Una proprietà importante del prodotto scalare tra due vettori coinvolge le loro norme-2 ed è data dall'uguaglianza
$$v^Tw = ||v||_2 \cdot ||w||_2 \cdot \cos(\theta)$$,
dove $\theta$ è l'angolo compreso tra i vettori $v$ e $w$.Da questa uguaglianza
