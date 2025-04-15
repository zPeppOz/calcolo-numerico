x = linspace(0, 2*pi, 200);
y = sin(4*x) - 0.2+0.4*rand(1, length(x));
[valMax, indMax] = max(y);
argmax = x(indMax);
fprintf('Valore massimo: %f\n arg (ascissa): %f\n', valMax, argmax);

figure;
plot(x,y,'g', [min(x) max(x)], [0 0], 'k', argmax, valMax, '.r', argmax, 0, '.b', 'MarkerSize', 12); % rappresenta il massimo, l'asse x e l'asse y

set(gcf, 'Position', [100, 100, 300, 200]);
legend('sin(4x)', 'perturb.1', 'perturb.2', 'Location', 'EastOutside');

