clc; clear; format long;

funcion = @(x) x.^2;
derivada = @(x) 2*x;
a = 0;
b = 5;
N = 10;

% DiferenciaNumerica(funcion, a, b, N);
DiferenciaConDerivada(funcion, derivada, a, b, N)