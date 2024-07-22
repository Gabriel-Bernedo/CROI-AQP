function Guardar_Electrodomesticos(app)
    drawnow;
    dia = app.Fi_HorasDias_IngresarE_1.Value;
    noche = app.Fi_HorasNoche_1_IngresarE_1.Value;
    semana = app.Fi_Uso_Semana_IngresarE_1.Value;
    potencia = app.Fi_PotenciaEnWatts_IngresarE_1.Value;
    tipo = Search("tipo","TipCod","TipNom",app.D_Tipo_anadir_IngresarE_1.Value);
    electrodomestico = Search("electrodomesticos","EleCod","EleNom",app.D_Electrodomesticos_IngresarE_1.Value);
    estado_registro = "A";
    data = table(dia, semana, noche, potencia, tipo.TipCod, electrodomestico.EleCod,estado_registro, 'VariableNames', {'EleUsuFreDia', 'EleUsuFreSem', 'EleUsuFreNoc', 'EleUsuPot', 'TipCod', 'EleUsuEleCod', 'EleUsuEstReg'});
    sqlwrite(conectarBD(), 'electrodomesticos_usuario', data);
end
