function [xfinal, interacciones] = MetodoSecante(funcion, x0, x1, error, max)
    interacciones = 0;
    x_anterior = x0;
    x_actual = x1;
    x_lista = [];

    while true
        f_anterior = funcion(x_anterior);
        f_actual = funcion(x_actual);

        
        

        x_nuevo = x_actual - f_actual * (x_actual - x_anterior) / (f_actual - f_anterior);
        x_lista = [x_lista; x_actual];

        interacciones = interacciones + 1;
        
        if abs(funcion(x_actual)) < error
            break
        end

        x_anterior = x_actual;
        x_actual = x_nuevo;


        
        if interacciones > max
            break
        end

    end

    xfinal = x_actual;

    % Tabla de resultados
    iter = (1:interacciones)';
    tabla = table(iter, x_lista);
    disp(tabla)
end
