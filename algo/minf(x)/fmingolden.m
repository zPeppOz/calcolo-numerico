function xmin = fmingolden(f, a, b, tol)
% fmingolden cerca il minimo di una funzione unimodale f nell'intervallo [a, b]
% usando la tecnica della Golden Section Search (sezione aurea).
%
% Input:
%   f   - funzione anonima o handle alla funzione da minimizzare
%   a   - estremo sinistro dell'intervallo iniziale
%   b   - estremo destro dell'intervallo iniziale
%   tol - tolleranza, ovvero quando (b - a) < tol l'algoritmo si ferma
%
% Output:
%   xmin - stima del punto in cui f raggiunge il minimo locale
%
% Inizialmente vengono definiti i due punti interni c e d basati sul fattore
% della sezione aurea. Il fattore gr è calcolato come:
%
%         gr = (sqrt(5)-1)/2 ≈ 0.618
%
% In ciascuna iterazione, si confrontano i valori f(c) e f(d):
%   - Se f(c) < f(d), il minimo è nell'intervallo [a, d] e quindi si aggiorna b = d.
%   - Altrimenti il minimo è nell'intervallo [c, b] e quindi si aggiorna a = c.
%
% Ad ogni aggiornamento, uno dei punti interni viene riciclato (diventa il nuovo
% punto d o c) risparmiando una valutazione della funzione.
%
% L'algoritmo si arresta quando la lunghezza dell'intervallo diventa inferiore a tol.

% Fattore della sezione aurea
gr = (sqrt(5)-1)/2;

% Calcolo dei due punti interni iniziali
c = b - gr * (b - a);
d = a + gr * (b - a);

% Valutazione iniziale della funzione nei due punti
fc = f(c);
fd = f(d);

% Iterazione finché l'intervallo è più lungo della tolleranza
while (b - a) > tol
    if fc < fd
        % Il minimo si trova in [a, d]
        b = d;
        % Riciclo: il vecchio c diventa il nuovo d
        d = c;
        fd = fc;
        % Calcolo un nuovo punto c nell'intervallo aggiornato
        c = b - gr * (b - a);
        fc = f(c);
    else
        % Il minimo si trova in [c, b]
        a = c;
        % Riciclo: il vecchio d diventa il nuovo c
        c = d;
        fc = fd;
        % Calcolo un nuovo punto d nell'intervallo aggiornato
        d = a + gr * (b - a);
        fd = f(d);
    end
end

% Restituisco il punto medio dell'intervallo finale come stima del minimo
xmin = (a + b) / 2;
end
