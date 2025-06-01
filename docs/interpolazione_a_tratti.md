# Funzioni Polinomiali a Tratti

## Introduzione

Introduciamo una griglia di punti, detti **breakpoints**:
$G = \{x_1, x_2, ..., x_n\}$ con $x_i < x_{i+1}$ per $i=1, ..., n-1$.
L'intervallo $[a,b]$ è definito da $x_1=a$ e $x_n=b$.

L'intervallo $[x_i, x_{i+1}]$ è detto **i-esima cella** della griglia (oppure i-simo sottointervallo).

Una **funzione polinomiale a tratti** su $[a,b]$, detta anche "**polinomio a tratti**" oppure _piecewise polynomial_, è una funzione la cui restrizione su ogni cella è un polinomio.

**NOTA BENE**: L'insieme delle funzioni polinomiali a tratti include l'insieme degli usuali polinomi.

Un **polinomio a tratti di grado k** in $[a,b]$, rispetto alla griglia G, è una funzione che **in ogni cella** della griglia è un **polinomio di grado al più k**.

Esempio:

- $p_1(x)$ polinomio definito nella cella 1 ($[x_1, x_2]$)
- $p_2(x)$ polinomio definito nella cella 2 ($[x_2, x_3]$)
- ...
- $p_k(x)$ polinomio definito nella cella k

Un polinomio a tratti può essere **discontinuo solo nei breakpoint**.

## Interpolazione con Polinomi a Tratti

### Caso: breakpoint = nodi di interpolazione

- **Polinomio a tratti di grado 0**:
  La funzione è costante a tratti. Ogni pezzo è un polinomio di grado 0. L'interpolazione avviene prendendo il valore del nodo all'inizio dell'intervallo della cella.

### Caso: breakpoint ≠ nodi di interpolazione

- **Polinomio a tratti di grado 0 (interpolazione al più vicino)**:
  I breakpoint definiscono gli intervalli, e per ogni intervallo si sceglie il valore del nodo di interpolazione più vicino (o secondo una regola specifica) per definire il valore costante della funzione in quella cella.

