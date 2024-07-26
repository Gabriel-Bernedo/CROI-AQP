function D_Electrodomesticos_IngresarE_1Clicked_Function(app)
    drawnow;
    value = app.D_Electrodomesticos_IngresarE_1.Value;
    app.Fi_Nombre_anadir_IngresarE_1.Value = value;
    data = app.BD.Search("electrodomesticos","ElePotCon","EleNom",value);
    app.Fi_PotenciaEnWatts_IngresarE_1.Value = data.ElePotCon;
end