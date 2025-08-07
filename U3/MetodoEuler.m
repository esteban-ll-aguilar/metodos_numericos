function [x, y] = MetodoEuler(a, b, N, y_inicial, funcion)
    h = (b-a)/N;
    x = (a:h:b);

    y = zeros(0,N);
    y(1) = y_inicial;

    for i = 1:N
        y(i+1) = y(i) + h*funcion(x(i),y(i));
    end
    % tabla =  table(x', y', 'VariableNames',{ ...
    %     'xe','ye'});
    % disp(tabla);
end
