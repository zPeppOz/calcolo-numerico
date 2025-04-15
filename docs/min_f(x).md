# Il problema min f(x)

## Introduzione

Il problema è detto "minimizzazione di una funzione" oppure "determinazione di un punto di minimo di una funzione".
Un numero r è una soluzione del problema di minimizzazione di una funzione f se f(r) è minore o uguale a f(x) per ogni x appartenente all'intorno di r, cioè se r è un punto di minimo locale di f.
Il problema può ammettere una o più soluzioni, nessuna o infinite soluzioni, a seconda della funzione f e del dominio di definizione.
Gli algoritmi implementati permettono di determinare una sola soluzione alla volta, ma è possibile eseguire più volte l'algoritmo per trovare più soluzioni.
Come nel caso del problema $f(x) = 0$, anche se esiste una soluzione, non è detto che sia possibile trovare una formula chiusa per calcolarla. Ne consegue quindi che un algoritmo per risolvere il problema dovrà per forza essere iterativo, cioè dovrà calcolare una successione di punti che convergono alla soluzione.

## Algoritmi

### Newton per la minimizzazione

Se $f$ è derivabile, il metodo di Newton può allora essere utilizzato per trovare un punto di minimo locale di $f$.
Il metodo di Newton per la minimizzazione è un algoritmo iterativo locale a convergenza quadratica che si basa sull'idea di approssimare la funzione $f$ con una parabola, e poi trovare il punto in cui questa parabola tocca l'asse delle ascisse. Questo punto è un candidato per il minimo locale della funzione originale. Inoltre, è importante notare che la scelta del punto iniziale può influenzare la convergenza dell'algoritmo.

L'algoritmo di Newton per la minimizzazione è definito come segue:

