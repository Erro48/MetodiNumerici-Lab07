clc
clear all

format short

syms x
fx = x^3 + x^2 - 33*x + 63;
dfx = diff(fx,x,1);

f = matlabFunction(fx);
df = matlabFunction(dfx);

z = linspace(-5, 5, 200);
figure
plot(z,f(z))

x0 = 1;
tolx = 1e-12;
tolf = 1e-12;
nmax = 500;
[xNew, xkNew, itNew] = newton(f, df, x0, tolx, tolf, nmax);
xNew
ordine = stimaOrdine(xkNew(itNew-3:itNew))


% Newton Modificato
x0 = 1;
tolx = 1e-12;
tolf = 1e-12;
nmax = 500;
molt = 2;
[xNewM, xkNewM, itNewM] = newtonModificato(f, df, molt, x0, tolx, tolf, nmax);
xNewM
ordine = stimaOrdine(xkNewM(itNewM-3:itNewM))


