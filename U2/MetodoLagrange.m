function valor_evaluado = MetodoLagrange(puntos_x, puntos_y, punto_a_evaluar)
    % Verifica que ambos vectores tengan la misma cantidad de puntos
    if length(puntos_x) ~= length(puntos_y)
        error('Los vectores puntos_x y puntos_y deben tener la misma longitud.');
    end

    cantidad_puntos = length(puntos_x);
    orden_maximo_polinomio = cantidad_puntos - 1;

    for orden_actual = 1:orden_maximo_polinomio
        % fprintf('--- Polinomio P%d ---\n', orden_actual);

        % Selecciona los puntos para construir el polinomio de orden actual
        subconjunto_x = puntos_x(1:orden_actual + 1);
        subconjunto_y = puntos_y(1:orden_actual + 1);

        polinomio_simplificado = 0;
        polinomio_original_como_texto = '';
        
        for indice_punto = 1:(orden_actual + 1)
            x_actual = subconjunto_x(indice_punto);
            y_actual = subconjunto_y(indice_punto);

            termino_lagrange = 1;       % Coeficientes del polinomio L_j(x)
            denominador_lagrange = 1;   % Denominador de L_j(x)
            texto_lagrange = '1';       % Representación en texto de L_j(x)

            % Construcción del término de Lagrange L_j(x)
            for indice_otro = 1:(orden_actual + 1)
                if indice_otro ~= indice_punto
                    x_otro = subconjunto_x(indice_otro);
                    termino_lagrange = conv(termino_lagrange, [1, -x_otro]);
                    denominador_lagrange = denominador_lagrange * (x_actual - x_otro);
                    texto_lagrange = [texto_lagrange, sprintf('*(x - %.4f)', x_otro)];
                end
            end

            % Representación textual del término interpolante
            termino_textual = sprintf('%.4f*(%s)/%.4f', y_actual, texto_lagrange, denominador_lagrange);
            if indice_punto == 1
                polinomio_original_como_texto = termino_textual;
            else
                polinomio_original_como_texto = [polinomio_original_como_texto, ' + ', termino_textual];
            end

            % Sumar el término al polinomio simplificado
            termino_lagrange = termino_lagrange * (y_actual / denominador_lagrange);
            polinomio_simplificado = SumarPolinomios(polinomio_simplificado, termino_lagrange);
        end

        % Mostrar el polinomio original (no simplificado)
        % fprintf('Polinomio original:\nP%d(x) = %s\n\n', orden_actual, polinomio_original_como_texto);

        % Mostrar el polinomio simplificado (como suma de monomios)
        % fprintf('Polinomio simplificado:\nP%d(x) = ', orden_actual);
        % for i = 1:length(polinomio_simplificado)
        %     coeficiente = polinomio_simplificado(i);
        %     grado = length(polinomio_simplificado) - i;
        % 
        %     if abs(coeficiente) < 1e-10
        %         continue;
        %     end
        % 
        %     if coeficiente > 0 && i > 1
        %         fprintf(' + ');
        %     elseif coeficiente < 0
        %         fprintf(' - ');
        %         coeficiente = abs(coeficiente);
        %     end
        % 
        %     if grado == 0
        %         fprintf('%.3f', coeficiente);
        %     elseif grado == 1
        %         fprintf('%.3fx', coeficiente);
        %     else
        %         fprintf('%.3fx^%d', coeficiente, grado);
        %     end
        % end
        % fprintf('\n');

        % Evaluar el polinomio en el punto solicitado
        valor_evaluado = polyval(polinomio_simplificado, punto_a_evaluar);
        % fprintf('P%d(%.2f) = %.6f\n\n', orden_actual, punto_a_evaluar, valor_evaluado);
    end
end


