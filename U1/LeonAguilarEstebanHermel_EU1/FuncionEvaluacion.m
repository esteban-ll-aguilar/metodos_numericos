function [lista_x0,lista_x1,lista_x2,lista_x3,lista_f3,lista_abs_x3_x2] = FuncionEvaluacion(funcion,x0,x1,x2,tolerancia)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    lista_x0 = [];
    lista_x1 = [];
    lista_x2 = [];
    lista_x3 = [];
    lista_f3 = [];
    lista_abs_x3_x2 = [];
    while true
        h1= x1-x0;
        h2= x2-x1;
    
        lamba1 = (funcion(x1)-funcion(x0))/h1;
        lamba2 = (funcion(x2)-funcion(x1))/h2;
    
        a = (lamba2-lamba1)/h2+h1;
        b = a*h2 + lamba2;
        c = funcion(x2);
    
        x3 = x2 + (-2*c/(b + sqrt(b.^2 - (4*a)*c)));
        
        abs_x3_x2 = abs(x3 - x2);
        lista_x0 = [lista_x0; x0];
        lista_x1 = [lista_x1; x1];
        lista_x2 = [lista_x2; x2];
        lista_x3 = [lista_x3; x3];
        lista_f3 = [lista_f3; funcion(x3)];
        lista_abs_x3_x2 = [lista_abs_x3_x2; abs_x3_x2];

        if abs_x3_x2 < tolerancia
            break
        end
        
        x0 = x1;
        x1 = x2;
        x2 = x3;
    end

    tabla = table(lista_x0(:),lista_x1(:), lista_x2(:),...
        lista_x3(:), lista_f3(:), lista_abs_x3_x2(:),...
        'VariableNames', {'x0', 'x1','x2', 'x3', 'f(x3)', '|x3-x2|'});
    disp(tabla)
end