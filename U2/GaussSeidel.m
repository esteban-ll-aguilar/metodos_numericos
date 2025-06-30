function [n_interacciones, x_solucion] = GaussSeidel(matriz_ec, v_resultados, tolerancia, max_iteraciones)
%GAUSSSEIDEL Resuelve un sistema de ecuaciones lineales usando el método de Gauss-Seidel.
    n_ecuaciones = length(v_resultados);
    x = zeros(n_ecuaciones, 1);

    for interacciones = 1:max_iteraciones
        x_antiguo = x;
        for i = 1:n_ecuaciones
            lamba = (matriz_ec(i,1:i-1) * x_antiguo(1:i-1) * -1) ...
                  + (matriz_ec(i,i+1:end) * x_antiguo(i+1:end)*-1);
            % cambiar los valores de x
            x(i) = (v_resultados(i) + lamba) / matriz_ec(i,i);
            %calcular los errores
            disp(x_antiguo)
            errores = abs(x-x_antiguo);
        end
        if all(errores <= tolerancia)
           break;
        end
        if interacciones == max_iteraciones
            warning('Puede ser que le falto ejecutarse o puede ser que no hay reultado y va hacia el infinito');
        end
    end
    x_solucion = x;
    n_interacciones = interacciones;

    fprintf('El numero de interacciones es: %d\n', n_interacciones)
    tabla_resultados = table(x_solucion(:), 'VariableNames', {'Resultados'});
    disp(tabla_resultados)
end
