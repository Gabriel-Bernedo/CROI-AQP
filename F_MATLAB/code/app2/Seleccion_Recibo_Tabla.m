function Seleccion_Recibo_Tabla(app)
    app.Fi_ReciboCostoTotal_1.Editable ="off";
    app.Fi_ReciboConsumo_1.Editable = "off";
    app.B_EditarRecibo_1.Visible = "on";
    app.B_EliminarRecibo_1.Visible = "off";
    app.B_ActualizarRecibo_1.Visible = "off";
    selection = app.T_Recibo_1.Selection;
    x = selection(:,1);
    rowData = app.T_Recibo_1.Data(x, :)
    app.Fi_ReciboCostoTotal_1.Value = rowData{3};
    app.Fi_ReciboConsumo_1.Value = rowData{2};
    app.D_Mes_Gestionar_1.Value = app.D_Mes_Gestionar_1.Items{rowData{5}};
end