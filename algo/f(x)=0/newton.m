function radice = newton(f, x0, df, delta, max_iter)
% NEWTON Metodo di Newton per la ricerca di radici
%   radice = NEWTON(f, x0, df, delta, max_iter) calcola la radice della
%   funzione f a partire da un punto iniziale x0, utilizzando la derivata df.
%   Il metodo termina quando il valore assoluto della funzione è minore di
%   delta o quando il numero massimo di iterazioni max_iter è raggiunto.
%   La funzione restituisce la radice trovata.
%

x_corrente = x0; % inizializzo la variabile x_corrente con il valore iniziale
for i = 1:max_iter
    fx = f(x_corrente);
    dfx = df(x_corrente);
    if abs(dfx) < delta + eps(abs(x_corrente)) % controllo se il valore assoluto della funzione è minore di delta
        error('La derivata è troppo piccola, il metodo di Newton non converge');
    end
    x_nuovo = x_corrente - fx / dfx; % calcolo il nuovo punto
    if abs(x_nuovo - x_corrente) < delta + eps(abs(x_corrente))
        radice = x_nuovo;
        fprintf('Radice trovata in %.6f dopo %d iterazioni\n', radice, i);
        return
    end
    x_corrente = x_nuovo; % aggiorno il valore corrente
end
radice = x_corrente; % se non ho trovato la radice, restituisco l'ultima x_corrente
fprintf('Massimo numero di iterazioni raggiunto, radice approssimata in %.6f\n', radice);
end