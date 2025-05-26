function [lista_x0, lista_x1, lista_x2, lista_x3, lista_f3, lista_abs_x3_x2] = FuncionEvaluacion(funcion, x0, x1, x2, tolerancia)
    lista_x0 = [];
    lista_x1 = [];
    lista_x2 = [];
    lista_x3 = [];
    lista_f3 = [];
    lista_abs_x3_x2 = [];

    while true
        h1 = x1 - x0;
        h2 = x2 - x1;

        delta1 = (funcion(x1) - funcion(x0)) / h1;
        delta2 = (funcion(x2) - funcion(x1)) / h2;

        a = (delta2 - delta1) / (h2 + h1);
        b = a * h2 + delta2;
        c = funcion(x2);

        discriminante = b^2 - 4*a*c;

        if discriminante < 0
            error('La raíz es compleja, el discriminante es negativo');
        end

        sqrt_disc = sqrt(discriminante);

        % Elegir el signo del denominador que tenga el mayor valor absoluto
        if abs(b + sqrt_disc) > abs(b - sqrt_disc)
            denominador = b + sqrt_disc;
        else
            denominador = b - sqrt_disc;
        end

        x3 = x2 + (-2 * c / denominador);
        abs_x3_x2 = abs(x3 - x2);

        lista_x0 = [lista_x0; x0];
        lista_x1 = [lista_x1; x1];
        lista_x2 = [lista_x2; x2];
        lista_x3 = [lista_x3; x3];
        lista_f3 = [lista_f3; funcion(x3)];
        lista_abs_x3_x2 = [lista_abs_x3_x2; abs_x3_x2];

        if abs_x3_x2 < tolerancia
            break
        end

        x0 = x1;
        x1 = x2;
        x2 = x3;
    end

    % Mostrar tabla
    tabla = table(lista_x0, lista_x1, lista_x2, lista_x3, lista_f3, lista_abs_x3_x2, ...
        'VariableNames', {'x0', 'x1', 'x2', 'x3', 'f(x3)', '|x3 - x2|'});
    disp(tabla)
end
