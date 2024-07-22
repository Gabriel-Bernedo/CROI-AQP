function Carga_Electrodomesticos(app)
    drawnow;
    value = app.D_Electrodomesticos_IngresarE_1.Value;
    app.Fi_Nombre_anadir_IngresarE_1.Value = value;
    query = sprintf('SELECT ElePotCon FROM electrodomesticos WHERE EleNom = ''%s''',value);
    data = fetch(conectarBD(), query)
    data = data.ElePotCon;
    app.Fi_PotenciaEnWatts_IngresarE_1.Value = data;
end