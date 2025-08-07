function [x, y] = MetodoRungeKutta(a, b, N, y_inicial, funcion)
    h = (b-a)/N;
    x = (a:h:b);

    y = zeros(0,N);
    y(1) = y_inicial;

    for i = 1:N
        k1 = funcion(x(i), y(i));
        k2 = funcion(x(i)+ h/2, y(i) + ((h/2)*k1));
        k3 = funcion(x(i)+ h/2, y(i) + ((h/2)*k2));
        k4 = funcion(x(i+1), y(i) + h*k3);
        y(i+1) = y(i) + (h/6)  * (k1 + 2*k2 + 2*k3 +k4);
    end
    % tabla =  table(x', y', 'VariableNames',{ ...
    %     'xe','ye'});
    % disp(tabla);
end
