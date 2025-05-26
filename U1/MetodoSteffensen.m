function [xfinal, iteraciones] = MetodoSteffensen(g, x0, tol, max_iter)
    % METODOSTEFFENSEN - Método de Steffensen para encontrar raíces
    %
    % Entradas:
    %   g        - función iterativa
    %   x0       - valor inicial
    %   tol      - tolerancia para criterio de parada
    %   max_iter - número máximo de iteraciones (opcional)
    %
    % Salidas:
    %   xfinal       - aproximación de la raíz
    %   iteraciones  - número de iteraciones realizadas

    if nargin < 4
        max_iter = 100;
    end

    iteraciones = 0;
    x_lista = zeros(max_iter, 1);
    x_prev = x0;

    while iteraciones < max_iter
        x1 = g(x_prev);
        x2 = g(x1);
        % x1 = 20/(x_prev.^2 - 6*x_prev + 10);
        % x2 = 20/(x1.^2 - 6*x1 + 10);

        numerador = (x1 - x_prev)^2;
        denominador = x2 - 2*x1 + x_prev;

        if denominador == 0
            error('División por cero en el método de Steffensen');
        end

        x_next = x_prev - numerador / denominador;

        iteraciones = iteraciones + 1;
        x_lista(iteraciones) = x_next;

        if abs(x_next - x_prev) < tol
            break
        end

        x_prev = x_next;
    end

    xfinal = x_next;
    x_lista = x_lista(1:iteraciones); % eliminar ceros sobrantes

    % Mostrar tabla de iteraciones
    tabla = table((1:iteraciones)', x_lista, 'VariableNames', {'Iteración', 'x'});
    disp(tabla)
end
