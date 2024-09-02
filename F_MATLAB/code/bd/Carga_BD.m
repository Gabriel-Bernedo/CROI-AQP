function Carga_BD(app)
    x = C_G_Tablas();
    x.SQLrecibos_usuario(app.M1.Get_Recibos());
    x.SQLelectrodomesticos_usuario(app.M1.Get_Electrodomesticos());
end