function [a, b, n_veces_aplicado, error_final] = MetodoGrafico(funcion, a, b, N, tol)
    % BÚSQUEDA INCREMENTAL PARA ENCONTRAR UN INTERVALO DONDE HAY RAÍZ
    % Entradas:
    %   funcion: función anónima con @(x)
    %   a, b: intervalo inicial
    %   N: número de divisiones
    %   tol: tolerancia mínima entre extremos del subintervalo
    % Salidas:
    %   a, b: subintervalo final con raíz detectada
    %   n_veces_aplicado: número de iteraciones
    %   error_final: tamaño del subintervalo final

    n_veces_aplicado = 0;
    error_final = abs(b - a);

    while error_final > tol
        n_veces_aplicado = n_veces_aplicado + 1;
        h = (b - a) / N;
        x = (a:h:b);
        fx = funcion(x);

        signo_cambio = false;

        for i = 1:N
            if fx(i) * fx(i + 1) < 0
                a = x(i);
                b = x(i + 1);
                error_final = abs(b - a);
                signo_cambio = true;
                break;
            end
        end

        if ~signo_cambio
            warning('No se encontró cambio de signo en la iteración %d. Puede que no haya raíz en el intervalo.', n_veces_aplicado);
            break;
        end
    end
end
