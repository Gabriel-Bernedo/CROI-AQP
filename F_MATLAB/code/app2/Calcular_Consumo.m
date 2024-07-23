function Calcular_Consumo(app)
electrodomesticos = Registro_Tabla("electrodomesticos_usuario");
semana = sum(electrodomesticos.EleUsuPot .* electrodomesticos.EleUsuFreSem);
%
app.Fi_ConsumoPromedio_CalcularConsumo_1.Value = semana * 4.3/30;
%30 dias
app.Fi_ConsumeMensual_CalcularConsumo_1.Value = semana * 4.3;
end