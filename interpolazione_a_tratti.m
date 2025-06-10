x_s = [1, 1.9, 3, 3.3, 4, 4.7];
y_s = [2, 1.5, 1.3, 2.3, 3, 2.7];
xx_s = linspace(min(x_s), max(x_s), 200);

% spline cubica not-a-knot
yspline = spline(x_s, y_s, xx_s);

% cubica di Hermite
ychip = pchip(x_s, y_s, xx_s);

% spline lineare
ylinear = interp1(x_s, y_s, xx_s, 'linear');

figure;
plot(x_s, y_s, 'o', xx_s, yspline, '-', xx_s, ychip, '--', xx_s, ylinear, ':');
xlabel('x');
ylabel('y');
title('Interpolazione a tratti');
legend('Punti dati', 'Spline cubica not-a-knot', 'Cubica di Hermite', 'Spline lineare');
grid on;
hold off;