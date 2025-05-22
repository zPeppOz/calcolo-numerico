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
dove $\theta$ è l'angolo compreso tra i vettori $v$ e $w$.Da questa uguaglianza si deduce che il prodotto scalare è 0 quando i due vettori sono ortogonali, cioè quando l'angolo $\theta$ è 90 gradi. Inoltre, il prodotto scalare è positivo quando i due vettori formano un angolo acuto e negativo quando formano un angolo ottuso.
La norma-2 è sempre positiva e il suo valore è 0 solo quando il vettore è nullo. La norma-1 e la norma-infinito sono anch'esse sempre positive e il loro valore è 0 solo quando il vettore è nullo. La norma-1 e la norma-infinito sono utili in contesti diversi, ad esempio nella compressione dei dati o nella sparsità, mentre la norma-2 è spesso utilizzata in problemi di ottimizzazione e regressione.

## Operazioni con matrici

Le matrici sono oggetti bidimensionali che possono essere utilizzati per rappresentare sistemi di equazioni lineari, trasformazioni geometriche e altro ancora. In Matlab, le matrici possono essere definite utilizzando le parentesi quadre e separando gli elementi con spazi o punti e virgola. Ad esempio, per definire una matrice 2x3:

```matlab
A = [1 2 3; 4 5 6]; % matrice 2x3
```

In questo caso, la matrice A ha 2 righe e 3 colonne. Gli elementi della matrice sono separati da spazi all'interno di una riga e da punti e virgola tra le righe.
Per definire una matrice quadrata, è possibile utilizzare la stessa sintassi. Ad esempio, per definire una matrice 3x3:

```matlab
A = [1 2 3; 4 5 6; 7 8 9]; % matrice 3x3
```

In questo caso, la matrice A ha 3 righe e 3 colonne. Gli elementi della matrice sono separati da spazi all'interno di una riga e da punti e virgola tra le righe.
Per definire una matrice diagonale, è possibile utilizzare la funzione `diag` in Matlab. Ad esempio, per definire una matrice diagonale con gli elementi 1, 2 e 3 sulla diagonale principale:

```matlab
A = diag([1 2 3]); % matrice diagonale 3x3
```

In questo caso, la matrice A avrà gli elementi 1, 2 e 3 sulla diagonale principale e 0 altrove:

```matlab
A = [1 0 0; 0 2 0; 0 0 3]; % matrice diagonale 3x3
```

**Moltiplicando una matrice A per un numero a**, si ottiene una nuova matrice in cui ogni elemento è moltiplicato per a. Ad esempio, se A = [1 2; 3 4] e a = 2, allora il risultato sarà:

```matlab
A = [1 2; 3 4]; % matrice 2x2
a = 2; % numero
A_moltiplicata = a * A; % matrice 2x2
```

**Sommando due matrici A e B**, si ottiene una nuova matrice in cui ogni elemento è la somma dei corrispondenti elementi delle due matrici. Ad esempio, se A = [1 2; 3 4] e B = [5 6; 7 8], allora il risultato sarà:

```matlab
A = [1 2; 3 4]; % matrice 2x2
B = [5 6; 7 8]; % matrice 2x2
A_somma = A + B; % matrice 2x2
```

In questo caso, il risultato sarà una matrice 2x2 in cui ogni elemento è la somma dei corrispondenti elementi delle due matrici:

```matlab
A_somma = [6 8; 10 12]; % matrice 2x2
% A_somma rappresenta la somma delle matrici A e B
```

**Il prodotto matrice-vettore** è definito come la moltiplicazione di una matrice A per un vettore colonna v. Ad esempio, se A = [1 2; 3 4] e v = [5; 6], allora il risultato sarà:

```matlab
A = [1 2; 3 4]; % matrice 2x2
v = [5; 6]; % vettore colonna
A_prodotto_vettore = A * v; % matrice 2x1
```

In questo caso, il risultato sarà un vettore colonna di dimensione 2x1:

```matlab
A_prodotto_vettore = [17; 39]; % matrice 2x1
% A_prodotto_vettore rappresenta il prodotto della matrice A e del vettore v
```

Il risultato è ottenuto moltiplicando ogni riga della matrice A per il vettore v e sommando i risultati. Ad esempio, la prima riga di A moltiplicata per v darà 1*5 + 2*6 = 17, mentre la seconda riga darà 3*5 + 4*6 = 39.

**Il prodotto matrice-matrice** è definito come la moltiplicazione di due matrici A e B. Ad esempio, se A = [1 2; 3 4] e B = [5 6; 7 8], allora il risultato sarà:

```matlab
A = [1 2; 3 4]; % matrice 2x2
B = [5 6; 7 8];

C = A * B; % matrice 2x2
```

