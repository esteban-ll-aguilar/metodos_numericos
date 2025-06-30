% Función auxiliar que suma dos polinomios representados por sus coeficientes
function resultado = SumarPolinomios(polinomio1, polinomio2)
    longitud_maxima = max(length(polinomio1), length(polinomio2));
    polinomio1 = [zeros(1, longitud_maxima - length(polinomio1)), polinomio1];
    polinomio2 = [zeros(1, longitud_maxima - length(polinomio2)), polinomio2];
    resultado = polinomio1 + polinomio2;
end