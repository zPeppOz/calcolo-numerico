%% Esercizio 1.3: Interpolazione di Hermite
% Dati i punti (0, 1), (1, 2) con derivate f'(0) = 0.5, f'(1) = -0.3
% a) Costruire la matrice per l'interpolazione di Hermite
% b) Determinare il polinomio di grado 3 che soddisfa le condizioni
% c) Confrontare graficamente con l'interpolazione di Lagrange usando solo i valori della funzione

clear; clc; close all;

% Dati del problema
x_data = [0; 1];
y_data = [1; 2];
dy_data = [0.5; -0.3]; % Derivate nei punti

fprintf('=== ESERCIZIO 1.3: Interpolazione di Hermite ===\n\n');
fprintf('Dati:\n');
fprintf('Punto 1: (%.1f, %.1f) con f''(%.1f) = %.1f\n', x_data(1), y_data(1), x_data(1), dy_data(1));
fprintf('Punto 2: (%.1f, %.1f) con f''(%.1f) = %.1f\n', x_data(2), y_data(2), x_data(2), dy_data(2));
fprintf('\n');

%% PARTE A: Costruzione della matrice per l'interpolazione di Hermite
fprintf('PARTE A: Costruzione della matrice di Hermite\n');
fprintf('--------------------------------------------\n');

% Per l'interpolazione di Hermite con 2 punti e 2 derivate,
% cerchiamo un polinomio di grado 3: H(x) = a₀ + a₁x + a₂x² + a₃x³
% La derivata è: H'(x) = a₁ + 2a₂x + 3a₃x²

% Le condizioni sono:
% H(0) = 1   ->  a₀ = 1
% H(1) = 2   ->  a₀ + a₁ + a₂ + a₃ = 2
% H'(0) = 0.5 -> a₁ = 0.5
% H'(1) = -0.3 -> a₁ + 2a₂ + 3a₃ = -0.3

% Matrice del sistema: [valori della funzione, valori delle derivate]
A_hermite = [1, 0, 0, 0;      % H(0) = a₀
             1, 1, 1, 1;      % H(1) = a₀ + a₁ + a₂ + a₃
             0, 1, 0, 0;      % H'(0) = a₁
             0, 1, 2, 3];     % H'(1) = a₁ + 2a₂ + 3a₃

% Termine noto: [valori funzione, valori derivate]
b_hermite = [y_data(1);    % H(0) = 1
             y_data(2);    % H(1) = 2
             dy_data(1);   % H'(0) = 0.5
             dy_data(2)];  % H'(1) = -0.3

fprintf('Matrice del sistema di Hermite:\n');
fprintf('A = [valori funzione; valori derivate]\n');
disp(A_hermite);

fprintf('Termine noto:\n');
fprintf('b = [y₀; y₁; f''(x₀); f''(x₁)]ᵀ\n');
disp(b_hermite);

%% PARTE B: Calcolo dei coefficienti del polinomio di Hermite
fprintf('PARTE B: Calcolo dei coefficienti del polinomio di Hermite\n');
fprintf('---------------------------------------------------------\n');

% Risoluzione del sistema lineare A * coeff = b
coeff_hermite = A_hermite \ b_hermite;

fprintf('Coefficienti del polinomio di Hermite H(x) = a₀ + a₁x + a₂x² + a₃x³:\n');
fprintf('a₀ = %.6f\n', coeff_hermite(1));
fprintf('a₁ = %.6f\n', coeff_hermite(2));
fprintf('a₂ = %.6f\n', coeff_hermite(3));
fprintf('a₃ = %.6f\n', coeff_hermite(4));

fprintf('\nPolinomio di Hermite:\n');
fprintf('H(x) = %.6f + %.6fx + %.6fx² + %.6fx³\n', ...
    coeff_hermite(1), coeff_hermite(2), coeff_hermite(3), coeff_hermite(4));

% Verifica delle condizioni
fprintf('\n--- Verifica delle condizioni ---\n');
for i = 1:length(x_data)
    x_val = x_data(i);
    % Valutazione del polinomio
    H_val = coeff_hermite(1) + coeff_hermite(2)*x_val + ...
            coeff_hermite(3)*x_val^2 + coeff_hermite(4)*x_val^3;
    % Valutazione della derivata
    H_deriv = coeff_hermite(2) + 2*coeff_hermite(3)*x_val + 3*coeff_hermite(4)*x_val^2;
    
    fprintf('H(%.1f) = %.6f (richiesto: %.1f, errore: %.2e)\n', ...
        x_val, H_val, y_data(i), abs(H_val - y_data(i)));
    fprintf('H''(%.1f) = %.6f (richiesto: %.1f, errore: %.2e)\n', ...
        x_val, H_deriv, dy_data(i), abs(H_deriv - dy_data(i)));
end

