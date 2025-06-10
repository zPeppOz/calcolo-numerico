function radice = bisezione(f, a,b, delta, max_iter)
printRadice = @(r, i) fprintf('Radice trovata in %.6f dopo %d iterazioni\n', r, i);
if f(a)*f(b) > 0
    error('La funzione deve avere segno opposto agli estremi dell''intervallo [a,b]');
end
for i = 1:max_iter
    % calcolo il punto medio
    pmedio = (a + b) / 2;
    % calcolo il valore della funzione in pmedio
    fpmedio = f(pmedio);
    % if abs(fpmedio) < delta
    if abs(b-a)/max(abs(a), abs(b)) < delta

        radice = pmedio;
        printRadice(radice, i);
        return
    end

    % calcolo il nuovo intervallo
    if f(a) * fpmedio < 0
        b = pmedio;
    else
        a = pmedio;
    end
    % if abs(b - a) < delta
    if abs(b-a)/max(abs(a), abs(b)) < delta
        radice = (a + b) / 2;
        printRadice(radice, i);
        return
    end
end
radice = (a + b) / 2;
fprintf('Massimo numero di iterazioni raggiunto, radice approssimata in %.6f\n', radice);
end




