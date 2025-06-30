function [S, error_relativo] = SerieTaylor(x, N)

    S = 0;
    for n = 0:N-1
        S = S + (x^n)/factorial(n);
    end

    valor_exacto = exp(x);
    error_relativo = abs((valor_exacto - S) / valor_exacto) * 100; % %

end
