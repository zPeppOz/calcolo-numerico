# Interpolazione dei dati

## 1 Il problema di interpolazione

- **Obiettivo**: trovare una funzione $f$ che passi esattamente per i $m$ punti dati $(x_i,\,y_i)$ (nodi e valori). Questo equivale a soddisfare le $m$ condizioni di **Lagrange** $f(x_i)=y_i$ .
- Si sceglie un insieme infinito $F$ (il **modello**) da cui estrarre $f$: polinomi, polinomi trigonometrici, polinomi a tratti, ecc.

---

## 2 Modello lineare e sistema lineare

Ogni funzione di $F$ si rappresenta come combinazione lineare di funzioni note $b_j(x)$:

$$
f(x)=\sum_{j=1}^{n} a_j\,b_j(x)
$$

Con questa forma le condizioni di Lagrange diventano un **sistema lineare** $B\,a = y$, in cui:

- $B_{ij}=b_j(x_i)$ (matrice “base”)
- $a=[a_1,\dots,a_n]^T$ sono le incognite
- $y=[y_1,\dots,y_m]^T$ i termini noti

**Soluzione unica** ⇔ numero di equazioni = numero di incognite ⇒ serve $m=n$ e $B$ non singolare .

---

## 3 Interpolazione polinomiale di Lagrange

### 3.1 Teorema di unicità

Per $n$ punti con ascisse distinte esiste **un solo** polinomio di grado ≤ $n-1$ che li interpola .

### 3.2 Risoluzione pratica

Con i nodi nei vettori `x`, `y`:

```matlab
a = polyfit(x, y, length(x)-1);   % coefficienti del polinomio
ypol = polyval(a, xx);            % valutazione su griglia xx
```

### 3.3 Scelta dei nodi e fenomeno di Runge

Con nodi equispaziati l’interpolante di alto grado può oscillare fortemente vicino ai bordi (funzione di Runge) .
Rimedio comune: usare **nodi di Chebyshev**

```matlab
function xc = NodiCheb(a,b,m)
m1 = m-1; k = 0:m1;
xc = (a+b)/2 - 0.5*(b-a)*cos(pi*k/m1);
end
```

---

## 4 Interpolazione di Hermite

| Caratteristica | Valore                                     |
| -------------- | ------------------------------------------ |
| Dati           | $(x_i, y_i)$ **e** pendenze $d_i=f'(x_i)$  |
| Equazioni      | $2m$ lineari: $f(x_i)=y_i$ e $f'(x_i)=d_i$ |
| Grado minimo   | ≤ $2m-1$                                   |
| Unicità        | garantita se la matrice è non singolare    |

Esempio MATLAB (costruzione esplicita della matrice `B`) mostrato in .

---

## 5 Polinomi a tratti e spline

### 5.1 Polinomio a tratti

Funzione definita cella-per-cella su intervallo $[a,b]$ diviso da **breakpoints**; il grado di regolarità dipende da come si “incollano” i pezzi .

### 5.2 Spline lineare

- $m-1$ segmenti di primo grado
- Continuità della funzione; unicità assicurata (2 $m$−2 incognite ↔ condizioni) .

### 5.3 Spline cubica classica

- $m-1$ polinomi di terzo grado
- Continuità di funzione, derivata prima **e** seconda ai breakpoints
- Servono due condizioni addizionali (es. “spline naturale”: $s''(x_1)=s''(x_m)=0$; MATLAB usa le “not-a-knot”) .

### 5.4 Cubiche di Hermite (PCHIP)

- Stessa struttura della spline cubica ma si impongono solo continuità e pendenza assegnata ⇒ grafico **shape-preserving**, niente oscillazioni tra i nodi .

### 5.5 Comandi essenziali

| Scopo             | Comando MATLAB           |
| ----------------- | ------------------------ |
| Spline cubica     | `ys = spline(x, y, xx);` |
| Cubica di Hermite | `yp = pchip(x, y, xx);`  |

---

## 6 Interpolazione di curve parametriche

Quando i punti appartengono a una curva non-funzionale, si introduce un parametro $t$.

- Scelta semplice: **parametro ordinale** $t=i$
- Più accurato: $t$ proporzionale alla lunghezza della spezzata cumulata

La curva $(x(t),y(t))$ si ottiene risolvendo **due** problemi di Lagrange (uno per le ascisse, uno per le ordinate) e valutando le spline cubiche sui valori di $t$ .

---

## 7 Procedura riassuntiva

1. **Definisci** il modello $F$ adatto (polinomi, spline, …).
2. **Verifica** che il numero dei coefficienti da stimare eguagli il numero di condizioni (interpolazione esatta).
3. **Costruisci** il sistema lineare $B\,a=y$ o usa funzioni MATLAB (`polyfit`, `spline`, `pchip`).
4. **Risolvi** per i coefficienti $a$ (o lascia che MATLAB lo faccia).
5. **Valuta** l’interpolante dove serve e controlla eventuali problematiche (oscillazioni, scelta nodi).

Con queste linee guida puoi redigere, copiare e adattare facilmente un file `.md` senza ambiguità.
