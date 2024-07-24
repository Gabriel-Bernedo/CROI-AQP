function IngresarElectrodomesticosView_Function(app)
    app.D_Ambiente_IngresarE_1.Items = (app.BD.Registro_Tabla('ambiente').AmbNom)';
    AmbId = app.BD.Search("ambiente","AmbCod", "AmbNom" ,app.D_Ambiente_IngresarE_1.Value).AmbCod;
    app.D_Electrodomesticos_IngresarE_1.Items = app.BD.Search("electrodomesticos", "EleNom",  "ambCod", num2str(AmbId)).EleNom;
    app.D_Tipo_anadir_IngresarE_1.Items = (app.BD.Registro_Tabla('tipo').TipNom)';
end