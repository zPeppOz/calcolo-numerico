a = [1; 2; 3; 4];
b = [5; 6; 7; 8];
u = [3; -4; 12];

sum = a + b;
% la somma viene effettuata elemento per elemento
prodotto_scalare = a'*b;
prodotto_esterno = a*b';
norma1 = norm(u, 1);
norma2 = norm(u, 2);
norma_inf = norm(u, inf);
% il prodotto esterno produce una matrice
% di dimensioni 4x4, in cui ogni elemento è il prodotto
% del corrispondente elemento di a e b

% Stampa i risultati
disp('Somma:')
disp(sum);
disp('Prodotto scalare:')
disp(prodotto_scalare);
disp('Prodotto esterno:')
disp(prodotto_esterno);

disp('Norma 1:')
disp(norma1);
disp('Norma 2:')
disp(norma2);
disp('Norma infinito:')
disp(norma_inf);
% La norma 1 è la somma dei valori assoluti degli elementi di u
% La norma 2 è la radice quadrata della somma dei quadrati degli elementi di u
% La norma infinito è il valore assoluto del massimo elemento di u
