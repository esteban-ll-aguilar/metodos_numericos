clc; clear; format long;

rango = -2:0.5:2;
% Evaluar el polinomio: f(x) = 3x^3 - 2x^2 + 5x - 1
fx = @(x) 3*x.^3 - 2*x.^2 + 5*x - 1;
EvaluarPolinomio(fx, rango);

% Valores exactos y aproximados
v_exact = [3.1416, 2.7183];
v_aprox = [3.14, 2.71];
ErrorAbsolutoYRelativo(v_exact, v_aprox)

SerieRecursiva(10)

rango = -3:0.5:3;
EvaluacionPorTrozos(rango)

c=[2 -3 0 5];
x=1.2;

resul = AlgoritmoHorner(c,x);
disp(resul)

x = -1;
N = 5;
[S, err] = SerieTaylor(x, N);
fprintf('Aproximación: %.8f\n', S);
fprintf('Error relativo: %.6f %%\n', err);


hx = @(x) x .* exp(-x) - 0.1;
CambioSigno(0, 2, 10, hx)


% Función f(x)
f = @(x) exp(-x) .* (2 - x);
df_exacta = @(x) exp(-x) .* (x - 3);

x0 = 1;
h = 0.001;

DerivadaCentral(f, df_exacta, x0, h);





f = @(x) x.^3 - 13*x - 12;
x0 = 4;
x1 = 4.5;
x2 = 5;
[x3, f3] = AlgoritmoMuller(f, x0, x1, x2);