1. Scegliere un punto iniziale $x_0$.
2. Calcolare la derivata prima $f'(x_0)$ e la derivata seconda $f''(x_0)$ della funzione $f$ in $x_0$.
3. Calcolare il nuovo punto $x_1$ utilizzando la formula:
   $$x_1 = x_0 - \frac{f'(x_0)}{f''(x_0)}$$
4. Ripetere i passi 2 e 3 fino a quando la differenza tra $x_n$ e $x_{n-1}$ è sufficientemente piccola (cioè fino a quando la convergenza è raggiunta).
5. Restituire il punto $x_n$ come soluzione del problema di minimizzazione.

#### Esempio di utilizzo in Matlab

```matlab
xminimo = newton(derivata, derivata2, x0, tol, max_iter);
```

dove `derivata` è la funzione che calcola la derivata prima di $f$, `derivata2` è la funzione che calcola la derivata seconda di $f$, `x0` è il punto iniziale, `tol` è la tolleranza per la convergenza e `max_iter` è il numero massimo di iterazioni. Assicurati di definire correttamente le funzioni `derivata` e `derivata2` prima di chiamare `newton`. Inoltre, verifica che i parametri passati siano corretti e che l'algoritmo converga per il problema specifico.

### Fminbnd

La function Matlab fminbnd calcola il punto di minimo di una funzione continua in un intervallo chiuso [a, b]. La funzione ha tre parametri di input:

- `fun` è la funzione da minimizzare,
- `a` è l'estremo sinistro dell'intervallo,
- `b` è l'estremo destro dell'intervallo.
- `options` è una struttura che contiene le opzioni per il calcolo del minimo, come la tolleranza e il numero massimo di iterazioni, e può essere creato utilizzando la funzione `optimset`.

#### Esempio di utilizzo in Matlab

```matlab
fun = @(x) (x-2).^2 + 1; % Funzione da minimizzare
a = 0; % Estremo sinistro dell'intervallo
b = 4; % Estremo destro dell'intervallo

options = optimset('TolX', 1e-6, 'MaxIter', 100); % Opzioni per il calcolo del minimo

xminimo = fminbnd(fun, a, b, options); % Calcolo del minimo
disp(['Il punto di minimo è: ', num2str(xminimo)]); % Stampa del risultato
```

In questo esempio, la funzione da minimizzare è una parabola con un minimo globale in x = 2. La funzione fminbnd cerca il punto di minimo nell'intervallo [0, 4] e restituisce il valore di x che minimizza la funzione. Le opzioni specificano una tolleranza di 1e-6 e un numero massimo di iterazioni di 100.

## Minimo di funzioni unimodali

Una funzione è unimodale in [a,b] se esiste un unico numero r tale che f è decrecente in [a,r] e crescente in [r,b].
In altre parole, una funzione unimodale ha un solo punto di massimo o minimo in un intervallo chiuso [a,b].
Se $f$ è unimodale, è possibile utilizzare algoritmi di ricerca per trovare il punto di minimo in modo più efficiente.

### Algoritmi

#### Fminrand

L'algoritmo fminrand implementa una ricerca casuale per trovare il minimo di una funzione all'interno di un intervallo [a,b]. Si tratta di un approccio ricorsivo che combina elementi di esplorazione casuale con una strategia di restringimento dell'intervallo di ricerca.

Il funzionamento dell'algoritmo è il seguente:

1. Se l'ampiezza dell'intervallo [a,b] è minore o uguale a una tolleranza `delta` specificata, o se il numero massimo di iterazioni `max_iter` è esaurito, l'algoritmo restituisce il punto medio dell'intervallo come soluzione.
2. Altrimenti, vengono generati casualmente due punti `x1` e `x2` all'interno dell'intervallo [a,b].
3. Si identificano il punto più piccolo `c` e il punto più grande `d` tra questi due.
4. Si valuta la funzione in entrambi i punti:
   - Se `f(c) < f(d)`, allora il minimo si trova probabilmente nell'intervallo [a,d], quindi l'intervallo di ricerca viene aggiornato a [a,d].
   - Altrimenti, il minimo si trova probabilmente nell'intervallo [c,b], quindi l'intervallo di ricerca viene aggiornato a [c,b].
5. L'algoritmo procede ricorsivamente, chiamando se stesso con l'intervallo aggiornato e il contatore di iterazioni diminuito di 1.

Questo metodo è particolarmente adatto per funzioni unimodali, ma può essere applicato anche a funzioni più complesse, sebbene con una probabilità di successo inferiore. La componente casuale dell'algoritmo permette di esplorare diverse regioni dell'intervallo, potenzialmente evitando minimi locali.

##### Esempio di utilizzo in Matlab

```matlab
f = @(x) (x-3).^2 + 2; % Funzione da minimizzare
a = 0; % Estremo sinistro dell'intervallo
b = 6; % Estremo destro dell'intervallo
delta = 1e-6; % Tolleranza per la convergenza
max_iter = 1000; % Numero massimo di iterazioni

xminimo = fminrand(f, a, b, delta, max_iter); % Calcolo del minimo
disp(['Il punto di minimo è: ', num2str(xminimo)]); % Stampa del risultato
disp(['Il valore minimo è: ', num2str(f(xminimo))]); % Stampa del valore minimo
```

In questo esempio, la funzione da minimizzare è una parabola con un minimo globale in x = 3. L'algoritmo fminrand cerca il punto di minimo nell'intervallo [0, 6] utilizzando una ricerca casuale con una tolleranza di 1e-6 e un massimo di 1000 iterazioni.

### Fibonacci Search e Golden Section Search

#### Golden Section Search

Il metodo della sezione aurea (Golden Section Search) è un algoritmo efficace per trovare il minimo di una funzione unimodale in un intervallo chiuso. L'algoritmo prende il nome dalla proporzione aurea (circa 0.618) che viene utilizzata per determinare i punti di suddivisione dell'intervallo.

Il funzionamento dell'algoritmo è il seguente:

1. Si parte da un intervallo iniziale [a, b] dove si presume si trovi il minimo.
2. Si calcolano due punti interni c e d utilizzando il rapporto aureo:
   ```
   c = b - gr * (b - a)
   d = a + gr * (b - a)
   ```
   dove gr = (√5 - 1)/2 ≈ 0.618 è il rapporto aureo.
3. Si valuta la funzione in questi due punti e si confrontano i risultati:
   - Se f(c) < f(d), il minimo si trova nell'intervallo [a, d], quindi si aggiorna b = d.
   - Altrimenti, il minimo si trova nell'intervallo [c, b], quindi si aggiorna a = c.
4. Si ricicla uno dei punti interni (c o d) risparmiando una valutazione della funzione.
5. Si ripete il processo fino a quando l'ampiezza dell'intervallo (b - a) diventa inferiore a una tolleranza specificata.

Questo metodo ha il vantaggio di ridurre l'intervallo di ricerca di un fattore costante (circa 0.618) ad ogni iterazione, garantendo una convergenza efficiente.

##### Esempio di utilizzo in Matlab

```matlab
f = @(x) -exp(-x).*sin(2*x-pi/2); % Funzione da minimizzare
a = -2.5; % Estremo sinistro dell'intervallo
b = 1; % Estremo destro dell'intervallo
tol = 1e-6; % Tolleranza per la convergenza

xminimo = fmingolden(f, a, b, tol); % Calcolo del minimo
disp(['Il punto di minimo è: ', num2str(xminimo)]); % Stampa del risultato
disp(['Il valore minimo è: ', num2str(f(xminimo))]); % Stampa del valore minimo
```

#### Fibonacci Search

Il metodo di ricerca di Fibonacci è un altro algoritmo efficace per trovare il minimo di una funzione unimodale in un intervallo chiuso [a, b]. Simile al metodo della sezione aurea, la ricerca di Fibonacci utilizza i numeri della sequenza di Fibonacci per determinare i punti di suddivisione dell'intervallo.

La sequenza di Fibonacci è definita come:

```
F(0) = 0, F(1) = 1, F(n) = F(n-1) + F(n-2) per n > 1
```

Il funzionamento dell'algoritmo è il seguente:

1. Si determina il numero n di iterazioni che si vogliono eseguire, basandosi sulla precisione desiderata.
2. Si calcolano i due punti interni c e d nell'intervallo [a, b] usando i numeri di Fibonacci:
   ```
   c = a + (F(n-2)/F(n)) * (b - a)
   d = a + (F(n-1)/F(n)) * (b - a)
   ```
3. Si valuta la funzione in questi due punti e si confrontano i risultati:
   - Se f(c) < f(d), il minimo si trova nell'intervallo [a, d], quindi si aggiorna b = d e d = c.
   - Altrimenti, il minimo si trova nell'intervallo [c, b], quindi si aggiorna a = c e c = d.
4. Si ricalcola il punto mancante (c o d) usando di nuovo i rapporti dei numeri di Fibonacci, questa volta con un indice ridotto di 1.
5. Si ripete il processo per n iterazioni, riducendo l'intervallo di ricerca ad ogni passo.

La ricerca di Fibonacci ha un vantaggio teorico rispetto alla sezione aurea: è ottimale in termini di numero di valutazioni della funzione necessarie per raggiungere una determinata precisione. Tuttavia, la differenza pratica tra i due metodi è spesso minima.

##### Confronto con Golden Section Search

| Aspetto                    | Fibonacci Search                     | Golden Section Search             |
| -------------------------- | ------------------------------------ | --------------------------------- |
| Base matematica            | Numeri di Fibonacci                  | Rapporto aureo                    |
| Numero di iterazioni       | Predeterminato                       | Determinato dalla tolleranza      |
| Precisione finale          | Determinata dal numero di iterazioni | Determinata dalla tolleranza      |
| Complessità implementativa | Più complessa                        | Più semplice                      |
| Efficienza teorica         | Leggermente migliore                 | Leggermente inferiore             |
| Riciclo dei punti          | Un punto riciclato per iterazione    | Un punto riciclato per iterazione |

##### Implementazione concettuale in Matlab

```matlab
function xmin = fminfibo(f, a, b, n)
    % Array dei numeri di Fibonacci
    fib = zeros(n+1, 1);
    fib(1) = 1;
    fib(2) = 1;
    for i = 3:n+1
        fib(i) = fib(i-1) + fib(i-2);
    end

    % Calcolo dei punti interni iniziali
    c = a + (fib(n-1)/fib(n+1)) * (b - a);
    d = a + (fib(n)/fib(n+1)) * (b - a);

    % Valutazione della funzione nei punti interni
    fc = f(c);
    fd = f(d);

    % Riduzione dell'intervallo per n-1 iterazioni
    for k = 1:n-1
        if fc < fd
            b = d;
            d = c;
            fd = fc;
            c = a + (fib(n-k-1)/fib(n-k+1)) * (b - a);
            fc = f(c);
        else
            a = c;
            c = d;
            fc = fd;
            d = a + (fib(n-k)/fib(n-k+1)) * (b - a);
            fd = f(d);
        end
    end

    % Stima finale del minimo
    xmin = (a + b) / 2;
end
```

In questo esempio concettuale, la funzione `fminfibo` implementa la ricerca di Fibonacci per trovare il minimo di una funzione. A differenza del metodo della sezione aurea, qui è necessario specificare il numero di iterazioni n anziché una tolleranza.

In generale, l'utilizzo del metodo della sezione aurea è più comune nella pratica grazie alla sua semplicità implementativa e alla sua efficienza paragonabile.
