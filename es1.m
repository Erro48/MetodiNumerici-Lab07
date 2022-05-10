clc
clear all

format long e

syms x
fx = exp(-x) - (x + 1);
dfx = diff(fx, x, 1);

f = matlabFunction(fx);
df = matlabFunction(dfx);

a = -1;
b = 2;
%fplot(f, [a,b])
hold on
%plot(linspace(a,b), zeros(100,1))
alpha = 0;

% Metodo di Bisezione
tolx = 1e-12;
[xBis, xkBis, itBis] = bisezione(f, a, b, tolx);
ordineBis = stimaordine([xkBis(itBis-3), xkBis(itBis-2), xkBis(itBis-1), xkBis(itBis)])
errBis = abs(xkBis - alpha);
%plot(xBis, 0, 'ro')

% Metodo di Newton
x0 = -0.5;
tolf = 1e-12;
nmax = 500;
[xNew, xkNew, itNew] = newton(f, df, x0, tolx, tolf, nmax);
ordineNew = stimaordine([xkNew(itNew-3), xkNew(itNew-2), xkNew(itNew-1), xkNew(itNew)])
errNew = abs(xkNew - alpha);

% Metodo delle Corde
x0 = -0.5;
tolf = 1e-12;
nmax = 500;
m = (f(b) - f(a)) / (b - a);
[xCor, xkCor, itCor] = corde(f, m, x0, tolx, tolf, nmax);
ordineCor = stimaordine([xkCor(itCor-3), xkCor(itCor-2), xkCor(itCor-1), xkCor(itCor)])
errCor = abs(xkCor - alpha);

% Grafico errore
figure
semilogy([1:itBis], errBis, 'r-o', [1:itNew], errNew, 'g-o', [1:itCor], errCor, 'c-o')
legend('Bisezione', 'Newton', 'Corde')