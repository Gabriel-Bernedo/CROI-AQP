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
x = x.D_Electrodomesticos(14);
%%
%FRONTEND :: % (codigo, potencia, dia, noche, semana, cantidad, tipo)
y = {7, 2,2, 5, 800, 100, "No Esencial"};
x = x.E_Electrodomesticos(y);
%%
tabla.SQLelectrodomesticos_usuario(x.Get_Electrodomesticos());
%%
x = M1_Calculadora_Consumo();
y = x.Item_Electrodomestico("Sala")
%%
x = M1_Calculadora_Consumo();
y = {"Laptop", 2, 2, 5, 1, 1, "Altamente Esencial"};
x = x.I_Electrodomesticos(y);
%%
ambiente = sqlread(conectarBD(),"panelsolar");
sel = ambiente(ambiente.PanCod == 1,:);
nombre = sel.PanMod;
%%
%x = M1_Calculadora_Consumo();
%(consumo, costo,RecA,RecM)
y = {2, 2, 5, 1};
x = x.I_Recibos(y)
z = x.Get_Recibos()
%%
x = x.D_Recibos(22)
%%
y = {3,20, 20, 2015, 6};
x = x.E_Recibos(y);
z = x.Get_Recibos()
%%
x = M1_Calculadora_Consumo();
z = x.Table_Electrodomesticos();
%%
%tabla = C_G_Tablas();
z = x.Get_Recibos();
tabla.SQLrecibos_usuario(z);