%Calcula el consumo promedio semanal

function Calcular_Consumo(app)
electrodomesticos = app.M1.Table_Electrodomesticos()
C_M = [];
C_M_R = [];
if ~isempty(electrodomesticos)
   for i = 1 : height(electrodomesticos)
        potencia = electrodomesticos{i, 3};
        dia = electrodomesticos{i, 4};
        noche = electrodomesticos{i, 5};
        semana = electrodomesticos{i, 6};
        cantidad = electrodomesticos{i, 7};
        C_M(end+1) = (potencia * (dia + noche) * semana)* 4.3;
        tipo = 0;
        if strcmp(electrodomesticos{i,8}, "Altamente Esencial")
            tipo = 1;
        elseif strcmp(electrodomesticos{i,8}, "Esencial")
            tipo = 0.8;
        else
            tipo = 0.6;
        end
        S_T = ((semana/7)+tipo)/2;
        C_M_R(end+1) = C_M(end)*S_T;
   end
end
disp(C_M);
disp(C_M_R);
app.Ln_Consumo_Mensual.Value = sum(C_M);
app.Ln_Consumo_Mensual_Promedio.Value = sum(C_M)/30;
app.Ln_Potencia_Pico.Value = (sum(C_M)/30)/9;
app.Ln_Consumo_Relativo.Value = sum(C_M_R);
app.Ln_Consumo_Relativo_Promedio.Value = sum(C_M_R)/30;
app.Ln_Potencia_Pico_Relativa.Value = (sum(C_M_R)/30)/9;
%app.Fi_ConsumoPromedio_CalcularConsumo_1.Value = C_M;
%semana = sum(electrodomesticos.EleUsuPot .* electrodomesticos.EleUsuFreSem);
%
%app.Fi_ConsumoPromedio_CalcularConsumo_1.Value = semana * 4.3/30;
%30 dias
%app.Fi_ConsumeMensual_CalcularConsumo_1.Value = semana * 4.3;
end

%Retorna los consumos promedio