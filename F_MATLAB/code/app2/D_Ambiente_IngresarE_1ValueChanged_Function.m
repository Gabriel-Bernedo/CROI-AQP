function D_Ambiente_IngresarE_1ValueChanged_Function(app)
    AmbId = app.BD.Search("ambiente","AmbCod", "AmbNom" ,app.D_Ambiente_IngresarE_1.Value).AmbCod;
    app.D_Electrodomesticos_IngresarE_1.Items = app.BD.Search("electrodomesticos", "EleNom",  "ambCod", num2str(AmbId)).EleNom;
end