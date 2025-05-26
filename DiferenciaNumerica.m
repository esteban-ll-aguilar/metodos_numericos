function [f_adelante, f_atras, f_centro] = DiferenciaNumerica(funcion, a, b, N)
%DIFERENCIANUMERICA Calcula derivadas numéricas hacia adelante, atrás y centradas.
    inter = 0;
    h = (b - a) / N;
    
    f_centro = [];
    f_adelante = [];
    f_atras = [];
    x_exacta = [];
    x_inter = a;

    while inter <= N
        % Guardar valores
        f_adelante = [f_adelante, (funcion(x_inter + h) - funcion(x_inter)) / h];
        f_atras    = [f_atras,    (funcion(x_inter) - funcion(x_inter - h)) / h];
        f_centro   = [f_centro,   (funcion(x_inter + h) - funcion(x_inter - h)) / (2 * h)];
        x_exacta   = [x_exacta, x_inter];

        % Avanzar
        x_inter = x_inter + h;
        inter = inter + 1;
    end
    
    tabla = table(x_exacta(:), f_centro(:), f_adelante(:), f_atras(:), f_centro(:),...
        'VariableNames', {'x', 'x_sol', 'f_adelante', 'f_atras','f_centro'});
    disp(tabla);
end