Il prodotto tra due matrici è definito come la somma dei prodotti dei corrispondenti elementi delle righe della prima matrice e delle colonne della seconda matrice. Ad esempio, il primo elemento della matrice C sarà dato da 1*5 + 2*7 = 19, il secondo elemento sarà dato da 1*6 + 2*8 = 22, e così via. Esso è definito inoltre solo se il numero di colonne della prima matrice è uguale al numero di righe della seconda matrice. In questo caso, il risultato sarà una matrice di dimensione 2x2:

```matlab
C = [19 22; 43 50]; % matrice 2x2
% C rappresenta il prodotto delle matrici A e B
```

## Algoritmi per la risoluzione di sistemi lineari

### Ax = b

Un sistema di equazioni lineari può essere rappresentato in forma matriciale come Ax = b, dove A è una matrice, x è un vettore colonna di incognite e b è un vettore colonna di termini noti. Il sistema ammette soluzioni uniche, infinite o nessuna soluzione a seconda delle proprietà della matrice A e del vettore b: se A è una matrice non singolare (cioè ha determinante diverso da zero), il sistema ammette una soluzione unica. Se A è singolare, il sistema può avere infinite soluzioni o nessuna soluzione, a seconda della compatibilità tra A e b.
In Matlab, è possibile risolvere un sistema di equazioni lineari Ax = b utilizzando l'operatore di divisione inversa `\`. Ad esempio, se A = [1 2; 3 4] e b = [5; 6], allora il risultato sarà:

```matlab
A = [1 2; 3 4]; % matrice 2x2
b = [5; 6]; % vettore colonna
x = A \ b; % vettore colonna
% x rappresenta la soluzione del sistema di equazioni lineari Ax = b
```

In questo caso, il risultato sarà un vettore colonna di dimensione 2x1:

```matlab
x = [-4; 5]; % vettore colonna
% x rappresenta la soluzione del sistema di equazioni lineari Ax = b
```

**Approfondendo le matrici non singolari**, possiamo dire che **una matrice A è non singolare se e solo se il suo rango è uguale al numero di righe (o colonne) della matrice**. In altre parole, **una matrice A è non singolare se le sue righe (o colonne) sono linearmente indipendenti**. Se il rango di A è minore del numero di righe (o colonne), allora A è singolare e il sistema Ax = b può avere infinite soluzioni o nessuna soluzione.
In Matlab, è possibile calcolare il **rango di una matrice** utilizzando la funzione `rank`. Ad esempio, per calcolare il rango della matrice A:

```matlab
A = [1 2; 3 4]; % matrice 2x2
rango_A = rank(A); % rango della matrice A
% rango_A rappresenta il rango della matrice A
```

Inoltre **A è non singolare anche se il suo determinante è diverso da zero**, se esiste la **matrice inversa A^-1** tale che **A\*A^-1 = I**, dove **I è la matrice identità**.

### Alti algoritmi

Se il sistema di equazioni lineari ha una matrice dei coefficienti con struttura diagonale, triangolare o simmetrica, è possibile utilizzare algoritmi specifici per risolvere il sistema in modo più efficiente. Ad esempio, per un sistema di equazioni lineari con matrice diagonale, è possibile risolvere il sistema semplicemente dividendo ogni elemento del vettore b per l'elemento corrispondente della diagonale di A. Per un sistema con matrice triangolare, allora la soluzione si calcola in O(n^2) operazioni, usando l'algoritmo di sostituzione avanti o indietro.
Se invece la matrice non ha una struttura particolare, allora si può usare **l'algoritmo di Gauss**.
Lo scopo di questo algoritmo è quello di trasformare il sistema Ax = b in un sistema equivalente di tipo triangolare superiore Ux = p, dove U è una matrice triangolare superiore e p è un vettore colonna. Una volta ottenuto il sistema triangolare superiore, è possibile risolverlo utilizzando l'algoritmo di sostituzione all'indietro. L'algoritmo di Gauss usa solo operazioni che preservano l'equivalenza del sistema, come la somma di righe, la moltiplicazione di una riga per un numero diverso da zero e lo scambio di righe. In particolare, l'operazione fondamentale dell'algoritmo di Gauss è la sostituzione di una riga con la differenza tra essa e un multiplo di un'altra riga. L'algoritmo procede in n-1 passi. Ad ogni passo k (da 1 a n-1), le equazioni dalla (k+1)-esima alla n-esima vengono modificate. L'equazione k-esima è detta pivotale e l'elemento A(k,k) è il pivot. L'obiettivo è annullare i coefficienti della k-esima incognita nelle equazioni successive, sottraendo da ciascuna di esse un opportuno multiplo dell'equazione pivotale. Tale multiplo, detto moltiplicatore, si calcola per l'i-esima equazione come A(i,k)/A(k,k). Moltiplicando il moltiplicatore per la riga pivotale e sottraendo il risultato dall'i-esima equazione, si ottiene una nuova equazione con il coefficiente della k-esima incognita pari a zero. L'effetto del k-esimo passo è l'azzeramento degli elementi nella colonna k sotto la diagonale principale della matrice dei coefficienti. Tutti i coefficienti delle equazioni dalla (k+1)-esima alla n-esima (inclusi i termini noti) vengono modificati.
Tale trasformazione complessiva al passo k si sintetizza nei seguenti passaggi Matlab:

