clc; clear; format long;

% Parámetros del modelo físico (función periódica de temperatura)
amplitud = 10;    
frecuencia = pi/12;  
fase = -5*pi/12;
offset = 20;

% Cargar datos desde archivo CSV (horas y temperaturas reales)
datos = csvread('Temperatura_vs_Hora.csv', 1, 0);
horas = datos(:, 1);
temperaturas = datos(:, 2);

% Vector de evaluación cada 0.25 horas
tiempos_eval = min(horas):0.25:max(horas);
modelo_fisico = amplitud * sin(frecuencia * tiempos_eval + fase) + offset;

% Grados de polinomios a probar
grados_polinomio = [4, 6, 8];
errores_newton = zeros(size(grados_polinomio));
errores_lagrange = zeros(size(grados_polinomio));
tiempos_newton = zeros(size(grados_polinomio));
tiempos_lagrange = zeros(size(grados_polinomio));

% Para guardar resultados de interpolaciones
interpolaciones_newton = cell(length(grados_polinomio), 1);
interpolaciones_lagrange = cell(length(grados_polinomio), 1);
nodos_interpolacion = cell(length(grados_polinomio), 1);

fprintf('Iniciando cálculo de interpolaciones...\n');

for k = 1:length(grados_polinomio)
    grado = grados_polinomio(k);
    paso = floor((length(horas) - 1) / grado);
    indices_nodos = 1:paso:(1 + paso * grado);
    if length(indices_nodos) > grado + 1
        indices_nodos = indices_nodos(1:grado+1);
    end

    x_nodos = horas(indices_nodos);
    y_nodos = temperaturas(indices_nodos);
    nodos_interpolacion{k} = [x_nodos, y_nodos];

    fprintf('Grado %d: Utilizando %d nodos de interpolación\n', grado, length(x_nodos));

    % Interpolación con método de Newton
    tic;
    valores_interp_newton = zeros(size(tiempos_eval));
    for i = 1:length(tiempos_eval)
        valores_interp_newton(i) = MetodoDiferenciasDivididas(x_nodos, y_nodos, tiempos_eval(i));
    end
    tiempos_newton(k) = toc;
    errores_newton(k) = sqrt(mean((valores_interp_newton - modelo_fisico).^2));
    interpolaciones_newton{k} = valores_interp_newton;

    % Interpolación con método de Lagrange
    tic;
    valores_interp_lagrange = zeros(size(tiempos_eval));
    for i = 1:length(tiempos_eval)
        valores_interp_lagrange(i) = MetodoLagrange(x_nodos, y_nodos, tiempos_eval(i));
    end
    tiempos_lagrange(k) = toc;
    errores_lagrange(k) = sqrt(mean((valores_interp_lagrange - modelo_fisico).^2));
    interpolaciones_lagrange{k} = valores_interp_lagrange;
end

% TABLA
% ===================================================================

tabla_resultados = table(...
    grados_polinomio', ...
    errores_newton', ...
    errores_lagrange', ...
    tiempos_newton', ...
    tiempos_lagrange', ...
    'VariableNames', {'Grado', 'Error_RMS_Newton', 'Error_RMS_Lagrange', 'Tiempo_Newton', 'Tiempo_Lagrange'});

fprintf('\nRESULTADOS:\n');
disp(tabla_resultados);

% GRÁFICA 1: Interpolacion con nodos cada 3 horas (grado 8)
% ===================================================================

indice_fig1 = find(grados_polinomio == 8); % nodos cada 3 horas
figure('Name', 'Fig. 2 - Nodos cada 3h, dominio 0.25', 'Position', [100, 100, 900, 600]);

plot(tiempos_eval, modelo_fisico, 'b-', 'LineWidth', 2, 'DisplayName', 'Modelo físico');
hold on;
plot(tiempos_eval, interpolaciones_newton{indice_fig1}, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Interpolación Newton');
plot(tiempos_eval, interpolaciones_lagrange{indice_fig1}, 'g:', 'LineWidth', 1.5, 'DisplayName', 'Interpolación Lagrange');
xlabel('Tiempo (horas)');
ylabel('Temperatura (°C)');
title('Fig. 2. Interpolación con nodo cada 3h y dominio 0.25');
legend('Location', 'best');
grid on;
hold off;

% GRÁFICA 2: Interpolacion con nodos cada 8 horas (grado 4)
% ===================================================================

indice_fig2 = find(grados_polinomio == 4); % nodos cada 8 horas
figure('Name', 'Fig. 3 - Nodos cada 8h, dominio 0.10', 'Position', [100, 100, 900, 600]);

plot(tiempos_eval, modelo_fisico, 'b-', 'LineWidth', 2, 'DisplayName', 'Modelo físico');
hold on;
plot(tiempos_eval, interpolaciones_newton{indice_fig2}, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Interpolación Newton');
plot(tiempos_eval, interpolaciones_lagrange{indice_fig2}, 'g:', 'LineWidth', 1.5, 'DisplayName', 'Interpolación Lagrange');
xlabel('Tiempo (horas)');
ylabel('Temperatura (°C)');
title('Fig. 3. Interpolación con nodo cada 8h y dominio 0.10');
legend('Location', 'best');
grid on;
hold off;
