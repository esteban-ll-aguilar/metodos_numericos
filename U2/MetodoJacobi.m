function [n_interacciones, x_solucion] = MetodoJacobi(matriz_ec, v_resultados, tolerancia, max_iteraciones)
    % METODOJACOBI Resuelve un sistema lineal Ax = b usando el método de Jacobi.

    n_ecuaciones = length(v_resultados);
    x = zeros(n_ecuaciones, 1);  % Vector inicial
    D = diag(diag(matriz_ec));
    L = tril(matriz_ec, -1);
    U = triu(matriz_ec, 1);
    
    for interacciones = 1:max_iteraciones
        x_antiguo = x;

        for i = 1:n_ecuaciones
            suma = 0;
            for j = 1:n_ecuaciones
                if j ~= i
                    suma = suma + matriz_ec(i,j) * x_antiguo(j);
                end
            end
            x(i) = (v_resultados(i) - suma) / matriz_ec(i,i);
        end


        errores = abs(x - x_antiguo);
        if all(errores <= tolerancia)
            break;
        end

        if interacciones == max_iteraciones
            warning('Puede que no haya convergido o el sistema diverja.');
        end
    end

    x_solucion = x;
    n_interacciones = interacciones;

    fprintf('El número de iteraciones es: %d\n', n_interacciones)
    tabla_resultados = table(x_solucion(:), 'VariableNames', {'Resultados'});
    disp(tabla_resultados)
end