```matlab
vetmolt = A(k+1:n,k)/A(k,k); % vettore moltiplicatore
A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - vetmolt*A(k,k+1:n); % prodotto esterno
b(k+1:n) = b(k+1:n) - vetmolt*b(k); % prodotto esterno
```

La complessità di tempo dell'Algoritmo di Gauss è O(n^3/3) per la matrice A di dimensione n x n. La complessità di spazio è O(n^2) per memorizzare la matrice A e il vettore b.

L'algoritmo viene quindi così implementato in Matlab, applicando il pivoting parziale:

```matlab
function x = gauss(A, b)
    n = size(A, 1); % numero di righe della matrice A
    for k = 1:n-1
        % Trova il pivot massimo nella colonna k
        [p, pivot] = max(abs(A(k:n, k))); % indice del pivot
        pivot = pivot + k - 1; % indice globale del pivot
        if p == 0
            error('Il sistema non ha soluzione unica');
        end
        if pivot ~= k
            % Scambia le righe k e pivot
            A([k, pivot], :) = A([pivot, k], :);
            b([k, pivot]) = b([pivot, k]);
        end
        % Applica l'algoritmo di Gauss
        vetmolt = A(k+1:n, k) / A(k, k); % vettore moltiplicatore
        A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - vetmolt * A(k, k+1:n); % prodotto esterno
        b(k+1:n) = b(k+1:n) - vetmolt * b(k); % prodotto esterno
    end
    % Risoluzione del sistema triangolare superiore
    x = zeros(n, 1); % inizializza il vettore soluzione
    for i = n:-1:1
        x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
    end
end
```

### Fattorizzazione LU

La fattorizzazione LU è un metodo per risolvere sistemi di equazioni lineari Ax = b, dove A è una matrice quadrata. La fattorizzazione LU consiste nel decomporre la matrice A in due matrici: una matrice triangolare inferiore L e una matrice triangolare superiore U, tali che A = LU. Una volta ottenuta la fattorizzazione LU, il sistema Ax = b può essere risolto in due passaggi: prima si risolve il sistema Ly = b (sostituzione in avanti) e poi si risolve il sistema Ux = y (sostituzione all'indietro). La fattorizzazione LU è particolarmente utile quando si devono risolvere più sistemi di equazioni lineari con la stessa matrice A ma con vettori b diversi. Per calcolare le matrici L ed U si può usare l'algoritmo di Gauss, ma senza modificare il vettore b. La matrice L avrà gli stessi elementi della matrice A, ma con gli uno sulla diagonale principale e gli zeri sopra la diagonale principale. La matrice U avrà gli stessi elementi della matrice A, ma con gli zeri sotto la diagonale principale. La fattorizzazione LU è possibile solo se la matrice A è non singolare e quadrata. In Matlab, è possibile calcolare la fattorizzazione LU di una matrice A utilizzando il seguente algoritmo:

```matlab
for k = 1:n-1
    A(k+1:n, k) = A(k+1:n, k) / A(k, k); % vettore moltiplicatore
    A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - A(k+1:n, k) * A(k, k+1:n); % prodotto esterno
end
```

L'algoritmo di fattorizzazione LU in-place trasforma la matrice A in modo da produrre una nuova matrice avente la struttura desiderata senza utilizzare memoria aggiuntiva. La complessità di tempo dell'algoritmo di fattorizzazione LU è O(n^3/3)

Noti L ed U di una matrice A, i problemi risolvibili sono diversi:

- Ax = b: Ax = LUx = b, quindi L(Ux) = b. Risolviamo prima Ly = b e poi Ux = y.
- Determinante di A: det(A) = det(L) \* det(U). Poiché L è triangolare inferiore, il suo determinante è il prodotto degli elementi sulla diagonale principale, che sono tutti 1. Quindi det(L) = 1. Per U, essendo triangolare superiore, il determinante è il prodotto degli elementi sulla diagonale principale di U.
- Sistemi multipli AX=B (m sistemi di n equazioni). Si calcola L ed U e si risolvono le m coppie di sistemi triangolari.
- Calcolo di A^-1: dato che A\*A^-1 = I e A^-1 è incognita, il problema può essere scritto come AX = I, ovvero come sistema multiplo dove i termini noti sono le colonne della matrice identità. Si calcola L ed U e si risolvono le m coppie di sistemi triangolari.

In matlab, la fattorizzazione LU può essere calcolata utilizzando la funzione `lu`. Ad esempio, per calcolare la fattorizzazione LU della matrice A:

```matlab
A = [1 2; 3 4]; % matrice 2x2
[L, U] = lu(A); % matrice triangolare inferiore L e matrice triangolare superiore U
% L rappresenta la matrice triangolare inferiore
% U rappresenta la matrice triangolare superiore
```
