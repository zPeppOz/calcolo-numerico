addpath('algo\minf(x)\')
f = @(x) -exp(-x).*sin(2*x-pi/2); % Definizione della funzione da minimizzare
a = -2.5; % Estremo sinistro dell'intervallo
b = 1; % Estremo destro dell'intervallo
delta = 1e-6; % Precisione desiderata
max_iter = 1000; % Numero massimo di iterazioni

ris = fmingolden(f, a, b, delta); % Chiamata alla funzione di ricerca del minimo
format long g; % Formato di visualizzazione dei numeri
disp(['Il minimo trovato è in x = ', num2str(ris, 16)]); % Stampa il risultato
disp(['Il valore della funzione in x = ', num2str(ris, 16), ' è f(x) = ', num2str(f(ris), 16)]); % Stampa il valore della funzione al minimo trovato

hold on;
x = linspace(a, b, 100);
y = f(x); % Valori della funzione
plot(x, y, 'b-'); % Grafico della funzione
plot(ris, f(ris), 'ro'); % Punto del minimo trovato
title('Minimo della funzione con ricerca casuale');
xlabel('x'); % Asse x

ylabel('f(x)'); % Asse y

grid on; % Griglia
legend('f(x)', 'Minimo trovato'); % Legenda del grafico
