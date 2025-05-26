function resultado = MetodoHorner(coef, x)
    % MÉTODO DE HORNER para evaluar polinomios
    % coef: vector de coeficientes [a_n, ..., a_0]
    % x: valor en el que evaluar el polinomio

    n = length(coef);
    resultado = coef(1);
    for i = 2:n
        resultado = resultado * x + coef(i);
    end
end
