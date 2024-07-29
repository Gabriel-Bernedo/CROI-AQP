% Selección de recibo, sin opción de eliminar

function Seleccion_Recibo_Tabla(app)
    app.Fi_ReciboCostoTotal_1.Editable ="off";
    app.Fi_ReciboConsumo_1.Editable = "off";
    app.B_EditarRecibo_1.Visible = "on";
    app.B_EliminarRecibo_1.Visible = "off";
    app.B_ActualizarRecibo_1.Visible = "off";
    selection = app.T_Recibo_1.Selection;
    rowData = app.T_Recibo_1.Data([selection(:,1)], :);
    app.Fi_ReciboCostoTotal_1.Value = rowData{3};
    app.Fi_ReciboConsumo_1.Value = rowData{2};
    app.D_Fecha_Recibo.Value = datetime(rowData{4}, rowData{5}, 1);
end

% Datos del recibo seleccionado