clc; clear; format long;

f = @(x, y) [
    y(2);         % y1' = y2
    y(3);         % y2' = y3
    y(4);         % y3' = y4
    (x - 1).^2 - 2*y(3) - y(1)];  % y4' = (x - 1).^2 - 2*y(3) - y(1)

a = 1;
b = 2;
N = 10;
y0 = [1,2,-3,2];

[xEuler,yEuler] = SistemaNEcuacionesEuler(f,a,b,y0,N);
[xHeun,yHeun] = SistemaNEcuacionesHeum(f,a,b,y0,N);
[xRugeKutta,yRugeKutta] = SistemaNEcuacionesRugeKutta(f,a,b,y0,N);

disp(table(array2table(xEuler), array2table(yEuler),...
           array2table(yHeun), array2table(yRugeKutta),...
    'VariableNames',{'xEuler', 'Resultados Euler', 'Resultados Heun', 'Resultados Ruge Kutta'}))