%% PARTE C: Confronto con interpolazione di Lagrange
fprintf('\nPARTE C: Confronto con interpolazione di Lagrange\n');
fprintf('------------------------------------------------\n');

% Interpolazione di Lagrange usando solo i valori della funzione
% (senza le derivate) -> polinomio di grado 1
coeff_lagrange = polyfit(x_data, y_data, 1);

fprintf('Coefficienti del polinomio di Lagrange (grado 1):\n');
fprintf('L(x) = %.6fx + %.6f\n', coeff_lagrange(1), coeff_lagrange(2));

% Creazione di punti per la valutazione e il grafico
x_eval = linspace(-0.5, 1.5, 100)';

% Valutazione del polinomio di Hermite
H_eval = coeff_hermite(1) + coeff_hermite(2)*x_eval + ...
         coeff_hermite(3)*x_eval.^2 + coeff_hermite(4)*x_eval.^3;

% Valutazione della derivata di Hermite
H_deriv_eval = coeff_hermite(2) + 2*coeff_hermite(3)*x_eval + 3*coeff_hermite(4)*x_eval.^2;

% Valutazione del polinomio di Lagrange
L_eval = polyval(coeff_lagrange, x_eval);

%% Creazione dei grafici
fprintf('\nCreazione dei grafici comparativi...\n');

% Grafico principale: confronto polinomi
figure('Position', [100, 100, 1200, 800]);

% Subplot 1: Confronto dei polinomi
subplot(2, 2, 1);
plot(x_data, y_data, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'red', ...
    'DisplayName', 'Punti dati', 'LineWidth', 2);
hold on;
plot(x_eval, H_eval, 'b-', 'LineWidth', 2, 'DisplayName', 'Hermite (grado 3)');
plot(x_eval, L_eval, 'g--', 'LineWidth', 2, 'DisplayName', 'Lagrange (grado 1)');

% Aggiungi frecce per indicare le derivate
quiver(x_data, y_data, 0.2*ones(size(x_data)), 0.2*dy_data, 0, ...
    'r', 'LineWidth', 2, 'MaxHeadSize', 0.3, 'DisplayName', 'Derivate specificate');

xlabel('x', 'FontSize', 12);
ylabel('y', 'FontSize', 12);
title('Confronto: Hermite vs Lagrange', 'FontSize', 14);
legend('Location', 'best', 'FontSize', 10);
grid on;
grid minor;

% Annotazioni per i punti
text(x_data(1), y_data(1) + 0.15, sprintf('(%.1f,%.1f)\nf''=%.1f', x_data(1), y_data(1), dy_data(1)), ...
    'HorizontalAlignment', 'center', 'FontSize', 9, 'Color', 'red');
text(x_data(2), y_data(2) + 0.15, sprintf('(%.1f,%.1f)\nf''=%.1f', x_data(2), y_data(2), dy_data(2)), ...
    'HorizontalAlignment', 'center', 'FontSize', 9, 'Color', 'red');

% Subplot 2: Derivate
subplot(2, 2, 2);
plot(x_eval, H_deriv_eval, 'b-', 'LineWidth', 2, 'DisplayName', 'H''(x) - Hermite');
hold on;
plot(x_data, dy_data, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'red', ...
    'DisplayName', 'Derivate specificate');
% Derivata di Lagrange (costante)
y_deriv_lagrange = coeff_lagrange(1) * ones(size(x_eval));
plot(x_eval, y_deriv_lagrange, 'g--', 'LineWidth', 2, 'DisplayName', 'L''(x) - Lagrange');

xlabel('x', 'FontSize', 12);
ylabel('f''(x)', 'FontSize', 12);
title('Confronto delle Derivate', 'FontSize', 14);
legend('Location', 'best', 'FontSize', 10);
grid on;
grid minor;

% Subplot 3: Errore di interpolazione nell'intervallo [0,1]
subplot(2, 2, 3);
x_fine = linspace(0, 1, 200)';
H_fine = coeff_hermite(1) + coeff_hermite(2)*x_fine + ...
         coeff_hermite(3)*x_fine.^2 + coeff_hermite(4)*x_fine.^3;
L_fine = polyval(coeff_lagrange, x_fine);

% Poiché non abbiamo la funzione vera, confrontiamo i due metodi
diff_HL = abs(H_fine - L_fine);
plot(x_fine, diff_HL, 'k-', 'LineWidth', 2);
xlabel('x', 'FontSize', 12);
ylabel('|H(x) - L(x)|', 'FontSize', 12);
title('Differenza tra Hermite e Lagrange', 'FontSize', 14);
grid on;
grid minor;

% Subplot 4: Tabella riassuntiva
subplot(2, 2, 4);
axis off;

