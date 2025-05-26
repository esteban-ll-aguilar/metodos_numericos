clear; clc;
format long;


funcion = @(x) exp(-x/4) .* (2 - x) - 1;
% funcion = @(x) x.^2;
% funcion = @(x) x.^3 + 2*x.^2 + 10*x - 20;
% funcion = @(x) x.^2 - 30;


xizq = input("Ingrese el limite inferior (xizq): ");
xder = input("Ingrese el limite superior (xder): ");
err = input("Ingrese el numero de error (err): ");

[valor_aprox, n_interaciones] = MetodoPosicionFalsa(funcion, xizq, xder,err, 500);

disp('El valor aproximado es');
disp(valor_aprox)
disp(['Las veces que se aplico el metodo es: ', num2str(n_interaciones)])
