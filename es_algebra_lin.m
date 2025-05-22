% % esercizio 1
% v = [2 -1 3];
% w = [1 2 -2];
% v3 = v*3;
% w2 = w*2;
% ris_sottrazione = v3 - w2;
% prod_scalare = v*w'

% %norm_euclidea = norm(v)
% %norm_1 = norm(v, 1)
% %norm_inf = norm(v, inf)

% % verifica ortogonalità
% isOrtogonale = abs(dot(v,w)) < 1e-12

% esercizio 2
A = [2 1 -1; 3 2 1; 1 -1 2];
b = [3; 10; 2];

x = A \ b

% verifica della soluzione
% r = b - A*x;
% resid = norm(r, 2);           % norma 2 del residuo
% fprintf('‖r‖₂ = %.3e\n', resid);

% calcolo il determinante di A
d = det(A);
disp('Determinante: ');
disp(d);
% controlla se la matrice è singolare. Se non lo è, calcola il rango
if det(A) ~= 0
    rango = rank(A);
    disp('Rango: ');
    disp(rango);
end