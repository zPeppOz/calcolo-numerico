# Appunti sul Metodo di Bisezione

Il **metodo di bisezione** è uno degli algoritmi più semplici e robusti per trovare le radici di una funzione continua $f(x)$. Di seguito sono riportati i principali aspetti teorici, la velocità di convergenza, alcuni esempi pratici, una rappresentazione geometrica e un esempio di codice MATLAB.

## 1. Principio del Metodo

Il metodo si basa sul teorema degli zeri di una funzione continua: se $f(a) \cdot f(b) < 0$, allora esiste almeno un punto $c \in (a,b)$ tale che $f(c) = 0$. Ad ogni iterazione, l'intervallo viene dimezzato:

1. Si calcola il punto medio $c = \frac{a+b}{2}$
2. Si valuta $f(c)$
3. Se $f(c) \approx 0$ (entro una tolleranza $\delta$), $c$ è la radice cercata
4. Altrimenti, si determina il nuovo intervallo:
   - Se $f(a) \cdot f(c) < 0$, la radice è in $[a,c]$
   - Se $f(c) \cdot f(b) < 0$, la radice è in $[c,b]$

## 2. Velocità di Convergenza

- **Convergenza Lineare:**  
  La convergenza del metodo di bisezione è **lineare**. Ad ogni iterazione, l'intervallo contenente la radice si dimezza, quindi l'errore massimo $e_n = |b_n - a_n|$ dopo $n$ iterazioni è:

  $$
  e_n = \frac{b_0 - a_0}{2^n}
  $$

  dove $[a_0, b_0]$ è l'intervallo iniziale.

- **Numero di Iterazioni:**  
  Per raggiungere una precisione $\delta$, il numero di iterazioni necessarie è:

  $$
  n \approx \left\lceil \log_2 \frac{b_0 - a_0}{\delta} \right\rceil
  $$

- **Vantaggi e Svantaggi:**  
  Il metodo è semplice e garantisce la convergenza, ma è generalmente più lento rispetto ad altri metodi come Newton. È particolarmente utile quando la derivata della funzione è difficile da calcolare o quando altri metodi potrebbero fallire.

## 3. Esempi Pratici

### Esempio 1: $x^2 - 2 = 0$

- **Funzione:** $f(x) = x^2 - 2$
- **Intervallo iniziale:** $[1, 2]$ (poiché $f(1) = -1 < 0$ e $f(2) = 2 > 0$)
- **Iterazioni:**

  1. $c_1 = \frac{1+2}{2} = 1.5$, $f(c_1) = 0.25 > 0$, nuovo intervallo $[1, 1.5]$
  2. $c_2 = \frac{1+1.5}{2} = 1.25$, $f(c_2) = -0.4375 < 0$, nuovo intervallo $[1.25, 1.5]$
  3. $c_3 = \frac{1.25+1.5}{2} = 1.375$, $f(c_3) = -0.109375 < 0$, nuovo intervallo $[1.375, 1.5]$
  4. e così via...

- La soluzione converge a $\sqrt{2} \approx 1.4142$.

### Esempio 2: $\cos(x) - x = 0$

- **Funzione:** $f(x) = \cos(x) - x$
- **Intervallo iniziale:** $[0, 1]$ (poiché $f(0) = 1 > 0$ e $f(1) = \cos(1) - 1 \approx -0.46 < 0$)
- **Iterazioni:**

  1. $c_1 = \frac{0+1}{2} = 0.5$, $f(c_1) = \cos(0.5) - 0.5 \approx 0.38 > 0$, nuovo intervallo $[0.5, 1]$
  2. $c_2 = \frac{0.5+1}{2} = 0.75$, $f(c_2) = \cos(0.75) - 0.75 \approx -0.07 < 0$, nuovo intervallo $[0.5, 0.75]$
  3. e così via...

- La soluzione converge a $x^* \approx 0.739$.

## 4. Rappresentazione Geometrica

Il metodo di bisezione può essere visualizzato graficamente come segue:

```plaintext
  f(x)
   |
   |
   |     +------------+ f(b) > 0
   |    /|            |
   |   / |            |
   |  /  |            |
   | /   |            |
   |/    |            |
---+-----+------------+--- x
   |     |            |
   |     |            |
   |     +------------+ f(a) < 0
   |     a      c     b
```

Ad ogni iterazione, il punto medio $c$ divide l'intervallo $[a,b]$ in due parti uguali. Si sceglie il sottointervallo in cui la funzione cambia segno, garantendo che contenga almeno una radice.

## 5. Implementazione in MATLAB

L'implementazione del metodo di bisezione in MATLAB è relativamente semplice:

```matlab
function radice = bisezione(f, a, b, delta, max_iter)
    if f(a)*f(b) > 0
        error('La funzione deve avere segno opposto agli estremi dell''intervallo [a,b]');
    end

    for i = 1:max_iter
        % Calcolo il punto medio
        pmedio = (a + b) / 2;
        % Calcolo il valore della funzione in pmedio
        fpmedio = f(pmedio);

        % Verifico se ho trovato la radice
        if abs(fpmedio) < delta
            radice = pmedio;
            fprintf('Radice trovata in %.6f dopo %d iterazioni\n', radice, i);
            return
        end

        % Calcolo il nuovo intervallo
        if f(a) * fpmedio < 0
            b = pmedio;
        else
            a = pmedio;
        end

        % Controllo la dimensione dell'intervallo
        if abs(b - a) < delta
            radice = (a + b) / 2;
            fprintf('Radice trovata in %.6f dopo %d iterazioni\n', radice, i);
            return
        end
    end

    radice = (a + b) / 2;
    fprintf('Massimo numero di iterazioni raggiunto, radice approssimata in %.6f\n', radice);
end
```
