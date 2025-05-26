function [resultado] = SerieDeTaylor(funcion, inicio, final, h, x)
%SERIEDETAYLOR Summary of this function goes here
%   Detailed explanation goes here
% inicio/desde
% final/hasta
f_xi = funcion(x);
resultado =  f_xi;

inter = inicio;
while true
    if inter > 0
        derivada = diff(funcion);
    
        resultado =  resultado + (derivada / factorial(inter))* h^inter;
        
        if inter <= final
            break
        end
        derivada = diff(derivada);
    end
    
    inter = inter +1;
        
 end

end

