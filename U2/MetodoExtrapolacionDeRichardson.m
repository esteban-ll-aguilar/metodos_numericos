function MetodoExtrapolacionDeRichardson(f, x, h1, h2)

    % Derivadas centradas con pasos h1 y h2
    D1 = (f(x + h1) - f(x - h1)) / (2 * h1);
    D2 = (f(x + h2) - f(x - h2)) / (2 * h2);

    % Extrapolación de Richardson
    D = (4/3) * D2 - (1/3) * D1;

    % Resultados
    disp('D ~=');
    disp(D);

end
