%%
x = M1_Calculadora_Consumo();
%(consumo, costo,RecA,RecM)
y = {2, 2, 5, 1};
x = x.I_Recibos(y)
z = x.Get_Recibos()
%%
%x = x.D_Recibos(1)
z = x

%%
y = {5,20, 20, 2015, 6};
x = x.E_Recibos(y);
z = x.Get_Recibos()
%%
x = M1_Calculadora_Consumo();
z = x.Table_Electrodomesticos();
%%
tabla = C_G_Tablas();
z = x.Get_Recibos();
tabla.SQLrecibos_usuario(z);