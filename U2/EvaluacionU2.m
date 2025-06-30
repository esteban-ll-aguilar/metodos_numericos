clc; clear; format long;

x = [10 20 30 40 50 70 100 130];
y = [80.2 139.9 110.2 69.8 49.4 29.8 49.6 19.7];


num_datos = length(x);


sum_x_y = [];

for i = 1:num_datos
    sum_x_y = [sum_x_y, x(i)*y(i)];
end

% disp(sum(sum_x_y))
% disp(sum(x)*sum(y))
% disp(sum((x).^2))
% disp(sum((x)).^2)

m_numerador = ((num_datos*sum(sum_x_y)) - sum(x)*sum(y))/ num_datos;
m_denominador = ((num_datos*sum((x).^2)) - sum((x)).^2) / num_datos;


m = m_numerador/m_denominador;

b_numerador = (sum(y)*sum((x).^2)) - sum(x) * sum(sum_x_y);
b_denominador = (num_datos*sum((x).^2)) - (sum(x)).^2;

b = b_numerador / b_denominador;



y = @(x) m*x+b;

disp(["La formula es: y = mx + b"])
disp(["En donde m vale:"])
disp(m)
disp(["Y donde b vale:"])
disp(b)



