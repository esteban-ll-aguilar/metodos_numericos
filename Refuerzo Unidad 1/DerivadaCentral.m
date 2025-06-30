function dfdx = DerivadaCentral(f, df_exacta, x0, h)

dfdx = (f(x0 + h) - f(x0 - h)) / (2 * h);
    valor_exacto = df_exacta(x0);
    error = abs(valor_exacto - dfdx);

    fprintf('Derivada numérica central en x=%.6f: %.8f\n', x0, dfdx);
    fprintf('Derivada exacta en x=%.6f: %.8f\n', x0, valor_exacto);
    fprintf('Error absoluto: %.10f\n', error);
end
