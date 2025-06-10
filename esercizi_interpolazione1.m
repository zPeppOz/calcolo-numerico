x = [0.5, 1.2, 2.0]';
y = [2.3, 1.8, 3.1]';

% costruzione della matrice di Vandermonde
mat = zeros(length(x), length(x));
for i = 1:length(x)
    for j = 1:length(x)
        mat(i,j) = x(i)^(j-1);
    end
end
fprintf('Matrice di Vandermonde:\n');
disp(mat);
mat_flip = fliplr(mat);

% calcolo dei coefficienti del polinomio interpolante
coeff = mat_flip\y;
fprintf('Coefficienti del polinomio interpolante:\n');
for i = 1:length(coeff)
    fprintf('a_%d = %.6f\n', i-1, coeff(i));
end

% verifica con polyfit
coeff_poly = polyfit(x,y,length(x)-1);
fprintf('Coefficienti del polinomio interpolante con polyfit:\n');
for i = 1:length(coeff_poly)
    fprintf('a_%d = %.6f\n', i-1, coeff_poly(i));
end
% valutazione in 50 punti e grafico
xx = linspace(0.5, 2.5, 50);
yy = polyval(coeff, xx);
figure;
plot(x, y, 'o', xx, yy, '-');
xlabel('x');
ylabel('y');
title('Interpolazione di Lagrange con Matrice di Vandermonde');
grid on;
hold on;

%% esercizio 1.2: inerpolazione con base non polinomiale
x = [0.2, 0.8, 1.4]';
y = [1.5, 2.1, 1.7]';

B = [ones(length(x), 1), cos(x), exp(x)]
a = B\y;

figure;
plot(x, y, 'o');
hold on;
xx = linspace(0.2, 1.4, 100);
yy = a(1) + a(2)*cos(xx) + a(3)*exp(xx);
plot(xx, yy, '-');
xlabel('x');
ylabel('y');
title('Interpolazione con base non polinomiale');
grid on;
hold off;

%% esercizio 1.3: interpolazione di hermite
x = [0,1];
y = [1, 2];
xx = linspace(min(x), max(x), 100);
y_hermite = pchip(x, y, xx);
figure;
plot(x, y, 'o', xx, y_hermite, '-');
xlabel('x');
ylabel('y');
title('Interpolazione di Hermite');
grid on;
hold off;
