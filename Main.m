clc; clear; format long;

% funcion = @(x) x.^2;
% derivada = @(x) 2*x;
%------------------------
% funcion = @(x) tan(x);
% derivada = @(x) sec(x).^2;
%------------------------
% funcion = @(x) 3*x.^2 + 2*x;
% derivada= @(x) 6*x + 2;
%------------------------
% a = 0;
% b = 5;
% N = 10;
% 
% % DiferenciaNumerica(funcion, a, b, N);
% DiferenciaConDerivada(funcion, derivada, a, b, N)
%------------------------
matriz_ec = [5 2 -3; 2 10 -8; 3 8 13];
resultados = [1 4 7];
tolerancia = 0.001;
max_iteraciones = 5000;

[n_interacciones, x_solucion] = GaussSeidel(matriz_ec, resultados, tolerancia, max_iteraciones);

%entradas MA, vB, x0, error, max iter
%salida n_interacciones, ultomos 3 valores