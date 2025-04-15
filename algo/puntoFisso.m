function p = puntoFisso(g, x0, tol, max_iter)
% puntoFisso Risolve il problema del punto fisso: trova p tale che p = g(p)
%
%   p = puntoFisso(g, x0, tol, max_iter)
%
% Input:
%   g        - handle della funzione per la quale cercare il punto fisso, ovvero
%              la funzione g(x) definita come @(x) ...
%   x0       - approssimazione iniziale
%   tol      - tolleranza richiesta per la convergenza (ad es. 1e-6)
%   max_iter - numero massimo di iterazioni consentite
%
% Output:
%   p        - approssimazione del punto fisso, tale che p ≈ g(p)
%
% Esempio di utilizzo 1:
%   g = @(x) cos(x);
%   p = puntoFisso(g, 1, 1e-6, 100)
%   % Dovrebbe convergere al punto fisso di cos(x), che è circa 0.739085.
%
% Esempio di utilizzo 2:
%   g = @(x) 0.5*(x + 3./x);  % Punto fisso relativo al calcolo della radice quadrata di 3
%   p = puntoFisso(g, 2, 1e-6, 100)
%   % p dovrebbe approssimare sqrt(3).

p = x0;  % Inizializza la soluzione con l'approssimazione iniziale
for k = 1:max_iter
    x_new = g(p);
    % Se la variazione è inferiore alla tolleranza, abbiamo convergenza
    if abs(x_new - p) < tol
        fprintf('Convergenza raggiunta dopo %d iterazioni.\n', k);
        p = x_new;
        return;
    end
    p = x_new;
end
warning('Numero massimo di iterazioni raggiunto senza convergenza.');
fprintf('Ultimo valore calcolato: %.6f\n', p);
end
