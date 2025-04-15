f = @(x) sin(3*x) ./(1+log(x.^2).^2); % definizione della funzione

problem.objective = f; % funzione obiettivo
problem.x0 = 1; % punto iniziale
problem.solver = 'fzero';
problem.options = optimset('Display', 'iter', 'TolFun', 1e-6, 'TolX', 1e-6); % opzioni del solver


x = fzero(problem); % chiamata alla funzione fzero
fprintf('Radice trovata: %.6f\n', x); % stampa della radice trovata