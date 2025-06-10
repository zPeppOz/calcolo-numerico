## Risoluzione di un'equazione non lineare

**Problema Fondamentale:**
Data una funzione univariata $f: \mathbb{R} \to \mathbb{R}$, trovare un valore $r$ tale che $f(r) = 0$.
Il valore $r$ è chiamato **radice** o **zero** di $f$.

**Rappresentazione Grafica:**
La radice $r$ è il punto in cui il grafico della funzione $y=f(x)$ interseca l'asse delle ascisse (asse x).

### Altri problemi equivalenti a $f(x)=0$

Molti problemi possono essere riformulati come la ricerca di uno zero di una funzione:

1.  **Equazione $w(x) = v(x)$:**
    Questo problema è equivalente a $f(x) = 0$ se si pone $f(x) = w(x) - v(x)$.

2.  **Equazione $w(x) / v(x) = 1$:**
    Questo problema è equivalente a $f(x) = 0$ se si pone $f(x) = w(x) / v(x) - 1$, a condizione che $v(x) \neq 0$.

### Alcune osservazioni sugli zeri

*   **Più zeri:** Una funzione può avere più di uno zero (intersezioni con l'asse x).
*   **Zeri multipli (1):** In un punto $r$, se $f(r)=0$ e anche la sua derivata $f'(r)=0$, si parla di zero multiplo. Graficamente, la funzione tocca l'asse x in modo "piatto" (la tangente è orizzontale sull'asse). Questo indica una molteplicità di almeno 2.
*   **Zeri multipli (2):** Se in un punto $r$ sono nulle $f(r)$, $f'(r)$ e $f''(r)$, allora la molteplicità dello zero è almeno 3. Graficamente, la funzione ha un punto di flesso sull'asse x.

### Posizione e Condizionamento di un problema

Nel calcolo numerico, sono fondamentali i concetti di **posizione** e **condizionamento** di un problema.

**Problema BEN POSTO (secondo Hadamard):**
Un problema matematico P è detto BEN POSTO se sono verificate le seguenti condizioni:
*   **Esistenza:** P ammette almeno una soluzione $s$.
*   **Unicità:** La soluzione $s$ è unica.
*   **Stabilità:** La soluzione $s$ dipende con continuità dai dati di P.

**Problema BEN CONDIZIONATO:**
Un problema matematico P è detto BEN CONDIZIONATO se a piccole variazioni sui dati corrispondono piccole variazioni sulla soluzione.
Il fattore di amplificazione dell'errore (variazione) tra dati e soluzione è detto **INDICE (o numero) DI CONDIZIONAMENTO** del problema. Si parla di indice di condizionamento assoluto/relativo a seconda del tipo di errore.

#### Osservazioni fondamentali nel Calcolo Numerico:

1.  Un problema ben posto potrebbe essere comunque mal condizionato.
2.  Un problema mal posto è sempre mal condizionato e quindi non risolubile (numericamente).
3.  Se un problema è mal condizionato non può esistere un algoritmo stabile per risolverlo numericamente in modo accurato.
4.  Da 2. e 3. segue che se un problema è mal posto non può esistere un algoritmo stabile per risolverlo numericamente in modo accurato.
5.  I problemi diretti sono tipicamente ben posti (es: data una funzione $f$, valutarla in 10 punti).
6.  I problemi inversi sono tipicamente mal posti (es: dati i valori di una funzione $f$ solo su 10 punti, trovare l'espressione generale di $f$).
7.  Un problema inverso mal posto può essere modificato in uno ben posto aggiungendo ulteriori vincoli o informazioni. Questa tecnica è nota come **REGOLARIZZAZIONE** del problema.

#### Condizionamento del problema $f(x)=0$:

*   **Problema ben condizionato (poco sensibile a errori sui dati):**
    Il grafico della funzione ha una pendenza elevata (ripida) in prossimità della radice. Una piccola variazione su $f$ (es. dovuta ad errori di calcolo) comporta una piccola variazione sulla radice $r$.
*   **Problema mal condizionato (molto sensibile a errori sulla funzione):**
    Il grafico della funzione ha una pendenza bassa (piatta) in prossimità della radice. Una piccola variazione su $f$ comporta una grande variazione sulla radice $r$.

**Stima quantitativa del condizionamento:**
L'indice di condizionamento del problema $f(x)=0$ in corrispondenza della radice $r$ è dato da:
$\kappa_f(r) = |f'(r)|^{-1}$
Questo significa che se $|f'(r)|$ è piccolo (pendenza piatta), $\kappa_f(r)$ è grande (mal condizionato). Se $|f'(r)|$ è grande (pendenza ripida), $\kappa_f(r)$ è piccolo (ben condizionato).

### Introduzione ai Metodi Numerici

**TEOREMA (Abel-Ruffini):** Non sempre è possibile esprimere la soluzione $r$ di un'equazione algebrica mediante una **formula chiusa** (ovvero, usando solo operazioni elementari ed estrazione di radice). In particolare, non esiste una formula generale per polinomi di grado superiore a 4.
Questo è il motivo per cui sono necessari i metodi numerici.

**Idea Comune dei Metodi Numerici:**
Un metodo numerico per la risoluzione di $f(x)=0$ cerca un'approssimazione della radice mediante una **formula ricorrente**.
Ogni metodo deve costruire una sequenza di approssimazioni $x_0, x_1, x_2, \ldots, x_n, \ldots$ che converge alla soluzione $r$, ovvero:
$\lim_{n \to \infty} x_n = r$
La $k$-esima approssimazione sarà il valore $x_k$.

**Osservazione importante:** Se un metodo genera una successione convergente, allora i valori $x_k$ possono essere scelti come approssimazioni accurate della soluzione ideale $r$.

#### Errore del Metodo e Convergenza

Per ogni approssimazione $x_k$ è associato un **errore di troncamento** del metodo, definito come:
$e_k = x_k - r$, per $k = 0, 1, 2, \ldots$

Un metodo si dice **convergente** se la successione $x_k$ tende a $r$, cioè se l'errore $e_k$ tende a $0$ quando $k \to \infty$:
$\lim_{k \to \infty} x_k = r \iff e_k \to 0 \quad (\text{quando } k \to \infty)$

#### Stima dell'Errore

In generale, non è possibile conoscere l'espressione esatta dell'errore $e_k$, ma è sufficiente provare a stimare l'errore, ovvero a trovare una maggiorazione del tipo:
$|e_k| \leq M_k$
dove $M_k$ è una costante tale che $\lim_{k \to \infty} M_k = 0$.
$M_k$ è detta **stima dell'errore**.

#### Metodi Ricorrenti

Una successione $(x_k)$ è generata da una formula ricorrente se:
*   Sono noti o assegnati uno o più valori iniziali $x_0, x_1, x_2, \ldots, x_{m-1}$.
*   Ogni valore $x_k$ (per $k \geq m$) è ottenuto a partire da uno o più dei precedenti valori.

**Metodi a 1 passo e a più passi:**
*   **A 1 passo:** $x_k$ è ottenuto a partire solo dal precedente valore $x_{k-1}$.
*   **A m passi:** $x_k$ è ottenuto a partire da $x_{k-1}, x_{k-2}, \ldots, x_{k-m}$.

### Algoritmo Iterativo per $f(x)=0$

Una formula ricorrente deve essere implementata in un **ALGORITMO ITERATIVO**.

**Requisiti:**
(A) **Approssimazione/i iniziale/i (dato di input):** Necessarie perché l'algoritmo deve essere innescato a partire da informazioni iniziali.
(B) **Criterio/i d'arresto (del processo iterativo):** Necessari perché un algoritmo deve terminare in un numero finito di passi.

#### Caratteristiche di un Algoritmo Iterativo:

1.  **Applicabilità dell'algoritmo:**
    È la possibilità di essere eseguito con i dati di input, indipendentemente dall'esito. Non deve essere confusa con la capacità del metodo di fornire una soluzione affidabile. Le condizioni di applicabilità di un algoritmo sono quelle che garantiscono che l'algoritmo fornisca uno o più output.

2.  **Convergenza del metodo:**
    Più propriamente, la convergenza è una caratteristica del metodo numerico. Il metodo si dice convergente se, eseguito senza criterio di arresto e senza errori di round-off, genera teoricamente una successione di approssimazioni che tende alla soluzione del problema.
    *   **Convergenza LOCALE:** Il metodo converge solo per alcune scelte dei dati iniziali $x_0, x_1, x_2, \ldots, x_{m-1}$ (eventualmente in una certa regione).
    *   **Convergenza GLOBALE:** Il metodo converge, sotto certe ipotesi, indipendentemente dai dati iniziali $x_0, x_1, x_2, \ldots, x_{m-1}$.

3.  **Rapidità di convergenza del metodo:**
    In caso di convergenza, con quale velocità l'errore del metodo tende a 0?
    La rapidità, o velocità di convergenza, di un metodo si vede osservando l'andamento dell'errore $e_{k+1}$ a 0. La misura di tale velocità viene fatta confrontando l'errore $e_{k+1}$ al passo $k+1$ con l'errore $e_k$ al passo $k$.

    **Metodo Convergente di Ordine $p$:**
    Un metodo si dice convergente di ordine $p$ se esistono due costanti positive $C$ e $p$ ($p \geq 1$) tali che da un certo indice $\bar{k}$ risulti:
    $|e_{k+1}| \leq C \cdot |e_k|^p$ per $k = \bar{k}, \bar{k}+1, \bar{k}+2, \ldots$
    *   $p=1$: convergenza **LINEARE**
    *   $p>1$: convergenza **SUPERLINEARE**
    *   $p=2$: convergenza **QUADRATICA**

#### Metodi discussi in questo corso:

*   **(I) METODO DI BISEZIONE:** globale, convergente di ordine 1.
*   **(II) METODO DI NEWTON:** locale, convergente di ordine 2.
*   **(III) METODO DELLE SECANTI:** locale, convergente di ordine 1.618.
*   **(IV) METODO IBRIDO (I) + (II):** globale, convergente di ordine tra 1 e 2.
*   **(V) METODO IBRIDO (I) + (III):** globale, convergente di ordine tra 1 e 1.618.

---

## METODO DI BISEZIONE

**Input:**
*   $f(x)$: funzione
*   $[a,b]$: intervallo iniziale di ricerca della radice
*   ...: ulteriori parametri necessari per i criteri di arresto

**Output:**
*   $x_k$: approssimazione della radice

**Premessa: Teorema degli Zeri (TdZ)**
Se $f$ è una funzione continua in $[a,b]$ e cambia segno agli estremi, cioè $f(a)f(b) < 0$, allora $f$ ammette almeno uno zero in $]a,b[$.

**Idea Generale:**
1.  **Approssimazione corrente:** Al generico passo $k$, cerchiamo la soluzione in un intervallo $[a_k, b_k]$ e usiamo come approssimazione $x_k$ il suo punto medio:
    $m_k = (a_k + b_k) / 2$
    L'approssimazione $x_k$ è posta uguale a $m_k$.

2.  **Criterio di scelta del nuovo intervallo di ricerca:**
    Valutiamo la funzione in $m_k$.
    *   Se $f(a_k)f(m_k) \leq 0$: il nuovo intervallo di ricerca sarà $[a_{k+1}, b_{k+1}] = [a_k, m_k]$ (la radice si trova nella metà sinistra).
    *   Altrimenti (se $f(a_k)f(m_k) > 0$): il nuovo intervallo di ricerca sarà $[a_{k+1}, b_{k+1}] = [m_k, b_k]$ (la radice si trova nella metà destra).

In ogni caso, l'ampiezza dell'intervallo di ricerca della radice viene dimezzata ad ogni passo.

**Pseudo-algoritmo del Metodo di Bisezione:**

```
[a_0, b_0] = [a, b]  // Inizializza l'intervallo
per k = 0, 1, 2, ..., N (o fino al criterio di arresto)
    m_k = (a_k + b_k) / 2
    se f(a_k) * f(m_k) <= 0
        [a_{k+1}, b_{k+1}] = [a_k, m_k]
    altrimenti
        [a_{k+1}, b_{k+1}] = [m_k, b_k]
fine
x_k = m_k  // L'ultima approssimazione è il punto medio dell'ultimo intervallo
```

#### Caratteristiche del Metodo di Bisezione:

*   **Requisiti per l'applicabilità:**
    *   $[a,b]$ deve essere noto.
    *   $f(x)$ deve essere valutabile in $[a,b]$.
*   **Requisiti per la convergenza (sufficienti ma non necessari):**
    *   $f(x)$ è una funzione continua in $[a,b]$.
    *   $f(x)$ cambia segno in $[a,b]$ (ovvero $f(a)f(b) < 0$).

#### Stima dell'Errore:

L'errore $e_k = x_k - r$ al passo $k$ è maggiorato dalla metà dell'ampiezza dell'intervallo corrente $[a_k, b_k]$:
$|e_k| = |x_k - r| \leq \frac{b_k - a_k}{2} = M_k$

Poiché l'ampiezza dell'intervallo viene dimezzata ad ogni passo:
$M_k = \frac{1}{2} M_{k-1} = \frac{1}{4} M_{k-2} = \ldots = \left(\frac{1}{2}\right)^k M_0 = \left(\frac{1}{2}\right)^k \frac{b_0 - a_0}{2}$
Quindi, l'errore al passo $k$ è maggiorato dall'ampiezza dell'intervallo iniziale $(b-a)$ divisa per $2^{k+1}$:
$|e_{k+1}| \leq \left(\frac{1}{2}\right)^{k+1} (b-a)$

#### Convergenza e Ordine di Convergenza:

Se $f$ è continua e cambia segno agli estremi di $[a,b]$, allora ammette la radice $r$. In queste ipotesi, la stima dell'errore mostra che:
$|e_{k+1}| \leq \left(\frac{1}{2}\right)^{k+1} (b-a) \to 0$ quando $k \to \infty$.
Da cui segue che l'errore tende a zero e dunque **il metodo di bisezione è convergente**.

L'ordine di convergenza si ottiene confrontando l'errore attuale con quello precedente:
$|e_{k+1}| \leq \frac{1}{2} |e_k|$
Questo corrisponde alla definizione di convergenza lineare ($p=1$) con $C=1/2$.
**Il metodo di bisezione è convergente di ordine 1 (lineare).**

#### Osservazioni sul Metodo di Bisezione:

*   **Converge sempre:** Indipendentemente dall'approssimazione iniziale (purché le condizioni di continuità e cambio di segno siano rispettate). È un **metodo globale**.
*   **Convergenza lineare:** È una convergenza lenta.
*   Si "guadagna" **un bit corretto** a ogni passo (l'errore al passo precedente viene moltiplicato per $1/2$).
*   Sono necessari circa "3 o 4" passi per "guadagnare" una cifra in base 10 corretta (dato che $10^{-1} \approx 2^{-3.3}$).

#### Criteri di Arresto per il Metodo di Bisezione:

È possibile fermare la procedura iterativa quando la stima dell'errore di approssimazione $M_k$ è minore di una accuratezza prefissata $\Delta$:
$M_k = \left(\frac{1}{2}\right)^{k+1} (b-a) \leq \Delta$
La precedente maggiorazione permette di determinare il valore minimo di $k$ per cui è verificata:
$k = \lceil \log_2\left(\frac{b-a}{\Delta}\right) - 1 \rceil$

**Complessità di Tempo (Metodo di Bisezione):**
La dimensione computazionale del problema è il rapporto tra l'incertezza iniziale e l'accuratezza richiesta: $\frac{b-a}{\Delta}$.
Nell'analisi della complessità di tempo di un algoritmo per $f(x)=0$, l'operazione dominante è la valutazione della funzione $f$.
Il numero di valutazioni di funzione $T$ è:
$T = \left\lceil \log_2\left(\frac{b-a}{\Delta}\right) - 1 \right\rceil$ (valutazioni di $f$)

#### Pseudo-algoritmo con Criterio di Arresto:

```
[a_0, b_0] = [a, b]
k = 0
mentre ((b_k - a_k) / 2 > Δ)   // Δ è la tolleranza prefissata
    m_k = (a_k + b_k) / 2
    se f(a_k) * f(m_k) <= 0
        [a_{k+1}, b_{k+1}] = [a_k, m_k]
    altrimenti
        [a_{k+1}, b_{k+1}] = [m_k, b_k]
    k = k + 1
fine
x_k = m_k
```

#### Possibili Criteri di Arresto (implementazioni MATLAB):

La condizione `abs(bk-ak) > delta_ass + eps*max(abs(ak),abs(bk))` è una combinazione di criteri:
1.  **Criterio basato sull'errore assoluto:** `abs(bk-ak) > delta_ass`
2.  **Criterio basato sull'errore relativo:** `abs(bk-ak)/max(abs(ak),abs(bk)) > delta_rel` (questo si ottiene dividendo per `max(abs(ak),abs(bk))`).
3.  **`eps*max(abs(ak),abs(bk))`**: Rappresenta la massima spaziatura relativa tra due numeri in virgola mobile consecutivi. Se `delta_ass = 0` (o `delta_rel = 0`), l'iterazione si arresta quando $a_k$ e $b_k$ sono (all'incirca) due numeri in virgola mobile consecutivi, ottenendo la massima accuratezza.

**Criterio di arresto basato sul residuo (assoluto):**
`abs(funzione(pmediok)) > delta_ass`
Il **residuo** è la misura di quanto una soluzione approssimata soddisfa il problema. Per $f(x)=0$, il residuo è $|f(x_k)|$.
Questo criterio è utile, ma un piccolo residuo non implica necessariamente un piccolo errore sulla radice, specialmente per problemi mal condizionati.

---

## METODO DI NEWTON

Il Metodo di Newton usa i valori di $f(x)$ e i valori di $f'(x)$.

**Derivazione Grafica:**
Data un'approssimazione $x_k$, si costruisce la retta tangente al grafico di $f(x)$ nel punto $(x_k, f(x_k))$. La prossima approssimazione $x_{k+1}$ è data dall'intersezione di questa retta tangente con l'asse x.

La pendenza della retta tangente in $x_k$ è $f'(x_k)$. Utilizzando la geometria del triangolo rettangolo formato dalla tangente, dal punto $(x_k, f(x_k))$ e dall'asse x, si ha:
$f'(x_k) = \frac{f(x_k)}{x_k - x_{k+1}}$
Risolvendo per $x_{k+1}$:
$x_{k+1} = x_k - \frac{f(x_k)}{f'(x_k)}$

**Generica Iterazione del Metodo:**
$x_{k+1} = x_k - \frac{f(x_k)}{f'(x_k)}$
Definendo la **correzione** $c_k = - \frac{f(x_k)}{f'(x_k)}$, l'iterazione diventa:
$x_{k+1} = x_k + c_k$

#### Requisiti per l'Applicabilità:

*   $f(x)$ e $f'(x)$ devono essere note.
*   $x_0$ (approssimazione iniziale) deve essere noto.

#### Criterio di Arresto:

Ad ogni iterazione, si calcola la correzione $c_k$. Se $x_k$ converge a $r$, allora la correzione $c_k$ diventa via via sempre più piccola (formalmente, la successione delle approssimazioni è di Cauchy).
Si ferma l'algoritmo quando la correzione è minore di una accuratezza prefissata $\Delta$:
$|x_{k+1} - x_k| \leq \Delta \quad \implies \quad \left|-\frac{f(x_k)}{f'(x_k)}\right| \leq \Delta$

#### Interpretazione del Metodo di Newton (come risoluzione di problemi lineari):

Al passo $k$, il metodo di Newton:
1.  Approssima localmente la funzione $f(x)$ con una retta $t(x)$. Questa retta è lo sviluppo di Taylor al primo ordine di $f(x)$ intorno a $x_k$:
    $y = t(x) = f(x_k) + f'(x_k)(x - x_k)$
2.  Risolve il problema (facile) $t(x)=0$:
    $0 = f(x_k) + f'(x_k)(x - x_k)$
3.  Considera la soluzione di $t(x)=0$ come la nuova approssimazione ($x_{k+1}$) della soluzione di $f(x)=0$.

#### Pericoli del Metodo di Newton:

**Il metodo di Newton non converge sempre, è un metodo locale.**
Un pericolo si presenta se la derivata $f'(x_k)$ è piccola (vicino a uno zero di $f'(x)$ o a un punto di minimo/massimo locale). In questo caso, la correzione $c_k = -f(x_k)/f'(x_k)$ diventa molto grande, e $x_{k+1}$ può essere molto lontano da $x_k$, portando a divergenza o convergenza ad un'altra radice.

#### Teorema di Convergenza (Condizioni sufficienti):

Se in un intervallo $[a,b]$:
*   $f'(x) \neq 0$
*   $f''(x)$ non cambia segno (cioè $f$ è convessa o concava)
*   $f(a)f(b) < 0$
*   E le tangenti agli estremi "puntano" verso l'interno dell'intervallo:
    $|f(a)/f'(a)| < b-a$
    $|f(b)/f'(b)| < b-a$
Allora il metodo di Newton converge per qualsiasi scelta di $x_0 \in [a,b]$.

#### PRO e CONTRO del Metodo di Newton:

**CONTRO:**
*   Non converge sempre (è un metodo locale).

**PRO:**
*   Si dimostra che ha rapidità di convergenza **quadratica** (`p=2`) per zeri non multipli:
    $|e_{k+1}| \leq C \cdot |e_k|^2$
*   È molto più efficiente del metodo di bisezione.

#### Complessità di Tempo:

$T(f, f', \Delta)$ = numero di passi * numero di valutazioni di funzione per passo.
Poiché non è noto se il metodo converge (e da dove), non è possibile stabilire a priori la complessità di tempo. Il numero di iterazioni dipende fortemente dalla scelta di $x_0$.

---