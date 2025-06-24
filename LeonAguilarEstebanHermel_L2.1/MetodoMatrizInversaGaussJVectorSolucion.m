function [inverza, division, soluciones] = MetodoMatrizInversaGaussJVectorSolucion(matriz, vector_b)
    %METODOMATRIZINVERSAGAUSSJ Calcula la inversa de una matriz usando Gauss-Jordan
    %   Devuelve la matriz inversa, los divisores usados por fila y las soluciones del sistema
    %   Si se proporciona un vector_b, también resuelve el sistema Ax = b
    n = size(matriz, 1);
    inverza = eye(n);
    division = zeros(n, 1);
    soluciones = [];

    resuelve_sistema = nargin > 1 && ~isempty(vector_b);

    if resuelve_sistema
        if size(vector_b, 2) > 1
            vector_b = vector_b'; % Convertir a columna si es necesario
        end
        if length(vector_b) ~= n
            error('El vector b debe tener el mismo número de filas que la matriz');
        end
    end

    for i = 1:n
        if matriz(i,i) == 0
            warning("La diagonal contiene ceros. Esto puede causar errores.");
            return
        end
    end    
    
    % Eliminación Gauss-Jordan
    for i = 1:n
        division(i) = matriz(i,i);

        matriz(i,:) = matriz(i,:) / division(i);
        inverza(i,:) = inverza(i,:) / division(i);
        
        if resuelve_sistema
            vector_b(i) = vector_b(i) / division(i);
        end

        for j = 1:n
            if j ~= i
                factor = matriz(j,i);
                matriz(j,:) = matriz(j,:) - factor * matriz(i,:);
                inverza(j,:) = inverza(j,:) - factor * inverza(i,:);
                
                if resuelve_sistema
                    vector_b(j) = vector_b(j) - factor * vector_b(i);
                end
            end
        end
    end

    if resuelve_sistema
        fprintf('\n%-10s | %-10s\n', 'Variable', 'Valor');
        fprintf('---------------------------\n');
        for i = 1:n
            soluciones(i,1) = vector_b(i);
            fprintf('X%-9d | %-10s\n', i, rats(vector_b(i)));
        end
    end
end
