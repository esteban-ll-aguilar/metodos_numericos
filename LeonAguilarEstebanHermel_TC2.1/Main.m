clc; clear; format long;

a = 0;
b = 10;
N = 20;

funcion = @(x) (x.^4) .* (5 - x.^2);

ReglaTrapeciosYSimpson(a,b,N,funcion)


