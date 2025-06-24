clc; clear; format rational;

matriz = [ 1 3;
           2 4];
% matriz = [ 2 4 6;
%            4 5 6;
%            3 1 -2];
fprintf("La determinante directa:%f\n\n", det(matriz))
inversa =  MetodoMatrizInversaGaussJ(matriz);

