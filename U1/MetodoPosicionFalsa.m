function [valor_aprox, n_interaciones] = MetodoPosicionFalsa(funcion, xizq, xder, error, max_interacciones)
%METODOPOSICIONFALSA Summary of this function goes here
%   Detailed explanation goes here
    n_interaciones = 0;
    vector_x_aprox = [];

    while true
        %Evaluar los puntos para formar los f(x)
        f_xizq = funcion(xizq);
        f_xder = funcion(xder);

        %calcular xfp
        xfp = xder - ((f_xder *  (xizq-xder)) / (f_xizq - f_xder));

        %Luego, se evalúa 𝑓(𝑥𝑓𝑝).
        f_xfp = funcion(xfp);

        % Si el signo de 𝑓(𝑥𝑓𝑝) es igual al de 𝑓(𝑥𝑖𝑧𝑞) 
        % se reemplaza 𝑥𝑖𝑧𝑞 por 𝑥𝑓𝑝; 
        % caso contrario, se reemplaza 𝑥𝑑𝑒𝑟 por 𝑥𝑓𝑝. 
        if sign(f_xfp) == sign(f_xizq)
            xizq = xfp;
        else
            xder = xfp;
        end

        %asignacion de valores
        n_interaciones = n_interaciones+1;
        vector_x_aprox = [vector_x_aprox; xfp];


        % Este proceso se repite hasta que, 
        % el valor absoluto de 𝑓(𝑥𝑓𝑝) sea menor que una tolerancia especificada. 
        if abs(f_xfp) < error
            break
         end
         if n_interaciones >= max_interacciones
             warning("Entro en un bucle infinito, no hay respuesta")
             break
         end
    end
    valor_aprox = xfp;
    %imprimimos la tabla
    x = (1:n_interaciones);
    disp( ...
        table( ...
        x(:), ...
        vector_x_aprox(:)))
end

