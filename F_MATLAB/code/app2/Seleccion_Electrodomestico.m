function Seleccion_Electrodomestico(app)
    drawnow;
    value = app.D_Electrodomesticos_IngresarE_1.Value;
    app.Fi_Nombre_anadir_IngresarE_1.Value = value;
    data = app.M1.Obj_Electrodomesticos(value);
    app.Fi_PotenciaEnWatts_IngresarE_1.Value = data.consumo_potencia_base;
end