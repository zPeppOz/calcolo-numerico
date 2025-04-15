% Calcolo del punto minimo di una funzione usando fminbnd
% La funzione fminbnd è un algoritmo di ricerca del minimo locale di una funzione
% definita in un intervallo chiuso [a, b].
% La funzione restituisce il punto in cui la funzione assume il valore minimo.

f = @(x) -exp(-x) .* sin(2*x-pi/2); % definizione della funzione
esx = -2.5; % estremo sinistro dell'intervallo
edx = 1; % estremo destro dell'intervallo

xminimo = fminbnd(f, esx, edx, optimset('TolX', 1e-6));
fprintf('Il minimo trovato è: %.6f\n', xminimo); % stampa del risultato


hold on
x = linspace(-3, 6, 100);
y = f(x);
plot(x, y, 'b-'); % grafico della funzione
plot(xminimo, f(xminimo), 'ro'); % punto del minimo

grid on; % griglia
xlabel('x'); % etichetta asse x
legend('f(x)', 'Minimo'); % legenda
title('Ricerca del minimo con fminbnd'); % titolo del grafico
