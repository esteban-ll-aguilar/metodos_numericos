function [xfinal, interacciones] = MetodoSecante(funcion, x0, x1, error, max)
    interacciones = 1;
    x_anterior = x0;
    x_actual = x1;
    x_lista = [x0; x1];  % Incluir x0 y x1 como primeras iteraciones

    while true
        f_anterior = funcion(x_anterior);
        f_actual = funcion(x_actual);

        % Evitar división por cero
        if f_actual == f_anterior
            warning('División por cero detectada. Terminando.');
            break;
        end

        % Calcular el nuevo valor
        x_nuevo = x_actual - f_actual * (x_actual - x_anterior) / (f_actual - f_anterior);
        x_lista = [x_lista; x_nuevo];

        interacciones = interacciones + 1;

        % Verificar convergencia
        if abs(x_nuevo - x_actual) < error
            x_actual = x_nuevo;
            break;
        end

        if interacciones >= max
            warning("Se alcanso el limite de interacciones")
            break
        end

        % Actualizar para la siguiente iteración
        x_anterior = x_actual;
        x_actual = x_nuevo;
    end

    xfinal = x_actual;

    % Mostrar tabla de resultados
    iter = (0:interacciones)';
    tabla = table(iter, x_lista, 'VariableNames', {'Iteración', 'x'});
    disp(tabla)
end
