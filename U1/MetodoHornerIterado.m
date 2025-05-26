function [raices] = MetodoHornerIterado(coef, x0, tol, max_iter)
    % MÉTODO DE HORNER ITERADO para encontrar raíces reales
    % coef: vector de coeficientes del polinomio
    % x0: aproximación inicial
    % tol: tolerancia
    % max_iter: número máximo de iteraciones

    raices = [];
    p = coef;

    while length(p) > 2
        x = x0;
        for i = 1:max_iter
            [b, c] = HornerDerivado(p, x);
            dx = -b(end)/c(end-1); % Newton-Raphson con Horner
            x = x + dx;
            if abs(dx) < tol
                break
            end
        end
        raices = [raices; x];
        % Deflación del polinomio
        p = b(1:end-1);
    end

    raices = [raices; -p(2)/p(1)]; % Última raíz (grado 1)
end