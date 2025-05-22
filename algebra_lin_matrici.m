A = [
    1 2 3;
    4 5 6;
    7 8 9
    ];

B = [
    0 5 -2;
    1 0 3;
    4 1 0
    ];

v = [1;2;3];

ABSum = A + B;
disp('Somma di A e B:')
disp(ABSum);

ABProd = A * B;
disp('Prodotto di A e B:')
disp(ABProd);


Av = A * v; % Calculate the product of A and vector v
disp('Prodotto di A e v:')
disp(Av); % Display the result of the product

