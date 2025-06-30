function ErrorAbsolutoYRelativo(v_exact,v_aprox)
%ERRORABSOLUTOYRELATIVO Summary of this function goes here


% Calcular errores
error_absoluto = abs(v_exact - v_aprox);
error_relativo_porcentual = (error_absoluto ./ abs(v_exact)) * 100;

% Mostrar resultados en tabla
T = table(v_exact', v_aprox', error_absoluto', error_relativo_porcentual', ...
    'VariableNames', {'Valor_Exacto', 'Valor_Aproximado', 'Error_Absoluto', 'Error_Relativo_%'});

disp(T)

end

