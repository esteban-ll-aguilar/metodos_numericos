function [outputArg1,outputArg2] = DiferenciaConDerivada(funcion, derivada, a, b, N)
%DIFERENCIANUMERICA Calcula derivadas numéricas hacia adelante, atrás y centradas.

    inter = 0;
    h = (b - a) / N;
    
    f_centro = [];
    f_adelante = [];
    f_atras = [];
    x_exacta = [];
    derivada_exacta = [];

    error_adelante = [];
    error_atras = [];
    error_centro = [];

    x_inter = a;

    while inter <= N
        % Guardar valores
        d_real = derivada(x_inter);
        f_a = (funcion(x_inter + h) - funcion(x_inter)) / h;
        f_b = (funcion(x_inter) - funcion(x_inter - h)) / h;
        f_c = (funcion(x_inter + h) - funcion(x_inter - h)) / (2 * h);

        f_adelante = [f_adelante, f_a];
        f_atras    = [f_atras,    f_b];
        f_centro   = [f_centro,   f_c];
        x_exacta   = [x_exacta, x_inter];
        derivada_exacta = [derivada_exacta, d_real];

        % Errores absolutos
        error_adelante = [error_adelante, abs(f_a - d_real)];
        error_atras    = [error_atras,    abs(f_b - d_real)];
        error_centro   = [error_centro,   abs(f_c - d_real)];

        % Avanzar
        x_inter = x_inter + h;
        inter = inter + 1;
    end
    
    tabla = table(x_exacta(:),    derivada_exacta(:),...
                  f_adelante(:),  error_adelante(:), ...
                  f_atras(:),     error_atras(:),    ... 
                  f_centro(:),    error_centro(:),   ...
        'VariableNames', ...
                  {'x', 'Derivada_Exacta',           ...
                  'f_adelante',   'Error_adelante',  ...
                  'f_atras',      'Error_atras',     ...
                  'f_centro',     'Error_centro'});
    disp(tabla);
end