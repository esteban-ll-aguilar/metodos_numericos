function [x, y] = SistemaNEcuacionesRugeKutta(f, a, b, y0, N)
    h = (b - a) / N;
    x = linspace(a, b, N + 1)';  % vector columna
    y = zeros(N + 1, length(y0));
    y(1, :) = y0(:)';            % asegurar fila

    for k = 1:N
        k1 = f(x(k), y(k, :))';
        k2 = f(x(k) + h/2, y(k, :) + (h/2) * k1)';
        k3 = f(x(k) + h/2, y(k, :) + (h/2) * k2)';
        k4 = f(x(k+1), y(k, :) + h * k3)';

        y(k + 1, :) = y(k, :) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    end
end


