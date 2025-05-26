clc; clear; format long;


funcion = @(x) exp(-x/4) * (2-x) -1;
x0 = 0;
x1 = 2;
error = 0.001;

[xfinal,interacciones] = MetodoSecante(funcion, x0, x1, error, 500);
disp('xfinal: ');
disp(xfinal);
disp(['numero de interacciones: ', num2str(interacciones)]);
