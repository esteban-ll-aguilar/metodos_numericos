function [inverza, division] = MetodoMatrizInversaGaussJ(matriz)
%METODOMATRIZINVERSAGAUSSJ Calcula la inversa de una matriz usando Gauss-Jordan
%   Devuelve la matriz inversa y los divisores usados por fila
    n = size(matriz, 1);               % Tamaño de la matriz
    inverza = eye(n);                  % Matriz identidad
    division = zeros(n, 1);            % Vector para guardar divisores

    for i = 1:n
        if matriz(i,i) == 0
            warning("Que la diagonal contenga ceros puede resultar en errores")
            return
        end
    end

    for i = 1:n
        % Guardar el divisor de la fila actual (pivote)
        division(i) = matriz(i,i);

        % Normalizar la fila i
        matriz(i,:) = matriz(i,:) / division(i);
        inverza(i,:) = inverza(i,:) / division(i);

        % Hacer ceros en otras filas
        for j = 1:n
            if j ~= i
                factor = matriz(j,i);
                matriz(j,:) = matriz(j,:) - factor * matriz(i,:);
                inverza(j,:) = inverza(j,:) - factor * inverza(i,:);
            end
        end
    end

    resultado = 1;
    fprintf("Calculando determinante..\n")
    for i = 1:n
        resultado = resultado * division(i);
        fprintf("Paso %d: resultado *= %d -> resultado = %d\n", ...
                i, division(i), resultado);
    end
    fprintf("\n\nLa determinante por medio del producto de las diviciones es: \n%f\n", resultado);
    fprintf("La matriz es:\n");
    disp(inverza)
end
