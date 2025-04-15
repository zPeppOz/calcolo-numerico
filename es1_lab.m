m = 4;
n = 3;
x = linspace(0, 2*pi, 200);
y = sin(4*x);

yp1 = y + 0.2*rand(1, length(x)); % Add noise to y
yp2 = y - 0.2+0.4*rand(1, length(x)); % Add noise to y

figure;

plot(x, y, 'r', x, yp1, 'g', x, yp2, 'b');
set(gcf, 'Position', [100, 100, 300, 200]);
legend('sin(4x)', 'perturb.1', 'perturb.2', 'Location', 'EastOutside');
