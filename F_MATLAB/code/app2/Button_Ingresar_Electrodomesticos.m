%Función botón

function Button_Ingresar_Electrodomesticos(app)
    app.D_Ambiente_IngresarE_1.Items = app.M1.Item_Ambiente();
    app.D_Electrodomesticos_IngresarE_1.Items = app.M1.Item_Electrodomestico(app.D_Ambiente_IngresarE_1.Value);
    app.D_Tipo_anadir_IngresarE_1.Items = app.M1.Item_Tipo();
end

%No retorna nada