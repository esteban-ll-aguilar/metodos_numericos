clear; clc;
format long;
%h es intervalo

%tabla de valores

vector_entrada = input("Ingrese los coeficientes de un polinomio" + ...
    "\nen orden descendente de grado, usando vectores. Ejemplo [3 5 4]: ");


%convertir a duncion un string
%https://la.mathworks.com/help/matlab/ref/str2func.html
polinomio = ConstruirPolinomioString(vector_entrada);
funcion = str2func("@(x)"+polinomio);



a = input("Ingrese el limite superior (a): ");
b = input("Ingrese el limite inferior (b): ");
N = input("Ingrese numero de puntos (N): ");
h = (b-a)/N;

x = a :h: b;
y = polyval(vector_entrada,x);

% for i=1:length(x)
%     y(i) = funcion(x(i));
% end


disp("Polinomio construido:")
disp(polinomio)

%transformar variables
disp("Tabla de resultados:")
tabla = table(x(:), y(:))










