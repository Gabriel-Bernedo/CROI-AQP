%{
ejemplo con mi recivo de luz, consumo = 157mil kWh al mes
se duerme 8 horas, por lo cual el consumo se basa en DVR, camaras y refri
de 8am a 2pm no se usa mucho, se restan otras 6 horas
quedando 10 horas de uso aproximado
consumo diario = 5233
consumo por hora aprox(no pico, sino promedio) = 5233/10 = 523Wh
%}
calc = C_Calculator(2600); % con este consumo se debe tener 6 baterias de 100Ah
disp(calc.consumoHora);

% Llamada al método Calc_Cant_Baterias para calcular y actualizar cantBat y tipoBat
calc = calc.Calc_Cant_Baterias();

fprintf('La cantidad de baterias de %d Ah es: %d\n', calc.tipoBat, calc.cantBat);