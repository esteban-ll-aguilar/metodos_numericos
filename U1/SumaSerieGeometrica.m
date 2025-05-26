function [suma_final, iteraciones] = SumaSerieGeometrica(r)
% SUMASERIEGEOMETRICA Suma una serie geométrica ∑ r^i hasta convergencia
%   r - razón de la serie geométrica (|r| < 1 para convergencia)
%   suma_final   - valor aproximado de la suma infinita
%   iteraciones  - número de términos sumados

    suma_actual = 0;    % Acumulador de la suma
    suma_anterior = -1; % Inicializamos con un valor distinto para entrar al bucle
    iteraciones = 0;    % Contador de términos

    while suma_actual > suma_anterior
        suma_anterior = suma_actual;
        suma_actual = suma_actual + r^iteraciones;
        iteraciones = iteraciones + 1;
    end

    suma_final = suma_actual;

end

