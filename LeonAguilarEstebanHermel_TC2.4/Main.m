clc; clear; format long;

f = @(x) -0.1*x.^4 - 0.15*x.^3 - 0.5*x.^2 - 0.25*x + 1.2;
x = 0.5;
h1 = 0.5;
h2 = 0.25;

MetodoExtrapolacionDeRichardson(f, x, h1, h2)




