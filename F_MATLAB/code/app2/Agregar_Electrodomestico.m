function Agregar_Electrodomestico(app)
    dia = app.Fi_HorasDias_IngresarE_1.Value;
    noche = app.Fi_HorasNoche_1_IngresarE_1.Value;
    semana = app.Fi_Uso_Semana_IngresarE_1.Value;
    potencia = app.Fi_PotenciaEnWatts_IngresarE_1.Value;
    cantidad = app.Fi_Cantidad_IngresarE_1.Value;
    electrodomestico = app.Fi_Nombre_anadir_IngresarE_1.Value;
    tipo = app.D_Tipo_anadir_IngresarE_1.Value;
    datos = {electrodomestico, potencia, dia, noche, semana, cantidad, tipo};
    %FRONTEND :: % % ("name_E",potencia, dia, noche, semana, cantidad, tipo)
    app.M1 = app.M1.I_Electrodomesticos(datos);
    disp(app.M1.Get_Electrodomesticos());
end