function ReglaTrapeciosYSimpson(a, b, N, funcion)
    h = (b - a) / N;
    x = (a:h:b);
    y = funcion(x);

    % Regla del Trapecio
    I_trapecio = h/2 * (y(1) + 2*sum(y(2:end-1)) + y(end));

    % Regla de Simpson 1/3
    I_simpson13 = h/3 * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));

    % Regla de Simpson 3/8 corregida
    I_simpson38 = (3*h/8) * (y(1) + 3*sum(y(2:end-1)) + y(end));

    % Crear tabla
    resultados = [I_trapecio, I_simpson13, I_simpson38];
    T = array2table(resultados, 'VariableNames', {'Trapecio', 'Simpson 1/3', 'Simpson 3/8'});
    disp(T)
end
