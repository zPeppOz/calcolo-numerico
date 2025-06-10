f = @(x) 1./1+x;
a=1; b=3;
sol = log(2);
% foruma dei trapezi (polinomio grado 1)
s_trapezi = ((b-a)/2)*(f(a) + f(b));
% formula simpson
p_medio = (a+b)/2;
s_simp = ((b-a)/6)*(f(a) + 4*f(p_medio) + f(b));
fprintf('\n\t Integrale esatto: %1.5e', sol);
fprintf('\n\t Trapezi: %1.5f', s_trapezi);
fprintf('\n\t Simpson: %1.5f', s_simp)

% formula dei trapezi composta
N = 10
h=(b-a)/N;
x = a:h:b; x = x';

w = ones(N+1, 1);
w(1)=0.5; w(N+1) = 0.5;
w = w*h;

s_trapezi_composti = sum(f(x).*w);
fprintf('\n\t Trapezi composti: %1.5f', s_trapezi_composti);


% formula di simpson composta

h_simp = (b-a)/2*N;
x_simp = a:h_simp:b; x_simp = x_simp';
w_simp = zeros(2*N+1);
w_simp(1)= h_simp/3; w_simp(2*N+1)= h_simp/3;
i_pari = 2:2:2*N;
w_simp(i_pari) = 4*h_simp/3;
ind_disp=3:2:2*N-1;
w_simp(ind_disp) = 2*h_simp/3;
s_simp_composti = sum(f(x_simp).*w_simp, 1);
fprintf('\n\t Simpson composti: %1.5f\n', s_simp_composti);