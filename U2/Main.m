clc; clear; format rational;

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
% matriz_ec = [10 -1 2 0; 
%             -1 11 -8 0; 
%              3 8 13 0; 
%              2 3 1 7];
% resultados = [6 25 -11 15];
% matriz_ec = [10 -1 2 0; 
%             -1 11 -1 3; 
%              2 -1 10 -1; 
%              0 3 -1 8];
% resultados = [6 25 -11 15];
% matriz_ec = [10 -1 2 0; 
%             -1 11 -1 3; 
%              2 -1 10 -1; 
%              0 3 -1 8];
% resultados = [6 25 -11 15];



% [n_interacciones, x_solucion] = GaussSeidel(matriz_ec, resultados, tolerancia, max_iteraciones);

%entradas MA, vB, x0, error, max iter
%salida n_interacciones, ultomos 3 valores

%------------------------

% D = diag(matriz_ec)
% 
% matriz_ec = [ 5 2 -3; 
%               2 10 -8; 
%               3 8 13  ];
% resultados = [1 4 7];
% 
% tolerancia = 0.0001;
% max_iteraciones = 5000;
% [n_interacciones, x_solucion] = MetodoJacobi(matriz_ec, resultados, tolerancia, max_iteraciones);
% % 
% D = diag(diag(matriz_ec))
% L = tril(matriz_ec, -1)
% U = triu(matriz_ec, 1)


% matriz = [ 1 -1 -2;
%            2 1 1;
%            3 2 4];
% det(matriz)
% inversa =  MetodoMatrizInversaGaussJ(matriz);

X_data = [0; 1; 2; 3; 4];
Y_data = [-1; 6; 31; 18; 29];
x = 0.5;

MetodoLagrange(X_data, Y_data, x);




