function [valor_aprox, n_interaciones] = MetodoBiseccion(funcion, xizq, xder, error, max_interacciones)
    n_interaciones = 1;
    vector_interacciones = [];
    while true
        x_centro = (xizq + xder) / 2;
        vector_interacciones = [vector_interacciones, x_centro];
        fcentro = funcion(x_centro);
        
        % Revisamos el criterio de error
        if abs(fcentro) < error
            break;
        end
        
        % Condicional para no perderse jeje
        if fcentro * funcion(xder) > 0
            xder = x_centro;
        else
            xizq = x_centro;
        end
        
        
        if n_interaciones >= max_interacciones
            break
        end

        n_interaciones = n_interaciones + 1;
    end
    %asignar el valor aproximado unavez se acabo el bucle
    valor_aprox = x_centro;

    % tabla a disposicion de los resultados dados (verificacion paso a paso
    % por si sale mal)
    x = (1:length(vector_interacciones));
    
    tabla= table(x(:),vector_interacciones(:));
    disp("La tabla de resultados es la siguiente:")
    disp(tabla)
end
