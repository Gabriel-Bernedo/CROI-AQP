%{
ejemplo con mi recivo de luz, consumo = 157mil kWh al mes
se duerme 8 horas, por lo cual el consumo se basa en DVR, camaras y refri
de 8am a 2pm no se usa mucho, se restan otras 6 horas
quedando 10 horas de uso aproximado
se usara despues
consumo diario = 5233
%}
%se indica el consumo diario, las horas de radiacion solar y las horas de
%uso sin radiacion
calc = C_Calculator(5233, 5, 18); 
% se debe tener 5 baterias de 100Ah para 5233, 5, 18
calc = calc.Calc_Cant_Baterias();
% se debe tener 8 paneles de 150Ah para 5233, 5, 18
calc = calc.Calc_Cant_Paneles();
% debe de re
calc = calc.Calc_Inversor();
calc = calc.Calc_Total();