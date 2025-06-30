function SerieRecursiva(n)
%GENERAR_SERIE_RECURSIVA Genera los primeros n términos de la serie:
% a_n = (2*a_{n-1} + 3) / (a_{n-1} + 4), con a_0 = 1

    % Validar entrada
    if nargin < 1
        n = 10; % Valor por defecto si no se proporciona
    end

    % Inicializar vector
    a = zeros(1, n);
    a(1) = 1; % a0

    % Generar la serie recursiva
    for i = 2:n
        a(i) = (2*a(i-1) + 3) / (a(i-1) + 4);
    end

    % Crear y mostrar tabla
    T = table((0:n-1)', a', 'VariableNames', {'n', 'a_n'});
    disp(T)
end
