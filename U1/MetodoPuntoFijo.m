function [xfinal, interacciones] = MetodoPuntoFijo(funcion, x0, error)
    % METODOPUNTOFIJO
    interacciones = 0;
    x_lista = [];
    x_anterior = x0;

    while true
        % Evaluar la función g(x) que debe cumplir g(x) = x
        x_actual = funcion(x_anterior);

        % Guardar la nueva aproximación
        x_lista = [x_lista; x_actual];
        interacciones = interacciones + 1;

        % Verificar condición de parada por error
        if abs(x_actual - x_anterior) < error
            break
        end

        % Actualizar para la siguiente iteración
        x_anterior = x_actual;
    end

    xfinal = x_actual;

    % Mostrar tabla de iteraciones
    iter = (1:interacciones)';
    tabla = table(iter, x_lista(:));
    disp(tabla)
end
