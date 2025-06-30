function resultado = AlgoritmoHorner(c, x)
%HORNER Evalúa un polinomio usando el algoritmo de Horner
    resultado = c(1); % Comenzamos con el coeficiente de mayor grado
    for i = 2:length(c)
        resultado = resultado * x + c(i);
    end
end
