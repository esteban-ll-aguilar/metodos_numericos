function [valor_aprox, n_interaciones] = MetodoBiseccion(funcion, xizq, xder, error, max_interacciones)
    n_interaciones = 0;
    vector_interacciones = [];

    while true
        x_centro = (xizq + xder) / 2;
        f_centro = funcion(x_centro);
        f_der = funcion(xder);  % Evitar reevaluaciones
        vector_interacciones(end + 1, 1) = x_centro;

        n_interaciones = n_interaciones + 1;

        % Criterio de parada
        if abs(f_centro) < error || (abs(xder - xizq)/2 < error)
            break;
        end

        % Reducción del intervalo
        if f_centro * f_der > 0
            xder = x_centro;
        else
            xizq = x_centro;
        end

        % Límite de iteraciones
        if n_interaciones >= max_interacciones
            warning('Se alcanzó el máximo de iteraciones.');
            break;
        end
    end

    valor_aprox = x_centro;

    % Mostrar resultados
    tabla = table((1:n_interaciones)', vector_interacciones, 'VariableNames', {'Iteracion', 'x_centro'});
    disp("La tabla de resultados es la siguiente:")
    disp(tabla)
end
