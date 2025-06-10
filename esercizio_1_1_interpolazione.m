%% Esercizio 1.1: Interpolazione di Lagrange con Matrice di Vandermonde
% Dati i punti P₁ = (0.5, 2.3), P₂ = (1.2, 1.8), P₃ = (2.0, 3.1)
% a) Costruire la matrice di Vandermonde per l'interpolazione polinomiale
% b) Calcolare i coefficienti del polinomio interpolante usando la matrice di Vandermonde
% c) Verificare il risultato usando polyfit di MATLAB
% d) Valutare il polinomio in 50 punti equidistanti nell'intervallo [0.5, 2.0] e tracciare il grafico

clear; clc; close all;

% Dati del problema
x_data = [0.5, 1.2, 2.0]';
y_data = [2.3, 1.8, 3.1]';

fprintf('=== ESERCIZIO 1.1: Interpolazione di Lagrange con Matrice di Vandermonde ===\n\n');
fprintf('Punti dati:\n');
for i = 1:length(x_data)
    fprintf('P%d = (%.1f, %.1f)\n', i, x_data(i), y_data(i));
end
fprintf('\n');

%% PARTE A: Costruzione della Matrice di Vandermonde
fprintf('PARTE A: Costruzione della Matrice di Vandermonde\n');
fprintf('-----------------------------------------------\n');

n_points = length(x_data);
grado = n_points - 1; % Grado del polinomio interpolante

% Costruzione manuale della matrice di Vandermonde standard
% V_ij = x_i^(j-1) per j = 1, 2, ..., n
% Quindi V = [x^0, x^1, x^2, ..., x^(n-1)]
V_manual = zeros(n_points, n_points);
for i = 1:n_points
    for j = 1:n_points
        V_manual(i, j) = x_data(i)^(j-1);
    end
end

fprintf('Matrice di Vandermonde costruita manualmente:\n');
fprintf('V = [x^0, x^1, x^2]\n');
disp(V_manual);

% Verifica usando la funzione MATLAB vander()
% ATTENZIONE: vander(x) in MATLAB crea [x^(n-1), ..., x^1, x^0] (ordine inverso)
V_matlab = vander(x_data);
fprintf('Matrice di Vandermonde da MATLAB vander() [x^2, x^1, x^0]:\n');
disp(V_matlab);

% Per la definizione standard dobbiamo invertire le colonne
V_standard = fliplr(V_matlab);
fprintf('Matrice di Vandermonde standard [x^0, x^1, x^2] (fliplr di vander):\n');
disp(V_standard);

% Verifica che le due costruzioni coincidano
if isequal(V_manual, V_standard)
    fprintf('✓ Le due costruzioni della matrice di Vandermonde coincidono!\n\n');
else
    fprintf('✗ ERRORE: Le due costruzioni non coincidono!\n\n');
end

%% PARTE B: Calcolo dei coefficienti usando la matrice di Vandermonde
fprintf('PARTE B: Calcolo dei coefficienti del polinomio interpolante\n');
fprintf('----------------------------------------------------------\n');

% Il sistema da risolvere è: V * a = y
% dove a = [a₀, a₁, a₂]ᵀ sono i coefficienti del polinomio p(x) = a₀ + a₁x + a₂x²
coeff_vander = V_standard \ y_data;

fprintf('Coefficienti del polinomio p(x) = a₀ + a₁x + a₂x² calcolati con Vandermonde:\n');
fprintf('a₀ = %.6f\n', coeff_vander(1));
fprintf('a₁ = %.6f\n', coeff_vander(2));
fprintf('a₂ = %.6f\n', coeff_vander(3));
fprintf('\nPolinomio: p(x) = %.6f + %.6fx + %.6fx²\n\n', ...
    coeff_vander(1), coeff_vander(2), coeff_vander(3));

% Verifica che il polinomio passi per i punti dati
fprintf('Verifica interpolazione (dovrebbe dare i valori y_data):\n');
for i = 1:length(x_data)
    x_val = x_data(i);
    y_calc = coeff_vander(1) + coeff_vander(2)*x_val + coeff_vander(3)*x_val^2;
    fprintf('p(%.1f) = %.6f (dato: %.1f, errore: %.2e)\n', ...
        x_val, y_calc, y_data(i), abs(y_calc - y_data(i)));
end
fprintf('\n');

%% PARTE C: Verifica con polyfit di MATLAB
fprintf('PARTE C: Verifica con polyfit di MATLAB\n');
fprintf('--------------------------------------\n');

% polyfit restituisce i coefficienti in ordine decrescente di potenza
coeff_polyfit = polyfit(x_data, y_data, grado);

fprintf('Coefficienti da polyfit [a₂, a₁, a₀] (potenze decrescenti):\n');
disp(coeff_polyfit);

% Per confrontare, invertiamo l'ordine per avere [a₀, a₁, a₂]
coeff_polyfit_ascending = flipud(coeff_polyfit(:));

fprintf('Coefficienti da polyfit riordinati [a₀, a₁, a₂]:\n');
fprintf('a₀ = %.6f\n', coeff_polyfit_ascending(1));
fprintf('a₁ = %.6f\n', coeff_polyfit_ascending(2));
fprintf('a₂ = %.6f\n', coeff_polyfit_ascending(3));

