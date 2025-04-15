function radice = secanti(f, x0, x1, delta, max_iter)
% f, x0, x1, delta, max_iter, f(x0), f(x1)
format long g;
x_corrente = x0; % inizializzo la variabile x_corrente con il valore iniziale
x_precedente = x1; % inizializzo la variabile x_precedente con il secondo valore iniziale
for i = 1:max_iter
    fx_corrente = f(x_corrente); % calcolo il valore della funzione nel punto corrente
    fx_precedente = f(x_precedente); % calcolo il valore della funzione nel punto precedente
    if abs(fx_corrente) < eps % controllo se il valore assoluto della funzione è minore di delta
        error('La funzione è troppo piccola, il metodo delle secanti non converge');
    end
    x_nuovo = x_corrente - fx_corrente * (x_corrente - x_precedente) / (fx_corrente - fx_precedente); % calcolo il nuovo punto
    if abs(x_nuovo - x_corrente) < delta
        radice = x_nuovo;
        fprintf('Radice trovata in %.6f dopo %d iterazioni\n', radice, i);
        return
    end
    x_precedente = x_corrente; % aggiorno il valore precedente
    x_corrente = x_nuovo; % aggiorno il valore corrente
end
radice = x_corrente; % se non ho trovato la radice, restituisco l'ultima x_corrente
fprintf('Massimo numero di iterazioni raggiunto, radice approssimata in %.6f\n', radice);
end
