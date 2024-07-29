function Update_Recibo(app)
    consumo = app.Fi_ReciboConsumo_1.Value;
    costo = app.Fi_ReciboCostoTotal_1.Value;
    fecha = app.D_Fecha_Recibo.Value;
    Month = month(fecha);
    Year = year(fecha);
    selection = app.T_Recibo_1.Selection;
    sel = app.T_Recibo_1.Data([selection(:,1)], :);
    %(codigo, consumo, costo, Año, Mes)
   ques = sprintf('¿Estas seguro de actualizar:\nConsumo: %s\nCosto: %s\nAño: %s\nMes: %s', ...
               num2str(consumo), num2str(costo), num2str(Year), num2str(Month));
    opcion = uiconfirm(app.P_Main,ques, ...
    'Confirmacion', 'Options',{'Si','No'}, 'DefaultOption',2,'CancelOption',2, ...
    'Icon','warning');
    if strcmp(opcion,'Si')
        data = {sel{1},consumo,costo, Year, Month};
        app.M1 = app.M1.E_Recibos(data);
        Tabla_Recibos(app);
        Gestionar_Recibo_Default(app);
        app.Fi_ReciboCostoTotal_1.Editable ="off";
        app.Fi_ReciboConsumo_1.Editable = "off";
        app.B_EditarRecibo_1.Visible = "on";
        app.B_EliminarRecibo_1.Visible = "off";
        app.B_ActualizarRecibo_1.Visible = "off";
    end
end