function [a,b, interacciones] = LocalizandoRaices(funcion,a,b, N)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    h = (b-a)/N;
    x = (a:h:b);
    y = funcion(x);
    a = [];
    b = [];
    interacciones = 0;
    
    for i = 1:(N-1)
         if y(i)*y(i+1) <= 0 % The sign changed, record it
             a = [a x(i)];
             b = [b x(i+1)];
             interacciones = interacciones +1;
         end
    end
    if size(a,1) == 0
        warning('No se encontraron raices funcionales')
    end
end