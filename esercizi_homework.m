% Parametro m dalle ultime 2 cifre della matricola
m_matricola = 49;
matricola_str = '49';

%% Parte 1 – Vettori e Matrici
fprintf('--- Parte 1: Vettori e Matrici ---\n');

% 1.1 Vettore v
k_lunghezza = 20;
vettore_v = randi([m_matricola, 300 - m_matricola], k_lunghezza, 1);
fprintf('1.1: Vettore v generato (%d elementi).\n', k_lunghezza);

% 1.2 Modifica vettore v
fprintf('1.2: Rimozione elementi con resto 3 (divisione per %d).\n', m_matricola+7);
lunghezza_v_originale = length(vettore_v);
for i = length(vettore_v):-1:1
    if mod(vettore_v(i), m_matricola + 7) == 3
        vettore_v(i) = [];
    end
end
fprintf('    Lunghezza originale: %d, modificata: %d.\n', lunghezza_v_originale, length(vettore_v));

% 1.3 Vettore w
lunghezza_l = length(vettore_v);
w_minimo = -m_matricola - 15;
w_massimo = m_matricola + 15;
vettore_w = randi([w_minimo, w_massimo], lunghezza_l, 1);
fprintf('1.3: Vettore w creato (%d elementi reali).\n', lunghezza_l);

% 1.4 Matrice C
matrice_C = zeros(lunghezza_l, 3);
for i = 1:lunghezza_l
    matrice_C(i, 1) = vettore_v(i);
    matrice_C(i, 2) = vettore_w(i);
    matrice_C(i, 3) = 5 * (vettore_v(i) + 2 * vettore_w(lunghezza_l + 1 - i));
end
fprintf('1.4: Matrice C definita (%d x 3).\n', lunghezza_l);

% 1.5 Estrazione al contrario

c_new = zeros(3,3);
i_1 = lunghezza_l;
i_2 = round(lunghezza_l / 2);
i_3 = 1;



fprintf('1.5: Estrazione al contrario della matrice C in c_new.\n');
% Stampa della matrice c_new
disp('Matrice c_new:');
disp(c_new);

