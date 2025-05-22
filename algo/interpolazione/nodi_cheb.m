function x = nodi_cheb(n, a, b)
if nargin <2, a= -1; b= 1; end
k= 1:n;
x = (a+b)/2 + (b-a)/2*cos((2*k-1)*pi/(2*n));
end