clc
clear all

f = @(x) sin(x);

ax = -pi/2;
bx = pi/2;
ay = -1;
by = 1;

x = linspace(ax, bx);
y = sin(x);

xfinale = zeros(20);
yfinale = zeros(20);

tolx = 1e-10;

i = 1;
for y0=ay:0.1:by
    [xb, xk, it] = bisezioneModificato(f, ax, bx, tolx, y0);
    xfinale(i) = xb;
    yfinale(i) = y0;
    i = i + 1;
end

plot(xfinale, yfinale)
legend('ris')
%plot(xfinale, yfinale, ax:0.01:bx, sin(x));
