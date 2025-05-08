function [polinomio] = LecturaPolinomio(vector_entrada,a, b, N)
%LECTURAPOLINOMIO Summary of this function goes here
%   Detailed explanation goes here

    %convertir a duncion un string
    %https://la.mathworks.com/help/matlab/ref/str2func.html
    polinomio = ConstruirPolinomioString(vector_entrada);
    funcion = str2func("@(x)"+polinomio);
    h = (b-a)/N;
    x = a :h: b;
    
    %2 maneras
    % y = polyval(vector_entrada,x);

    for i=1:length(x)
        y(i) = funcion(x(i));
    end
    disp("Tabla de resultados:")
    tabla = table(x(:), y(:));
    disp(tabla)
end












