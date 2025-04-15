% importa la funzione di bisezione
addpath('algo'); % aggiunge il percorso della funzione di bisezione
f = @(x) sin(3*x) ./(1+log(x.^2).^2); % definizione della funzione
a = 0.5; % estremi dell'intervallo
b = 1.5; % estremi dell'intervallo
delta = 1e-6; % tolleranza
maxIter = 100; % numero massimo di iterazioni

radice = bisezione(f, a, b, delta, maxIter); % chiamata alla funzione di bisezione
fprintf('Radice trovata: %.6f\n', radice); % stampa della radice trovata
residuo = f(radice); % calcolo del residuo
fprintf('Residuo: %.6f\n', residuo); % stampa del residuo

% Plot della funzione e della radice trovata
x = linspace(a, b, 100); % intervallo di x
y = f(x); % valori della funzione

figure; % creazione della figura
plot(x, y, 'b', 'LineWidth', 2); % plot della funzione
hold on; % mantiene il grafico corrente

plot(radice, f(radice), 'ro', 'MarkerSize', 10); % plot della radice trovata

xlabel('x'); % etichetta asse x
ylabel('f(x)'); % etichetta asse y

title('Bisezione'); % titolo del grafico
