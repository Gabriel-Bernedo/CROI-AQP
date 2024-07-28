function Update_Electrodomestico(app)
    semana = app.Fi_Dias_ModificarE_1.Value;
    dia = app.Fi_Horas_ModificarE_1.Value;
    noche = app.Fi_Horas_ModificarE_2.Value;
    potencia = app.Fi_Modificar_ModificarE_1.Value;
    cantidad = app.Fi_Unidad_Electrodomestico.Value;
    tipo = app.D_Tipo_ModificarE_1.Value;
    selection = app.T_Electrodomesticos_Gestionar_1.Selection;
    sel = app.T_Electrodomesticos_Gestionar_1.Data([selection(:,1)], :);
    %(codigo, potencia, dia, noche, semana, cantidad, tipo)
    data = {sel{1}, potencia, dia, noche, semana, cantidad, tipo};
    app.M1 = app.M1.E_Electrodomesticos(data);
    Tabla_Electrodomesticos(app);
    app.B_Editar_Electrodomestico.Visible = "on";
    app.B_Actualizar_Electrodomestico.Visible = "off";
    app.B_Eliminar_Electrodomestico.Visible = "off";
    app.Fi_Modificar_ModificarE_1.Editable = "off";
    app.Fi_Dias_ModificarE_1.Editable = "off";
    app.Fi_Horas_ModificarE_1.Editable = "off";
    app.Fi_Horas_ModificarE_2.Editable = "off";
    app.Fi_Unidad_Electrodomestico.Editable = "off";
end