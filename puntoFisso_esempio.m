addpath('algo')
g = @(x) 0.5*(x + 3./x); % funzione g(x) per il punto fisso
x0 = 3; % punto iniziale
tol = 1e-6; % tolleranza
max_iter = 100; % numero massimo di iterazioni

p = puntoFisso(g, x0, tol, max_iter); % chiamata alla funzione puntoFisso
fprintf('Punto fisso trovato: %.6f\n', p); % stampa del risultato

% Verifica della convergenza
if abs(g(p) - p) < tol
    fprintf('La funzione converge al punto fisso: %.6f\n', p);
else
    fprintf('La funzione non converge al punto fisso.\n');
end