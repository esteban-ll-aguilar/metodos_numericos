function [raiz, iteraciones] = MetodoMuller(f, x0, x1, x2, tol, max_iter)
    % MÉTODO DE MÜLLER
    % f: función anónima
    % x0, x1, x2: tres valores iniciales
    % tol: tolerancia
    % max_iter: máximo número de iteraciones

    if nargin < 6
        max_iter = 100;
    end

    iteraciones = 0;

    while iteraciones < max_iter
        h1 = x1 - x0;
        h2 = x2 - x1;
        δ1 = (f(x1) - f(x0)) / h1;
        δ2 = (f(x2) - f(x1)) / h2;
        d = (δ2 - δ1) / (h2 + h1);

        b = δ2 + h2 * d;
        D = sqrt(b^2 - 4 * f(x2) * d);

        if abs(b - D) < abs(b + D)
            E = b + D;
        else
            E = b - D;
        end

        h = -2 * f(x2) / E;
        x3 = x2 + h;

        iteraciones = iteraciones + 1;

        if abs(h) < tol
            raiz = x3;
            return;
        end

        % Avanzar
        x0 = x1;
        x1 = x2;
        x2 = x3;
    end

    raiz = x3;
end
