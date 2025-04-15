addpath('algo')
f = @(x) sin(3*x) ./(1+log(x.^2).^2); % definizione della funzione
% scegliamo le stime iniziali
x0 = 0.7;
x1 = 1; % stime iniziali
delta = 1e-6; % tolleranza
max_iter = 100; % numero massimo di iterazioni

% calcoliamo la radice con il metodo delle secanti
radice = secanti(f, x0, x1, delta, max_iter); % chiamata alla funzione del metodo delle secanti
fprintf('Radice trovata: %.6f\n', radice); % stampa della radice trovata

% calcoliamo il residuo
residuo = f(radice); % calcolo del residuo
format long g; % formato lungo per la stampa
residuo = double(residuo); % conversione del residuo in double
fprintf('Residuo: %.6f\n', residuo); % stampa del residuo

% plot del grafico
figure;
x_val = linspace(0, 2, 100);
f_val = f(x_val);

plot(x_val, f_val, 'b-', 'LineWidth', 2, 'DisplayName', 'f(x)'); % plot della funzione
hold on;

plot(radice, f(radice), 'ro' , 'MarkerSize', 10, 'DisplayName', 'Radice'); % plot della radice trovata
xlabel('x'); % etichetta asse x
ylabel('f(x)'); % etichetta asse y

legend('show'); % mostra la legenda
title('Metodo delle Secanti'); % titolo del grafico

grid on; % aggiunge la griglia al grafico
