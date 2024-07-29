%Calcula el consumo promedio semanal

function Calcular_Consumo(app)
electrodomesticos = app.M1.Table_Electrodomesticos();
C_M = 0;
if ~isempty(electrodomesticos)
   for i = 1 : height(electrodomesticos)
        potencia = cell2mat(electrodomesticos(i, 3));
        dia = cell2mat(electrodomesticos(i, 4));
        noche = cell2mat(electrodomesticos(i, 5));
        semana = cell2mat(electrodomesticos(i, 6));
        cantidad = cell2mat(electrodomesticos(i, 7));
        C_M = C_M + ((potencia * (dia + noche) * semana)* 4.3);   
   end
end
app.Fi_ConsumoPromedio_CalcularConsumo_1.Value = C_M;
%semana = sum(electrodomesticos.EleUsuPot .* electrodomesticos.EleUsuFreSem);
%
%app.Fi_ConsumoPromedio_CalcularConsumo_1.Value = semana * 4.3/30;
%30 dias
%app.Fi_ConsumeMensual_CalcularConsumo_1.Value = semana * 4.3;
end

%Retorna los consumos promedio