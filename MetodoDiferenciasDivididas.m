function f_interpolada = MetodoDiferenciasDivididas(x, fx, x_interp)
    cantidad_datos = length(x);
    tabla = zeros(cantidad_datos, cantidad_datos); % Tabla de diferencias divididas
    tabla(:, 1) = fx(:);  % Primera columna: f(x)

    % Construcción de la tabla de diferencias divididas
    for columna = 2:cantidad_datos
        for fila = 1:(cantidad_datos - columna + 1)
            numerador = tabla(fila + 1, columna - 1) - tabla(fila, columna - 1);
            denominador = x(fila + columna - 1) - x(fila);
            tabla(fila, columna) = numerador / denominador;
        end
    end

    % Evaluación del polinomio de Newton en x_interp
    f_interpolada = tabla(1, 1);
    producto = 1;
    coeficientes = tabla(1, 1);  % b0

    for i = 2:cantidad_datos
        producto = producto * (x_interp - x(i - 1));
        f_interpolada = f_interpolada + tabla(1, i) * producto;
        coeficientes(i) = tabla(1, i);
    end

    % fórmula del polinomio
    formula = "f(x) = " + num2str(coeficientes(1));
    termino = "";

    for i = 2:cantidad_datos
        termino = termino + "(x - " + num2str(x(i - 1)) + ")";
        coef = coeficientes(i);
        formula = formula + " + " + num2str(coef) + "*" + termino;
    end

    disp("Polinomio interpolante:")
    disp(formula)
    % Mostrar resultado
    disp("Resultado de f(" + num2str(x_interp) + ") = " + num2str(f_interpolada))
end
