clc; clear; format long;

funcion = @(x) x.^3 -13*x-12;
x0=4;
x1=4.5;
x2=5;
tolerancia = 10.^-5;

[lista_x0,lista_x1,lista_x2,lista_x3,lista_f3,lista_abs_x3_x2] =...
    FuncionEvaluacion(funcion,x0,x1,x2,tolerancia);
