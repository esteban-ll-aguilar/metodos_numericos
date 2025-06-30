function EvaluarPolinomio(fx, rango_valores)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    % Rango de valores de x
   

    % Crear tabla con x y f(x)
    T = table(rango_valores', fx(rango_valores)', 'VariableNames', {'x', 'f_x'});

    % Mostrar la tabla
    disp(T)

end