- **Polinomio a tratti di grado 1 (lineare a tratti / spezzata)**:
  Se i breakpoint coincidono con i nodi di interpolazione, si ottiene una funzione lineare a tratti (una spezzata) che congiunge i punti dati.

  **Espressione del polinomio a tratti di grado 1, $L(x)$**:
  Per ogni cella $i=1:n-1$, il polinomio $L_i(x)$ è definito su $[x_i, x_{i+1}]$:
  $L_i(x) = a_i + b_i(x - x_i)$
  dove:

  - $a_i = y_i$
  - $b_i = \frac{y_{i+1} - y_i}{x_{i+1} - x_i}$

  La funzione $L(x)$ è definita come:
  $L(x) = \begin{cases} L_1(x) & \text{se } x_1 \le x < x_2 \\ L_2(x) & \text{se } x_2 \le x < x_3 \\ L_3(x) & \text{se } x_3 \le x \le x_4 \\ ... \end{cases}$
  (L'esempio nelle slide mostra 3 segmenti, quindi fino a $x_4$).

  **MATLAB function `PaTLin(x,y)`**:

  ```matlab
  function [a,b] = PaTLin(x,y)
  % interpolazione con polinomio lineare
  % a tratti
  % input
  %   x,y   vettori dei nodi e di valori
  %         (ascisse e ordinate dei punti
  %         da interpolare)
  % output
  %   a     a(i) è il primo coefficiente
  %         dell'i-simo polinomio
  %   b     b(i) è il secondo coeff.
  %         dell'i-simo polinomio
  %   a,b hanno n-1 componenti
  n = length(x);
  a = y(1:n-1);
  b = diff(y)./diff(x);
  ```

## Funzione Spline Lineare (Spline di primo grado)

Un polinomio lineare a tratti interpolante è una:

- Funzione **continua** in $[a,b]$.
- Con **derivata prima** (eventualmente) **discontinua** (la discontinuità può essere solo nei breakpoint).

Questa è chiamata **funzione spline lineare** (o spline di primo grado).

**Importante**:

- Il **grado** della spline interpolante **non** dipende dal numero dei nodi.
- Se la spline lineare avesse derivata prima continua, allora la spline lineare sarebbe un polinomio di grado 1 (una singola retta).

Graficamente, $s(x) = L(x)$ per la spline lineare.

## Funzione Spline Cubica (Spline di terzo grado)

Una funzione spline cubica è:

- Un **polinomio a tratti di terzo grado**.
- Una funzione **continua** in $[a,b]$ (C0).
- Una funzione con **derivata prima continua** in $[a,b]$ (C1).
- Una funzione con **derivata seconda continua** in $[a,b]$ (C2).

**N.B.** Le informazioni sulla _derivata terza_ non concorrono alla definizione. La derivata terza nei breakpoint potrebbe essere o non essere continua, e **NON CI INTERESSA STABILIRLO** ai fini della definizione di spline cubica.

**Due Osservazioni**:

1.  L'insieme delle spline cubiche **contiene strettamente** l'insieme dei polinomi di grado 3.
    (Un polinomio di grado 3 è una spline cubica, ma non tutte le spline cubiche sono un singolo polinomio di grado 3).
2.  Una spline cubica con derivata terza continua è un polinomio di grado 3.

L'occhio umano non è in grado di "apprezzare" una discontinuità della derivata terza di una funzione.

**Espressione della spline cubica $s(x)$**:
$s(x) = \begin{cases} s_1(x) & \text{se } x_1 \le x < x_2 \\ s_2(x) & \text{se } x_2 \le x < x_3 \\ ... \\ s_k(x) & \text{se } x_k \le x < x_{k+1} \end{cases}$

Ogni $s_i(x)$ è un polinomio di grado 3:
$s_i(x) = a_i + b_i(x - x_i) + c_i(x - x_i)^2 + d_i(x - x_i)^3$

- Una spline può non essere un polinomio.
- Un polinomio è una particolare spline.

**Rappresentazione di una spline cubica (standard, come polinomio a tratti)**:

- 4 coefficienti ($a_i, b_i, c_i, d_i$) per ogni cella (sottointervallo).
- Griglia di $n$ breakpoint ($n-1$ celle).
- Questo porta a una matrice di coefficienti di dimensioni $(n-1) \times 4$.

| $a_1$ | $b_1$ | $c_1$ | $d_1$ | coefficienti di $s_1(x)$ |
| ----- | ----- | ----- | ----- | ------------------------ |
| $a_2$ | $b_2$ | $c_2$ | $d_2$ | coefficienti di $s_2(x)$ |
| ...   | ...   | ...   | ...   | ...                      |
| $a_k$ | $b_k$ | $c_k$ | $d_k$ | coefficienti di $s_k(x)$ |

(dove $k = n-1$)

### Costruzione della Spline Cubica Interpolante

Consideriamo il caso $n=3$ (3 nodi $x_1, x_2, x_3$; 2 celle/segmenti $s_1(x), s_2(x)$).
$s_1(x) = a_1 + b_1(x-x_1) + c_1(x-x_1)^2 + d_1(x-x_1)^3$
$s_2(x) = a_2 + b_2(x-x_2) + c_2(x-x_2)^2 + d_2(x-x_2)^3$

Incognite: $a_1, b_1, c_1, d_1, a_2, b_2, c_2, d_2$ (8 incognite).

**Condizioni da imporre**:

1.  **Interpolazione**:
    - $s_1(x_1) = y_1$
    - $s_1(x_2) = y_2$
    - $s_2(x_2) = y_2$
    - $s_2(x_3) = y_3$
      (4 condizioni)
2.  **Continuità derivata prima (in $x_2$)**:
    - $s_1'(x_2) = s_2'(x_2)$
      (1 condizione)
3.  **Continuità derivata seconda (in $x_2$)**:
    - $s_1''(x_2) = s_2''(x_2)$
      (1 condizione)

In totale: $4+1+1 = 6$ condizioni. Servono altre 2 condizioni per determinare le 8 incognite.

**Altre 2 condizioni (condizioni agli estremi)**:
Possono essere scelte in modo arbitrario. Alcune scelte comuni:

1.  **Spline Naturale**: Derivata seconda nulla agli estremi.
    - $s_1''(x_1) = 0$
    - $s_n''(x_n) = 0$ (nel caso $n=3$, $s_2''(x_3)=0$)
2.  **Spline "Not-a-Knot" (usata in Matlab di default)**: Derivata terza continua nel secondo e nel penultimo breakpoint.
    Per $n=3$, questo implica che $s_1(x)$ e $s_2(x)$ sono lo stesso polinomio (poiché c'è un solo breakpoint interno).

**Sistema Lineare per Spline Naturale (caso n=3)**:
Le 8 condizioni diventano:

1.  $a_1 = y_1$ (da $s_1(x_1)=y_1$, poiché $(x_1-x_1)=0$)
2.  $a_1 + b_1(x_2-x_1) + c_1(x_2-x_1)^2 + d_1(x_2-x_1)^3 = y_2$ (da $s_1(x_2)=y_2$)
3.  $a_2 = y_2$ (da $s_2(x_2)=y_2$, poiché $(x_2-x_2)=0$)
4.  $a_2 + b_2(x_3-x_2) + c_2(x_3-x_2)^2 + d_2(x_3-x_2)^3 = y_3$ (da $s_2(x_3)=y_3$)
5.  $b_1 + 2c_1(x_2-x_1) + 3d_1(x_2-x_1)^2 - b_2 = 0$ (da $s_1'(x_2)=s_2'(x_2)$)
6.  $2c_1 + 6d_1(x_2-x_1) - 2c_2 = 0$ (da $s_1''(x_2)=s_2''(x_2)$)
7.  $2c_1 = 0$ (da $s_1''(x_1)=0$)
8.  $2c_2 + 6d_2(x_3-x_2) = 0$ (da $s_2''(x_3)=0$)

Semplificando con $h_1 = x_2-x_1$ e $h_2 = x_3-x_2$:

1.  $a_1 = y_1$
2.  $a_1 + b_1 h_1 + c_1 h_1^2 + d_1 h_1^3 = y_2$
3.  $a_2 = y_2$
4.  $a_2 + b_2 h_2 + c_2 h_2^2 + d_2 h_2^3 = y_3$
5.  $b_1 + 2c_1 h_1 + 3d_1 h_1^2 - b_2 = 0$
6.  $2c_1 + 6d_1 h_1 - 2c_2 = 0$
7.  $2c_1 = 0 \implies c_1 = 0$
8.  $2c_2 + 6d_2 h_2 = 0$

Vettore incognite: $c = (a_1, b_1, c_1, d_1, a_2, b_2, c_2, d_2)^T$
Vettore termini noti: $v = (y_1, y_2, y_2, y_3, 0, 0, 0, 0)^T$

Matrice dei coefficienti $A$ ($8 \times 8$):

```
[ 1  0    0      0      0  0    0      0    ]
[ 1  h1   h1^2   h1^3   0  0    0      0    ]
[ 0  0    0      0      1  0    0      0    ]
[ 0  0    0      0      1  h2   h2^2   h2^3 ]
[ 0  1    2h1    3h1^2  0 -1    0      0    ]
[ 0  0    2      6h1    0  0   -2      0    ]
[ 0  0    2      0      0  0    0      0    ]  (per c1=0)
[ 0  0    0      0      0  0    2      6h2  ]
```

Sistema lineare: $Ac = v$

**Spline Cubiche, Caso Generale ($n$ nodi di interpolazione)**:

- Numero coefficienti da determinare: $4(n-1) = 4n-4$.
- Condizioni di interpolazione: $2(n-1)$ (ogni segmento passa per i suoi due estremi).
  - $s_i(x_i) = y_i$ per $i=1, ..., n-1$ ($(n-1)$ condizioni)
  - $s_i(x_{i+1}) = y_{i+1}$ per $i=1, ..., n-1$ ($(n-1)$ condizioni)
    Slide indica $n+n-2 = 2n-2$.
- Continuità derivata prima: $n-2$ (nei nodi interni $x_2, ..., x_{n-1}$).
- Continuità derivata seconda: $n-2$ (nei nodi interni $x_2, ..., x_{n-1}$).
- Numero totale di condizioni "naturali": $(2n-2) + (n-2) + (n-2) = 4n-6$.
- Servono $ (4n-4) - (4n-6) = 2 $ condizioni aggiuntive (tipicamente agli estremi).
- Ordine del sistema: $4(n-1) \times 4(n-1)$.

### Spline Cubica Interpolante in MATLAB

La funzione `spline` in MATLAB:

- Di default, **non** è una spline naturale.
- È una spline "**not a knot**".

Esempio:

```matlab
>> x = [1 1.9 3 3.3 4 4.7];
>> y = [2 1.5 1.3 2.3 3 2.7];
>> xx = linspace(min(x),max(x),50); % Punti di valutazione
>> yspline = spline(x,y,xx);
>> plot(x,y,'o',xx,yspline)
```

La funzione `spline(x,y)` (senza `xx`) restituisce una struttura (`struct`) che rappresenta la spline in forma "piecewise polynomial" (pp-form).

```matlab
>> S = spline(x,y)
S =
  struct with fields:
    form: 'pp'
  breaks: [1 1.9000 3 3.3000 4 4.7000] % Breakpoints (nodi)
   coefs: [5x4 double]                 % Matrice dei coefficienti (n-1 righe)
  pieces: 5                            % Numero di pezzi polinomiali (n-1)
   order: 4                            % Ordine del polinomio + 1 (grado 3 -> ordine 4)
     dim: 1
```

Per valutare la spline: `ppval(S, punto_valutazione)`

```matlab
>> ppval(S, 1.5)
ans =
   2.0731
```

Per estrarre i componenti della pp-form: `[breaks,coeffs,ncelle,ncoef]=unmkpp(S)`
I coefficienti `coeffs` sono ordinati secondo le **potenze decrescenti** per ogni pezzo:
$d_i (x-x_i)^3 + c_i (x-x_i)^2 + b_i (x-x_i) + a_i$ (se Matlab restituisce $d_i, c_i, b_i, a_i$)
Oppure, se $s_i(X) = c_{i1}X^3 + c_{i2}X^2 + c_{i3}X + c_{i4}$ dove $X = x-x_i$.
La slide mostra `coeffs` come $[d_i, c_i, b_i, a_i]$ se $s_i(x-x_i) = d_i(x-x_i)^3 + c_i(x-x_i)^2 + b_i(x-x_i) + a_i$.
**Attenzione**: L'ordinamento dei coefficienti in MATLAB per `spline` è per $s_i(x) = a_i(x-x_i)^3 + b_i(x-x_i)^2 + c_i(x-x_i) + d_i$.
La colonna `coeffs(i,1)` è il coeff. di $x^3$, `coeffs(i,2)` di $x^2`, ecc. _relativo a $(x-breaks(i))$\_.

## Funzione Cubica di Hermite a Tratti

**Non è una spline!** (Generalmente, la derivata seconda non è continua nei nodi).

- È un **polinomio a tratti di terzo grado**.
- È una funzione **continua** in $[a,b]$ (C0).
- È una funzione con **derivata prima continua** in $[a,b]$ (C1).
- La **derivata seconda** è (eventualmente) **discontinua** (la discontinuità può essere solo nei breakpoint).

- L'insieme delle cubiche di Hermite a tratti **contiene strettamente** l'insieme delle spline cubiche.
- Una cubica di Hermite con derivata seconda continua è una spline cubica.

### Interpolazione con Cubiche di Hermite a Tratti (Shape Preserving)

**Obiettivo**: Dati $n$ punti da interpolare, si vuole costruire una cubica di Hermite a tratti che **non oscilli** tra nessuna coppia di nodi consecutivi.

- Problema di interpolazione di Hermite: si specificano valori della funzione e della sua derivata prima nei nodi.
- Nell'interpolazione _shape preserving_, i valori delle **pendenze** (derivate prime) nei nodi vengono **automaticamente determinati** in modo che la funzione interpolante non oscilli intorno a ogni nodo.

**Condizioni (per $n$ nodi, $n-1$ segmenti):**

- Numero coefficienti: $4(n-1)$.
- Condizioni di interpolazione (valori $y_i$): $2(n-1)$ (come per le spline).
- Condizioni sulla derivata prima (valori $y'_i$): $2(n-1)$ (ogni segmento deve avere certe pendenze agli estremi).
- Numero totale condizioni: $4(n-1)$.
- Il sistema $Hc=b$ è determinato una volta scelte le pendenze $y'_i$.

**Determinazione automatica delle pendenze $d_k^{nodo}$ (derivata nel nodo $x_k$):**
Siano $d_k^{sin}$ la pendenza della secante a sinistra $(y_k-y_{k-1})/(x_k-x_{k-1})$ e $d_k^{des}$ la pendenza della secante a destra $(y_{k+1}-y_k)/(x_{k+1}-x_k)$.

1.  Se $d_k^{sin}$ e $d_k^{des}$ hanno **segno opposto** (o una delle due è nulla), indica un massimo/minimo locale discreto. Si impone pendenza nel nodo nulla:
    $d_k^{nodo} = 0$.
2.  Se $d_k^{sin}$ e $d_k^{des}$ hanno **segno uguale** (e non nulle):
    Si impone pendenza nel nodo uguale alla **media armonica** delle pendenze delle secanti (modificata, per garantire che la pendenza interpolata non sia più grande in magnitudine di $3 \times$ la pendenza della secante più piccola, e per gestire il caso in cui una pendenza sia zero).
    Una formula comune è:
    $d_k^{nodo} = \frac{3(x_{k+1}-x_k)d_k^{sin} + 3(x_k-x_{k-1})d_k^{des}}{(x_{k+1}-x_{k-1})}$ se $d_k^{sin}d_k^{des}>0$.
    La slide suggerisce una media armonica:
    $\frac{1}{d_k^{nodo}} = \frac{1}{2} \left( \frac{1}{d_k^{sin}} + \frac{1}{d_k^{des}} \right)$ se $d_k^{sin}, d_k^{des}$ hanno lo stesso segno e sono non nulle.
    (Per gli estremi $x_1, x_n$, si usano metodi specifici one-sided).

**MATLAB**: `pchip` (Piecewise Cubic Hermite Interpolating Polynomial)

```matlab
>> ych = pchip(x,y,xx);
>> plot(x,y,'o',xx,ych)
```

`pchip` produce tipicamente meno oscillazioni rispetto a `spline`, specialmente se i dati non sono "lisci".

## Esempio: Errore di Interpolazione della Funzione di Runge

Funzione di Runge: $f(x) = \frac{1}{1+25x^2}$ su $[-1,1]$.
Questa funzione è nota per causare problemi con l'interpolazione polinomiale globale con nodi equispaziati (fenomeno di Runge).

Confrontando spline e cubiche di Hermite (pchip) su nodi equispaziati:

- **Spline (not-a-knot)**: Mostra buone prestazioni, errore piccolo.
- **Cubiche di Hermite (pchip)**: Mostra buone prestazioni, errore generalmente più grande della spline "not-a-knot" ma senza le oscillazioni selvagge dell'interpolazione polinomiale globale.
- **Spline Naturale**: Simile alla "not-a-knot", ma può avere errori leggermente maggiori vicino agli estremi a causa della condizione $s''(a)=s''(b)=0$.

L'errore di ricostruzione per `pchip` può essere maggiore rispetto a `spline` (e.g., $9 \times 10^{-3}$ vs $1.5 \times 10^{-3}$ nell'esempio delle slide).

## Applicazioni in Computer Graphics

Le funzioni **spline** e le funzioni **cubiche di Hermite a tratti** sono tra i principali strumenti della **computer graphics**.

La computer graphics è basata su:

- Interpolazione 1D
- Interpolazione 2D (il descrittore è una funzione di due variabili, il cui grafico è una superficie)

### Interpolazione Parametrica di Curve (Caso 1D generalizzato)

**Problema**: Dati $n$ punti nel piano $(x_k, y_k)$, ordinati in sequenza, determinare una curva continua e liscia che passi per gli $n$ punti.
**Attenzione**: La curva può non essere il grafico di una funzione $y=f(x)$ (es. curve chiuse, autointersezioni).

**Equazione di una curva parametrica**:
Ogni punto $P$ della curva è funzione di un parametro $t$: $P(t) = (x(t), y(t))$.
L'ascissa $x$ e l'ordinata $y$ sono funzioni del parametro $t$.
Al variare del parametro $t$, si ottengono tutti i punti della curva.

**Per interpolare i punti $(x_k, y_k)$ con $k=1, ..., n$**:

1.  Si definisce un vettore di parametri $t_k$ (es. $t_k = k$, l'indice del punto, o la lunghezza d'arco cumulativa).
2.  Si interpola $x(t)$ usando i punti $(t_k, x_k)$.
3.  Si interpola $y(t)$ usando i punti $(t_k, y_k)$.

Esempio:

- `xt = spline(t, x_nodi, tt_eval)`
- `yt = spline(t, y_nodi, tt_eval)`
- `plot(xt, yt)`

Si può usare `spline` (per spline cubiche) o `pchip` (per cubiche di Hermite shape-preserving).
Per curve chiuse, si possono usare condizioni di periodicità agli estremi per le spline.

### Esempio: Ricostruire una Circonferenza

Dati $N$ punti equispaziati sulla circonferenza unitaria:
$x_k = \cos(\theta_k)$, $y_k = \sin(\theta_k)$ per $\theta_k = \frac{2\pi (k-1)}{N-1}$, $k=1, ..., N$.
(Se si vogliono $N$ punti includendo l'estremo $2\pi$ coincidente con $0$, si usa `linspace(0,2*pi,N+1)` e si prendono i primi $N$ punti, o si gestisce la periodicità).
Slide: `teta = linspace(0,2*pi,9);` (9 punti, l'ultimo coincide col primo se si chiude la curva).

Si può usare come parametro:

1.  L'indice dei punti: `t = 1:length(teta);`
2.  L'angolo `teta` stesso.

```matlab
% Caso 1: parametro = indice
t = 1:length(teta);
tt = linspace(t(1),t(end),250); % Punti di valutazione del parametro
xspline = spline(t,x,tt);
yspline = spline(t,y,tt);
plot(x,y,'o',xspline,yspline)

% Caso 2: parametro = teta
tteta = linspace(teta(1),teta(end),250);
xsplineteta = spline(teta,x,tteta);
ysplineteta = spline(teta,y,tteta);
plot(x,y,'o',xsplineteta,ysplineteta)
```

Analogamente si può usare `pchip`.

### Esempio: Interpolazione di Figure Complesse (es. Paperino)

Si hanno sequenze di punti $(x_k, y_k)$ che definiscono il contorno di diverse parti della figura.
Si applica l'interpolazione parametrica (con `spline` o `pchip`) a ciascuna sequenza di punti per disegnare la figura.

---