% Confronto dei risultati
diff_coeff = abs(coeff_vander - coeff_polyfit_ascending);
fprintf('\nConfronto coefficienti:\n');
fprintf('Metodo          a₀         a₁         a₂\n');
fprintf('Vandermonde   %.6f  %.6f  %.6f\n', coeff_vander(1), coeff_vander(2), coeff_vander(3));
fprintf('polyfit       %.6f  %.6f  %.6f\n', coeff_polyfit_ascending(1), coeff_polyfit_ascending(2), coeff_polyfit_ascending(3));
fprintf('Differenza    %.2e  %.2e  %.2e\n', diff_coeff(1), diff_coeff(2), diff_coeff(3));

if max(diff_coeff) < 1e-10
    fprintf('✓ I risultati dei due metodi coincidono (entro la precisione numerica)!\n\n');
else
    fprintf('✗ I risultati differiscono significativamente!\n\n');
end

%% PARTE D: Valutazione e grafico
fprintf('PARTE D: Valutazione e visualizzazione\n');
fprintf('-------------------------------------\n');

% Creazione di 50 punti equidistanti nell'intervallo [0.5, 2.0]
x_eval = linspace(0.5, 2.0, 50)';

% Valutazione del polinomio usando i coefficienti di Vandermonde
p_eval_vander = coeff_vander(1) + coeff_vander(2)*x_eval + coeff_vander(3)*x_eval.^2;

% Valutazione usando polyval (che accetta coefficienti in ordine decrescente)
p_eval_polyfit = polyval(coeff_polyfit, x_eval);

% Verifica che le due valutazioni coincidano
diff_eval = abs(p_eval_vander - p_eval_polyfit);
fprintf('Differenza massima tra le due valutazioni: %.2e\n', max(diff_eval));

% Creazione del grafico
figure('Position', [100, 100, 800, 600]);

% Plot dei punti dati
plot(x_data, y_data, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'red', ...
    'DisplayName', 'Punti dati', 'LineWidth', 2);
hold on;

% Plot del polinomio interpolante
plot(x_eval, p_eval_polyfit, 'b-', 'LineWidth', 2, ...
    'DisplayName', 'Polinomio interpolante');

% Aggiunta di una griglia più fine per visualizzare meglio la curva
x_fine = linspace(0.5, 2.0, 200);
p_fine = polyval(coeff_polyfit, x_fine);
plot(x_fine, p_fine, 'b--', 'LineWidth', 1, 'Alpha', 0.7, ...
    'DisplayName', 'Polinomio (griglia fine)');

% Evidenziamo i punti di valutazione
plot(x_eval, p_eval_polyfit, 'b.', 'MarkerSize', 4, 'Alpha', 0.6, ...
    'DisplayName', '50 punti di valutazione');

% Formattazione del grafico
xlabel('x', 'FontSize', 12);
ylabel('y', 'FontSize', 12);
title('Esercizio 1.1: Interpolazione Polinomiale di Lagrange', 'FontSize', 14);
legend('Location', 'best', 'FontSize', 10);
grid on;
grid minor;

% Aggiungiamo annotazioni per i punti dati
for i = 1:length(x_data)
    text(x_data(i), y_data(i) + 0.1, sprintf('P_%d(%.1f,%.1f)', i, x_data(i), y_data(i)), ...
        'HorizontalAlignment', 'center', 'FontSize', 9, 'Color', 'red');
end

% Aggiungiamo l'equazione del polinomio nel grafico
eq_text = sprintf('p(x) = %.3f + %.3fx + %.3fx²', ...
    coeff_polyfit_ascending(1), coeff_polyfit_ascending(2), coeff_polyfit_ascending(3));
text(0.6, 2.8, eq_text, 'FontSize', 11, 'BackgroundColor', 'white', ...
    'EdgeColor', 'black', 'HorizontalAlignment', 'left');

hold off;

% Salvataggio del grafico
saveas(gcf, 'esercizio_1_1_interpolazione.png');
fprintf('Grafico salvato come "esercizio_1_1_interpolazione.png"\n');

%% ANALISI AGGIUNTIVA: Proprietà della matrice di Vandermonde
fprintf('\n=== ANALISI AGGIUNTIVA ===\n');
fprintf('Proprietà della matrice di Vandermonde:\n');
fprintf('Determinante: %.6f\n', det(V_standard));
fprintf('Numero di condizione: %.2e\n', cond(V_standard));
fprintf('Rango: %d\n', rank(V_standard));

if det(V_standard) ~= 0
    fprintf('✓ La matrice è non singolare (det ≠ 0)\n');
else
    fprintf('✗ La matrice è singolare!\n');
end

if cond(V_standard) > 1e12
    fprintf('⚠ La matrice è mal condizionata (cond > 1e12)\n');
else
    fprintf('✓ La matrice è ben condizionata\n');
end

fprintf('\n=== RIEPILOGO RISULTATI ===\n');
fprintf('Polinomio interpolante trovato: p(x) = %.6f + %.6fx + %.6fx²\n', ...
    coeff_vander(1), coeff_vander(2), coeff_vander(3));
fprintf('Il polinomio passa esattamente per i 3 punti dati.\n');
fprintf('Metodo Vandermonde e polyfit producono risultati identici.\n');
% disp('Grafico generato con 50 punti di valutazione nell\'intervallo [0.5, 2.0].\n');


fprintf('\n=== ESERCIZIO 1.1 COMPLETATO ===\n');
