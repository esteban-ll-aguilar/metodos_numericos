clc;clear;format long;

% funcion1 = @(x) x^3-x-1;
% dfuncion1 = @(x) 3*x^2 -1;
% funcion2 = @(x) cos(x)-x;
% dfuncion2 = @(x) -sin(x)-1;
% % funcion = @(x) x.^2;
% % funcion = @(x) x.^3 + 2*x.^2 + 10*x - 20;
% % funcion = @(x) x.^2 - 30;
% funcion = @(x) -0.5*x.^2 - 0.3*x + 0.9;
% funcion = @(x) exp(-x/4) * (2-x) - 1;

% --------------------1  Metodo grafico ------
% funcion = @(x) exp(-x/4) * (2-x) - 1;
% a = 0;
% b = 0;
% N = 0;
% tolerancia = 0.01;
% 
% [x0, x1, n_veces_aplicado, error_final] = MetodoGrafico(funcion, a, b, N, tolerancia);
% 
% disp(['putos: ', num2str(x0), num2str(x1)])
% disp(['veces aplicado: ', num2str(x0), num2str(x1)])
% disp(['error final: ', num2str(error_final)])

% --------------------2  Metodo Biseccion -------------------------------
% funcion = @(x) exp(-x/4) * (2-x) - 1;
% xizq = 0;
% xder = 0;
% error = 0;
% max_interacciones = 0;

%[valor_aprox, n_interaciones] = MetodoBiseccion(funcion, xizq, xder, error, max_interacciones)

% disp(['valor_aprox: ', num2str(valor_aprox)])
% disp(['veces aplicado: ', num2str(n_interaciones)])

% --------------------3  Metodo Newton Raphson -------------------------------
% funcion = @(x) cos(x)-x;
% dfuncion = @(x) -sin(x)-1;
% x0 = 4;
% error =  0.001;
% [xfinal, interacciones] = MetodoNewtonRaphson(funcion, dfuncion, x0, error);
% disp('xfinal: ');
% disp(xfinal);
% disp(['interacciones aplicado: ', num2str(interacciones)])


% --------------------4  Metodo Posicion Falsa -------------------------------
% funcion = @(x) exp(-x/4) * (2-x) - 1;

% xizq = 0;
% xder = 2;
% error = 0.001;
% max_interacciones = 500;
% [valor_aprox, n_interaciones] = MetodoPosicionFalsa(funcion, xizq, xder, error, max_interacciones);
% disp(['valor_aprox: ', num2str(valor_aprox)])
% disp(['interacciones aplicado: ', num2str(n_interaciones)])


% --------------------5 Metodo Secante -------------------------------
funcion = @(x) exp(-x/4) * (2-x) - 1;

x0 = 1;
x1 = 2;
error = 0.001;
max_interacciones = 500;
[xfinal, interacciones] = MetodoSecante(funcion, x0, x1, error, max_interacciones);
disp(['numero de interacciones: ', num2str(interacciones)]);


% --------------------6  Polinomios -------------------------------
% vector_entrada = [7 -2 1 5];
% a = 1;
% b = 5;
% N = 10;
% [polinomio] = LecturaPolinomio(vector_entrada,a, b, N);
% disp('El polinomio es: ' + polinomio)
