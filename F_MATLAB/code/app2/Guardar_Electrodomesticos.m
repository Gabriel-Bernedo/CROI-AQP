function Guardar_Electrodomesticos(app)
    drawnow;
    dia = app.Fi_HorasDias_IngresarE_1.Value
    noche = app.Fi_HorasNoche_1_IngresarE_1.Value
    semana = app.Fi_Uso_Semana_IngresarE_1.Value
    potencia = app.Fi_PotenciaEnWatts_IngresarE_1.Value
    tipo = 2;
    electrodomestico = 1;
    estado_registro = "A";
    data = table(dia, semana, noche, potencia, tipo, electrodomestico,estado_registro, 'VariableNames', {'EleUsuFreDia', 'EleUsuFreSem', 'EleUsuFreNoc', 'EleUsuPot', 'TipCod', 'EleUsuEleCod', 'EleUsuEstReg'});
    sqlwrite(conectarBD(), 'electrodomesticos_usuario', data);
end
