function [x3, f3] = AlgoritmoMuller(f, x0, x1, x2)
    % Una iteración del método de Müller
    % f  : función handle
    % x0, x1, x2 : puntos iniciales
    % Salida:
    % x3 : nuevo punto calculado
    % f3 : f(x3)

    % Evaluar función en los puntos
    f0 = f(x0);
    f1 = f(x1);
    f2 = f(x2);

    % Diferencias
    h0 = x1 - x0;
    h1 = x2 - x1;
    delta0 = (f1 - f0) / h0;
    delta1 = (f2 - f1) / h1;
    a = (delta1 - delta0) / (h1 + h0);
    b = a * h1 + delta1;
    c = f2;

    % Discriminante
    rad = sqrt(b^2 - 4*a*c);

    % Selección del denominador para estabilidad numérica
    if abs(b + rad) > abs(b - rad)
        denom = b + rad;
    else
        denom = b - rad;
    end

    % Calcular x3
    x3 = x2 - (2*c) / denom;
    f3 = f(x3);

    % Mostrar resultados formateados
    fprintf('x3 ≈ %.4f; f(x3) ≈ %.4f\n', x3, f3);
end
