# Il Problema del Punto Fisso

## Definizione
Un **punto fisso** di una funzione $g(x)$ è un valore $p$ tale che $p = g(p)$. Il problema del punto fisso consiste nel trovare questo valore $p$.

## Teorema di esistenza e unicità (Teorema delle Contrazioni)
Sia $g: [a,b] \rightarrow [a,b]$ una funzione continua tale che:
- $g([a,b]) \subseteq [a,b]$ (la funzione mappa l'intervallo in sé stesso)
- Esiste una costante $L < 1$ tale che $|g(x) - g(y)| \leq L|x - y|$ per ogni $x,y \in [a,b]$ (la funzione è una contrazione)

Allora:
1. Esiste un unico punto fisso $p \in [a,b]$ tale che $p = g(p)$
2. Per qualsiasi $x_0 \in [a,b]$, la successione $x_{k+1} = g(x_k)$ converge a $p$
3. Vale la stima dell'errore: $|x_k - p| \leq \frac{L^k}{1-L}|x_1 - x_0|$

## Algoritmo del punto fisso

Il metodo iterativo per trovare il punto fisso è:
1. Si sceglie un'approssimazione iniziale $x_0$
2. Si calcola la successione: $x_{k+1} = g(x_k)$ per $k = 0,1,2,...$
3. Si itera fino a quando $|x_{k+1} - x_k| < tol$ (tolleranza desiderata)

### Pseudocodice
```
function puntoFisso(g, x0, tol, max_iter)
    p = x0
    for k = 1 to max_iter
        x_new = g(p)
        if |x_new - p| < tol then
            return x_new  // Convergenza raggiunta
        p = x_new
    return p  // Numero massimo di iterazioni raggiunto
```

## Convergenza

### Condizioni di convergenza
La condizione necessaria e sufficiente per la convergenza locale è che $|g'(p)| < 1$, dove $p$ è il punto fisso.

Se $|g'(x)| < 1$ per ogni $x$ in un intorno di $p$, allora il metodo converge per ogni scelta iniziale $x_0$ sufficientemente vicina a $p$.

### Ordine di convergenza
- Il metodo del punto fisso ha generalmente **convergenza lineare** con fattore $|g'(p)|$
- Se $g'(p) = 0$, la convergenza è **almeno quadratica**

### Stima dell'errore
Se $g$ è una contrazione con costante $L$, allora:
- $|x_k - p| \leq L^k|x_0 - p|$
- $|x_{k+1} - p| \leq L|x_k - p|$

## Riformulazione di problemi come punto fisso

Il problema di trovare lo zero di una funzione $f(x) = 0$ può essere riformulato come un problema di punto fisso:
- Si definisce $g(x) = x + \alpha f(x)$ con $\alpha$ opportuno, oppure altre formulazioni
- Si cerca $p$ tale che $p = g(p)$

## Applicazioni
1. **Risoluzione di equazioni non lineari**: Trasformando $f(x) = 0$ in $x = g(x)$
2. **Calcolo di radici**: Ad esempio, $\sqrt{a}$ è il punto fisso di $g(x) = \frac{1}{2}(x + \frac{a}{x})$
3. **Risoluzione di sistemi di equazioni**: Applicando il metodo a sistemi multidimensionali
4. **Problemi di ottimizzazione**: Trovando punti stazionari di funzioni

## Esempi

### Esempio 1: Calcolo di $\sqrt{3}$
Per calcolare $\sqrt{3}$, possiamo usare la funzione $g(x) = \frac{1}{2}(x + \frac{3}{x})$.
- La successione $x_{k+1} = \frac{1}{2}(x_k + \frac{3}{x_k})$ converge a $\sqrt{3}$
- Partendo da $x_0 = 3$, si ottiene rapidamente un'approssimazione di $\sqrt{3} \approx 1.732050$

### Esempio 2: Punto fisso di $\cos(x)$
La funzione $g(x) = \cos(x)$ ha un punto fisso in $x \approx 0.739085$.
- La successione $x_{k+1} = \cos(x_k)$ converge a questo valore
- $|\cos'(x)| = |\sin(x)| < 1$ nell'intervallo di interesse, garantendo la convergenza

## Vantaggi e svantaggi

### Vantaggi
- Algoritmo semplice da implementare
- Utile per riformulare problemi complessi

### Svantaggi
- Convergenza soltanto lineare (in generale)
- Richiede che la funzione sia una contrazione
- La scelta di $g(x)$ influenza significativamente la velocità di convergenza