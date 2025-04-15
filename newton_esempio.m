addpath('algo')
% definiamo la funzione e calcoliamo la derivata

f = @(x) sin(3*x) ./(1+log(x.^2).^2); % definizione della funzione
syms x;
fx = f(x) % definizione della funzione simbolica
df = diff(fx) % calcolo della derivata
df = matlabFunction(df); % conversione della derivata in funzione anonima
x0 = 1; % punto iniziale
delta = 1e-6; % tolleranza

radice = newton(f, x0, df, delta, 100); % chiamata alla funzione di Newton
fprintf('Radice trovata: %.6f\n', radice); % stampa della radice trovata

residuo = f(radice); % calcolo del residuo
format long g; % formato lungo per la stampa
residuo = double(residuo); % conversione del residuo in double
fprintf('Residuo: %.6f\n', residuo); % stampa del residuo


% plot del grafico
xvals = linspace(0, 2, 100); % intervallo di x
yvals = f(xvals); % valori della funzione
dfvals = df(xvals); % valori della derivata

figure;
hold on;
plot(xvals, yvals, 'b--', 'LineWidth', 2, 'DisplayName', 'f(x)'); % plot della funzione

plot(xvals, dfvals, 'r-', 'LineWidth', 2, 'DisplayName', 'f''(x)'); % plot della derivata

plot(radice, f(radice), 'ro' , 'MarkerSize', 10, 'DisplayName', 'Radice'); % plot della radice trovata
xlabel('x'); % etichetta asse x
ylabel('f(x)'); % etichetta asse y

title('Metodo di Newton'); % titolo del grafico

legend('show'); % mostra la legenda
grid on; % aggiunge la griglia al grafico