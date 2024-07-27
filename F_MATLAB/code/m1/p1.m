x = M1_Calculadora_Consumo();
% ("name_E",potencia, dia, noche, semana, cantidad, tipo)
y = {"Laptop", 2, 2, 5, 1, 1, "Altamente Esencial"};
x = x.I_Electrodomesticos(y);
%x.electrodomesticos(end+1) = z;
%disp(x.Get_Electrodomesticos());
x = x.D_Electrodomesticos(9);
y = {"Laptop", 400,300, 500, 800, 1, "No Esencial"};
x = x.I_Electrodomesticos(y);
tabla = C_G_Tablas();
%tabla.SQLelectrodomesticos_usuario(x.Get_Electrodomesticos());
%%
x = x.D_Electrodomesticos(9);
%%
%FRONTEND :: % (codigo, potencia, dia, noche, semana, cantidad, tipo)
y = {7, 2,2, 5, 800, 100, "No Esencial"};
x = x.E_Electrodomesticos(y);
%%
tabla.SQLelectrodomesticos_usuario(x.Get_Electrodomesticos());
