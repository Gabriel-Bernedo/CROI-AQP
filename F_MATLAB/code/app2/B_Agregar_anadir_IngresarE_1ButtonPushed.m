function B_Agregar_anadir_IngresarE_1ButtonPushed(app)
    dia = app.Fi_HorasDias_IngresarE_1.Value;
    noche = app.Fi_HorasNoche_1_IngresarE_1.Value;
    semana = app.Fi_Uso_Semana_IngresarE_1.Value;
    potencia = app.Fi_PotenciaEnWatts_IngresarE_1.Value;
    cantidad = app.Fi_Cantidad_IngresarE_1.Value;
    tipo = app.BD.Search("tipo","TipCod","TipNom",app.D_Tipo_anadir_IngresarE_1.Value);
    electrodomestico = app.BD.Search("electrodomesticos","EleCod","EleNom",app.D_Electrodomesticos_IngresarE_1.Value);
    estado_registro = "A";
    data = table(dia, semana, noche, potencia,cantidad, tipo.TipCod, electrodomestico.EleCod,estado_registro, 'VariableNames', {'EleUsuFreDia', 'EleUsuFreSem', 'EleUsuFreNoc', 'EleUsuPot', 'EleUsuCant' , 'TipCod', 'EleUsuEleCod', 'EleUsuEstReg'});
    app.BD.Insertar_Registro("electrodomesticos_usuario",data);
end