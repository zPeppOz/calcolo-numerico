addpath(genpath('algo')); % Aggiunge ricorsivamente tutte le sottocartelle
% da slide, esermpio 1
% x = [0.2 0.9 1.2]';
% y = [2.1 1.3 1.7]';
% B=[ones(size(x)) x x.^2]
% a=B\y
% z = linspace(0, 2, 50)';
% BZ = [ones(size(z)) z z.^2]
% w = BZ*a
% plot(x,y,'o',z,w)
% hold on
% plot(z,w,'r-')
% hold off
% xlabel('x')
% ylabel('y')
% title('Interpolazione quadratica')
% grid on

% esempio 2
% x = linspace(0.3, 2, 4)';
% y = linspace(1, 3, 4)';
% B = [ones(size(x)) cos(x) cos(2*x)]
% a = B\y
% z = linspace(0, 2.2, 100)';
% BZ = [ones(size(z)) cos(z) cos(2*z)]
% w = BZ*a
% plot(x, y, 'o', z, w)
% hold on
% plot(z, w, 'r-')
% hold off
% xlabel('x')
% ylabel('y')
% title('Interpolazione quadratica')
% grid on

% esempio 3
% x = linspace(-0.2, 1.4, 3)';
% y = linspace(0.1, 0.9, 3)';
% B = [ones(size(x)) cos(x) cos(2*x)]
% a = B\y
% z = linspace(-0.2, 1.4, 100)';
% BZ = [ones(size(z)) cos(z) cos(2*z)]
% w = BZ*a
% plot(x, y, 'o', z, w)
% hold on
% plot(z, w, 'r-')
% hold off
% xlabel('x')
% ylabel('y')
% title('Interpolazione quadratica')
% grid on

% % esempio 4
% % interpolare con una funzione p, combinazione lineare di una costante di un esponenziale e di una potenza di esponente 1/2 su tre punti
% x = linspace(0, 2, 3)';
% y = linspace(0.2, 2, 3)';
% B = [ones(size(x)) exp(x) sqrt(x)+exp(x.^2)];
% a = B\y;
% z = linspace(0, 2, 100)';
% BZ = [ones(size(z)) exp(z) sqrt(z)+exp(z.^2)];
% w = BZ*a;
% plot(x, y, 'o', z, w)
% hold on
% plot(z, w, 'r-')
% hold off
% xlabel('x')
% ylabel('y')
% title('Interpolazione quadratica')
% grid on

% % esempio 5
% % polyfit e polyval
% x = linspace(0.2, 1.2, 3)';
% y = [2.1 1.3 1.7]';
% a = polyfit(x, y, 2);
% z = linspace(0, 2, 100)';
% w = polyval(a, z);
% plot(x, y, 'o', z, w)
% hold on
% plot(z, w, 'r-')
% hold off
% xlabel('x')
% ylabel('y')
% title('Interpolazione quadratica')
% grid on

% esempio 6: nodi di chebyshev con runge

% Usiamo una funzione inline per i nodi di Chebyshev
n = 20;
a = -1;
b = 1;
% Definizione diretta dei nodi di Chebyshev
k = 1:n;
% funzione per calcolare i nodi di Chebyshev
x = (a+b)/2 + (b-a)/2*cos((2*k-1)*pi/(2*n));

% Funzione di Runge
f = @(x) 1./(1+25*x.^2);
y = f(x);
% Interpolazione polinomiale di Lagrange
% con polyfit e polyval
p = polyfit(x, y, n-1);
z = linspace(a, b, 100)';
w = polyval(p, z);

plot(x, y, 'o', z, w)
hold on
plot(z, w, 'r-')
hold off
xlabel('x')
ylabel('y')
title('Interpolazione quadratica')
grid on
