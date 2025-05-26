function [polinomio] = ConstruirPolinomioString(vector)
    %CONSTRUIRPOLINOMIOSTRING 
    %   A partir de un vector dado retorna un string con las potencias
    %   correspondientes en el orden que fue dado el vector
    tamano_vc = length(vector);
    polinomio = "";
    for i = 1:tamano_vc
        coef = vector(i);
        exponente = tamano_vc - i;
    
        % Saltar coeficiente 0
        if coef == 0
            continue
        end
    
        % Signo (solo se pone + si no es el primer término)
        if coef > 0 && i > 1
            signo = " + ";
        elseif coef < 0
            signo = " - ";
            coef = abs(coef); % eliminar el signo negativo para mostrarlo solo una vez
        else
            signo = "";
        end
    
        % Construcción del término
        if exponente == 0
            termino = string(coef);
        elseif coef == 1
            termino = "x";
            if exponente > 1
                termino = "x^" + string(exponente);
            end
        else
            termino = string(coef) + "*x";
            if exponente > 1
                termino = termino + "^" + string(exponente);
            end
        end
        % Concatenar al polinomio
        polinomio = polinomio + signo + termino;
    end
end

