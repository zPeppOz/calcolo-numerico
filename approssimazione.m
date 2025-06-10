% % tre modi differenti di calcolare la retta dei minimi quadrati
x = [0.2 0.7 0.9 1.2 1.4 1.9]';
y = [2.1 1.3 1.4 1.1 1.7 2.2]';
xx = linspace(0, 2, 50);
a = polyfit(x,y, 1);
% % modo 1 con polyval
retta = polyval(a, xx);
% % figure;
% % grid on;
% % hold on;
% % plot(x,y, 'o', xx, retta, 'r')
% % title('retta dei minimi quadrati')

% B = [x ones(size(x))];
% % modo 2 usando la formula B^T Ba = B^T y
% a1 = (B'*B)\(B'*y)
% polyval(a1([2 1]), xx);
% % modo 3 usando la formula B a = y
% a2 = B\y

% parabola dei minimi quadrati
% n = 3
% f(x) = a1 + a2x + a3x^2
% a_2 = polyfit(x,y,2);
% parabola = polyval(a_2,xx);
% a_3 = polyfit(x,y,3);
% pol3 = polyval(a_3, xx);
% a_4 = polyfit(x,y,4);
% pol4 = polyval(a_4, xx);
% a_5 = polyfit(x,y,5);
% pol5 = polyval(a_5, xx);

% % plot(x,y, 'o', xx, parabola, 'r', xx, retta, 'b', xx_s, pol3, 'g')
% figure;
% plot(x,y, 'o', 'MarkerSize', 8, 'DisplayName', 'Dati')
% hold on;
% plot(xx, retta, 'b','LineWidth', 1.5, 'DisplayName', 'Retta')
% plot(xx, parabola, 'g' ,'LineWidth', 1.5, 'DisplayName', 'Parabola')
% plot(xx, pol3,'r', 'LineWidth', 1.5, 'DisplayName', 'Polinomio di terzo grado')
% plot(xx, pol4,'y', 'LineWidth', 1.5, 'DisplayName', 'Polinomio di terzo grado')
% plot(xx, pol5,'c', 'LineWidth', 1.5, 'DisplayName', 'Polinomio di terzo grado')
% grid on;
% hold off;
% legend()

% modello f(x) = a1+a2sin(x) + a3 sin(2x)
B = [ones(length(x)) sin(x) sin(2*x)];
a_sin = (B'*B)\(B'*y);
% pol_sin = a_sin(1)+a_sin(2)*sin(xx)+a_sin(3)*sin(2*xx);
pol_sin = polyval(a_sin, xx);
figure;
plot(x, y, 'o', 'MarkerSize', 8, 'DisplayName', 'Dati');
plot(xx, pol_sin, 'b', 'LineWidth', 1.5, 'DisplayName', 'Polinomio trigonometrico dispari di II grado')
hold off;
legend;
