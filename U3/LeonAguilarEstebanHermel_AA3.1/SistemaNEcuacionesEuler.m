function [x, y] = SistemaNEcuacionesEuler(f, a, b, y0, N)

    h = (b - a) / N;
    x = linspace(a, b, N + 1)';  % columna
    y = zeros(N + 1, length(y0));

    y(1, :) = y0(:)';  % asegurar que y0 sea fila

    for k = 1:N
        y(k + 1, :) = y(k, :) + h * f(x(k), y(k, :)')';
    end
end
