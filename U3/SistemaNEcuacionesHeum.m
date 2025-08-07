function [x, y]  = SistemaNEcuacionesHeum(f, a, b, y0, N)
    h = (b - a) / N;
    x = (a:h:b)'; % vector columna
    y = zeros(N + 1, length(y0));
    y(1, :) = y0(:)';             % asegurar que sea fila

    for k = 1:N
        k1 = f(x(k), y(k, :)');                               % columna → fila
        k2 = f(x(k+1), y(k, :)' + h * k1);                    % Heun (predicción)
        y(k + 1, :) = y(k, :) + (h/2) * (k1 + k2)';              % corrección
    end
end
