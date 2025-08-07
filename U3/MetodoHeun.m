function [x, y] = MetodoHeun(a, b, N, y_inicial, funcion)
    h = (b-a)/N;
    x = (a:h:b);

    y = zeros(0,N);
    y(1) = y_inicial;

    for i = 1:N
        k1 = funcion(x(i), y(i));
        k2 = funcion(x(i+1), y(i)+h*k1);
        y(i+1) = y(i) + h/2 * (k1+k2);
    end
    % tabla =  table(x', y', 'VariableNames',{ ...
    %     'xe','ye'});
    % disp(tabla);
end
