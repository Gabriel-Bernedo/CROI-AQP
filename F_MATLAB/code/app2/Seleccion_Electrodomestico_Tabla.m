function Seleccion_Electrodomestico_Tabla(app)
    selection = app.T_Electrodomesticos_Gestionar_1.Selection
    sel = app.T_Electrodomesticos_Gestionar_1.Data(selection(:,1), :);
    app.NombreLabel.Text = sel{2};
    app.Fi_Horas_ModificarE_1.Value = sel{4};
    app.Fi_Modificar_ModificarE_1.Value = sel{3};
    app.Fi_Dias_ModificarE_1.Value = sel{6};
    app.Fi_Horas_ModificarE_2.Value = sel{5};
    app.Fi_Unidad_Electrodomestico.Value = sel{7};
    tipoValue = sel{8};
    app.D_Tipo_ModificarE_1.Items = [app.D_Tipo_ModificarE_1.Items, tipoValue];
    app.D_Tipo_ModificarE_1.Value = tipoValue;
    app.B_Editar_Electrodomestico.Visible = "on";
end