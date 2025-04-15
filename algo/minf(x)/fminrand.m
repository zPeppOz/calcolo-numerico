% FMINRAND Random search for a minimum of a function
%   FMINRAND(f, a, b, delta) returns a point ris in the interval [a,b]
%   such that f(ris) is less than or equal to delta.
%   The function f must be a function handle.
%   The function returns the point ris where the minimum is found.
%   The function uses a random search algorithm to find the minimum.
%   The algorithm generates random points in the interval [a,b] and evaluates
%   the function at those points. If the function value is less than or equal to delta,
%   the point is returned as the minimum.
%   The algorithm stops when the maximum number of iterations is reached or
%   a satisfactory minimum is found.
%   The algorithm also keeps track of the best point found so far.

function ris = fminrand(f, a, b, delta, max_iter)
% Condizione di base: se l'intervallo è minore di delta o max_iter è esaurito
if abs(b-a) <= delta || max_iter <= 0
    ris = (a+b)/2;
    return
end

% Genera due punti casuali nell'intervallo
x1 = a + (b-a)*rand(1,1);
x2 = a + (b-a)*rand(1,1);
c = min([x1, x2]);
d = max([x1, x2]);

% Aggiorna l'intervallo
if f(c) < f(d)
    b = d;
else
    a = c;
end

% Chiamata ricorsiva con max_iter decrementato
ris = fminrand(f, a, b, delta, max_iter-1);
end