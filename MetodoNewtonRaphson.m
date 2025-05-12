function [xfinal, interacciones] = MetodoNewtonRaphson(funcion, dfuncion, x0, error)
    % METODONEWTONRAPHSON   
    interacciones = 0;
    x_lista = [];
    x_anterior = x0;
    
    while true
        %Evaluacion de la funcion y su derivada
        fn = funcion(x_anterior);
        dfn = dfuncion(x_anterior);
        
        %x_ctual es igual a x+1
        x_actual = x_anterior - (fn / dfn); % nueva aproximación
        
        % agregamos a la lista 
        x_lista = [x_lista; x_actual];

        interacciones = interacciones + 1;
        %se valida el error antes de continuar para evitar la integracion
        %de x_actual a la lista
        if abs(x_actual - x_anterior) < error
            break
        end
              
        x_anterior = x_actual; % actualizar
        
    end
    
    xfinal = x_actual;
    
    % Mostrar tabla
    iter = (1:interacciones)';
    disp(length(x_lista));
    tabla = table(iter, x_lista(:));
    disp(tabla)
end