% Creazione di una tabella di confronto
text(0.1, 0.9, 'CONFRONTO METODI', 'FontSize', 14, 'FontWeight', 'bold');
text(0.1, 0.8, 'Metodo', 'FontSize', 12, 'FontWeight', 'bold');
text(0.4, 0.8, 'Grado', 'FontSize', 12, 'FontWeight', 'bold');
text(0.6, 0.8, 'Info Utilizzate', 'FontSize', 12, 'FontWeight', 'bold');

text(0.1, 0.7, 'Hermite', 'FontSize', 11);
text(0.4, 0.7, '3', 'FontSize', 11);
text(0.6, 0.7, 'Valori + Derivate', 'FontSize', 11);

text(0.1, 0.6, 'Lagrange', 'FontSize', 11);
text(0.4, 0.6, '1', 'FontSize', 11);
text(0.6, 0.6, 'Solo Valori', 'FontSize', 11);

text(0.1, 0.4, 'Equazioni Hermite:', 'FontSize', 11, 'FontWeight', 'bold');
text(0.1, 0.3, sprintf('H(x) = %.3f + %.3fx + %.3fx² + %.3fx³', ...
    coeff_hermite(1), coeff_hermite(2), coeff_hermite(3), coeff_hermite(4)), ...
    'FontSize', 10, 'FontFamily', 'monospace');

text(0.1, 0.2, 'Equazione Lagrange:', 'FontSize', 11, 'FontWeight', 'bold');
text(0.1, 0.1, sprintf('L(x) = %.3fx + %.3f', coeff_lagrange(1), coeff_lagrange(2)), ...
    'FontSize', 10, 'FontFamily', 'monospace');

hold off;

% Salvataggio del grafico
sgtitle('Esercizio 1.3: Interpolazione di Hermite vs Lagrange', 'FontSize', 16);
saveas(gcf, 'esercizio_1_3_hermite.png');
fprintf('Grafico salvato come "esercizio_1_3_hermite.png"\n');

%% ANALISI AGGIUNTIVA: Proprietà del polinomio di Hermite
fprintf('\n=== ANALISI AGGIUNTIVA ===\n');
fprintf('Proprietà della matrice di Hermite:\n');
fprintf('Determinante: %.6f\n', det(A_hermite));
fprintf('Numero di condizione: %.2e\n', cond(A_hermite));
fprintf('Rango: %d\n', rank(A_hermite));

if det(A_hermite) ~= 0
    fprintf('✓ La matrice è non singolare (det ≠ 0)\n');
else
    fprintf('✗ La matrice è singolare!\n');
end

% Verifica della derivata seconda nei punti
fprintf('\nDerivate seconde nei punti:\n');
for i = 1:length(x_data)
    x_val = x_data(i);
    H_deriv2 = 2*coeff_hermite(3) + 6*coeff_hermite(4)*x_val;
    fprintf('H''''(%.1f) = %.6f\n', x_val, H_deriv2);
end

% Punti di flesso (dove H''(x) = 0)
if coeff_hermite(4) ~= 0
    x_flesso = -coeff_hermite(3) / (3*coeff_hermite(4));
    if x_flesso >= min(x_data) && x_flesso <= max(x_data)
        fprintf('Punto di flesso nell''intervallo: x = %.6f\n', x_flesso);
    else
        fprintf('Punto di flesso fuori dall''intervallo: x = %.6f\n', x_flesso);
    end
else
    fprintf('Nessun punto di flesso (polinomio al più quadratico)\n');
end

fprintf('\n=== VANTAGGI E SVANTAGGI ===\n');
fprintf('HERMITE:\n');
fprintf('  ✓ Maggiore controllo locale (derivate specificate)\n');
fprintf('  ✓ Interpolazione più liscia\n');
fprintf('  ✓ Buon controllo delle pendenze\n');
fprintf('  ✗ Richiede informazioni sulle derivate\n');
fprintf('  ✗ Grado più alto\n\n');

fprintf('LAGRANGE:\n');
fprintf('  ✓ Richiede solo i valori della funzione\n');
fprintf('  ✓ Grado minimo\n');
fprintf('  ✓ Semplice da implementare\n');
fprintf('  ✗ Nessun controllo sulle derivate\n');
fprintf('  ✗ Può essere meno liscio\n');

fprintf('\n=== RIEPILOGO RISULTATI ===\n');
fprintf('Polinomio di Hermite (grado 3): H(x) = %.6f + %.6fx + %.6fx² + %.6fx³\n', ...
    coeff_hermite(1), coeff_hermite(2), coeff_hermite(3), coeff_hermite(4));
fprintf('Polinomio di Lagrange (grado 1): L(x) = %.6fx + %.6f\n', ...
    coeff_lagrange(1), coeff_lagrange(2));
fprintf('Hermite rispetta sia i valori che le derivate specificate.\n');
fprintf('Lagrange rispetta solo i valori della funzione.\n');

fprintf('\n=== ESERCIZIO 1.3 COMPLETATO ===\n');
