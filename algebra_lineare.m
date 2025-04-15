v1 = [1;2;3];
v2 = [4;5;6];
v_prodotto_scalare = v1' * v2; % prodotto scalare
sprintf('Il prodotto scalare tra v1 e v2 è: %d', v_prodotto_scalare)

v3 = [7;8;9];
v4 = [2;4;6;9;]; % Modifica per mantenere la coerenza con la definizione di v4
v_prodotto_esterno = v3*v4'
% sprintf('Il prodotto esterno tra v3 e v4 è: %d\n', v_prodotto_esterno)

norma_2 = norm(v1, 2); % norma 2
sprintf('La norma 2 di v1 è: %f\n', norma_2)

norma_1 = norm(v1, 1); % norma 1
sprintf('La norma 1 di v1 è: %f\n', norma_1)

norma_infinito = norm(v1, inf); % norma infinito
sprintf('La norma infinito di v1 è: %f\n', norma_infinito)