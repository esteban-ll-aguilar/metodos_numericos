function EvaluacionPorTrozos(rango)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    % Rango de evaluación
    x = rango;
    
    % Prealocar g
    g = zeros(size(x));
    
    % Aplicar condiciones por trozos
    for i = 1:length(x)
        if x(i) < 0
            g(i) = x(i)^2;
        elseif x(i) <= 2
            g(i) = sin(x(i));
        else
            g(i) = log(x(i) + 1); % ln(x+1)
        end
    end

    % Mostrar tabla
    T = table(x', g', 'VariableNames', {'x', 'g_x'});
    disp(T)
end


