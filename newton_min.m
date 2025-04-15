addpath('algo/f(x)=0/')
% Metodo di Newton per la ricerca del minimo
% Applicabile solo a funzioni con derivata prima continua e derivata seconda
% Il metodo è un algoritmo iterativo locale a velocità di convergenza quadratica
% L'algoritmo può essere visto come la risoluzione di una successione di problemi
% di ricerca di minimo di funzioni quadratiche.
% Ad ogni iterazione si calcola il punto di massimo della funzione quadratica
% che approssima la funzione f in x0, e si usa questo punto come nuovo punto di partenza.
% La funzione restituisce il minimo trovato.

f = @(x) -exp(-x) .* sin(2*x-pi/2);
% La funzione è definita in R+ e ha un massimo in x=0.5 e un minimo in x=2.5
syms x; % variabile simbolica
fx = f(x); % definizione della funzione simbolica
df = diff(fx);
df2 = diff(df); % calcolo della derivata seconda

% Conversione delle espressioni simboliche in funzioni anonime
df_func = matlabFunction(df);
df2_func = matlabFunction(df2);

x0 = -2.5; % punto iniziale
delta = 1e-6; % tolleranza
max_iter = 100; % numero massimo di iterazioni

% Poiché stiamo cercando un minimo, la funzione su cui applicare Newton è la derivata prima
% La derivata di df_func è df2_func
xminimo = newton(df_func, x0, df2_func, delta, max_iter);
fprintf('Il minimo trovato è: %.6f\n', xminimo); % stampa del risultato



hold on
x = linspace(-2, 6, 100); % intervallo di x
y = f(x); % calcolo i valori di y
plot(x, y, 'b-'); % grafico della funzione
plot(xminimo, f(xminimo), 'ro'); % punto del minimo
plot(x, df_func(x), 'r--'); % grafico della derivata prima
plot(x, df2_func(x), 'g--'); % grafico della derivata seconda

xlabel('x'); % etichetta asse x
ylabel('f(x)'); % etichetta asse y
grid on; % griglia
title('Metodo di Newton per la ricerca del minimo'); % titolo del grafico