function CambioSigno(a,b,n,hx)
    % Calcular paso
    paso = (b - a) / n;
    x = a:paso:b;
    
    % Evaluar la función hx
    h = hx(x);

    % Mostrar tabla de valores
    T = table(x', h', 'VariableNames', {'x', 'h_x'});
    disp(T)

    % Detectar cambios de signo (producto negativo entre puntos consecutivos)
    cambio_signo = h(1:end-1) .* h(2:end) < 0;

    % Mostrar intervalos donde ocurre cambio de signo
    fprintf('\nCambios de signo en los intervalos:\n');
    for i = 1:length(cambio_signo)
        if cambio_signo(i)
            fprintf('Entre x = %.4f y x = %.4f\n', x(i), x(i+1));
        end
    end
end