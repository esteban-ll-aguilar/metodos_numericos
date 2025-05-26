% clear; clc;
% format long;
% 
% 
% funcion = @(x) x^3-x-1;
% derivada = @(x) 3*x^2 -1;
% funcion2 = @(x) cos(x)-x;
% derivada2 = @(x) -sin(x)-1;
% % funcion = @(x) x.^2;
% % funcion = @(x) x.^3 + 2*x.^2 + 10*x - 20;
% % funcion = @(x) x.^2 - 30;
% 
% 
% [xfinal,interacciones] = MetodoNewtonRaphson(funcion2, derivada2, 4, 0.001);
% disp('xfinal: ');
% disp(xfinal);
% disp(['numero de interacciones: ', num2str(interacciones)]);


clc; clear; format long;


funcion = @(x) -0.5*x.^2 - 0.3*x + 0.9;
[resultado] = SerieDeTaylor(funcion, 0,2,1,0);

disp(resultado)