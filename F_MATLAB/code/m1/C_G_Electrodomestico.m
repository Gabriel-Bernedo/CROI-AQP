%{

% C_G_Electrodomestico

% elec = C_G_Electrodomestico(elec_base, codigo, consumo, frecuencia_dia, frecuencia_noche, frecuencia_semana, tipo)
   % elec_base: instancia de C_G_ElectrodomesticoBase
   % codigo: codigo del electrodomestico
   % consumo: potencia de consumo en watts
   % frecuencia_dia: horas de uso diario
   % frecuencia_noche: horas de uso nocturno
   % frecuencia_semana: dias de uso a la semana
   % tipo: Intancia de C_G_TipoElectrodomestico

% elec.ConsumoDia()
// consumo total en el día

% elec.ConsumoNoche()
// consumo total en la noche

% elec.ConsumoDiario()
// consumo total en todo el dia

%}

classdef C_G_Electrodomestico < C_G_ElectrodomesticoBase
   properties
      codigo
      consumo_potencia
      frecuencia_dia
      frecuencia_noche
      frecuencia_semana
      cantidad
      tipo
   end
   methods
       function obj = C_G_Electrodomestico(elec_base, codigo, consumo, frecuencia_dia, frecuencia_noche, frecuencia_semana, cantidad, tipo)
         obj = obj@C_G_ElectrodomesticoBase(elec_base.base_codigo, elec_base.nombre, elec_base.consumo_potencia_base, elec_base.ambiente);

%  %captura de excepciones de entrada de parametros invalidos
%          if nombre == ""
%              ME = MException('C_Electrodomestico:Invalid_Param', 'Ingrese un nombre');
%             throw(ME);
%          elseif potencia < 1
%             ME = MException('C_Electrodomestico:Invalid_Param', 'Ingrese un consumo válido (> 0)');
%             throw(ME);
%          elseif horas_dia > 24 || horas_dia < 1
%             ME = MException('C_Electrodomestico:Invalid_Param', 'Ingrese un número de horas válido');
%             throw(ME);
%          elseif horas_noche> 24 || horas_noche < 1
%             ME = MException('C_Electrodomestico:Invalid_Param', 'Ingrese un número de horas válido');
%             throw(ME);
%          elseif dia_semana > 7 || dia_semana < 1
%             ME = MException('C_Electrodomestico:Invalid_Param', 'Ingrese un número de días válido');
%             throw(ME);
%          else%agrega un objeto de forma exitosa
%             obj.nombre = nombre;
%             obj.potencia = potencia;
%             obj.horas_dia = horas_dia;
%             obj.horas_noche = horas_noche;   
%             obj.dia_semana = dia_semana;
%             obj.tipo = tipo;
%          end

         obj.codigo = codigo;
         obj.consumo_potencia = consumo;
         obj.frecuencia_dia = frecuencia_dia;
         obj.frecuencia_noche = frecuencia_noche;
         obj.frecuencia_semana = frecuencia_semana;
         obj.cantidad = cantidad;
         obj.tipo = tipo;
         
      end

      function x = ConsumoDia(obj)
         x = obj.consumo_potencia * obj.frecuencia_dia;
      end

      function x = ConsumoNoche(obj)
         x = obj.consumo_potencia * obj.frecuencia_noche;
      end

      function x = ConsumoDiario(obj)
         x = obj.ConsumoDia() + obj.ConsumoNoche();
      end

      function x = ConsumoDiaPromedio(obj)
         x = obj.ConsumoDia() * obj.frecuencia_semana / 7;
         if obj.tipo == "Esencial"
            x = x * 0.80;
         elseif obj.tipo == "No Esencial"
            x = x * 0.60;
         end
      end

      function x = ConsumoNochePromedio(obj)
         x = obj.ConsumoNoche() * obj.frecuencia_semana / 7;
         if obj.tipo == "Esencial"
            x = x * 0.80;
         elseif obj.tipo == "No Esencial"
            x = x * 0.60;
         end
      end

      function x = ConsumoDiarioPromedio(obj)
         x = obj.ConsumoDiaPromedio() + obj.ConsumoNochePromedio();
      end

      function x = ConsumoMensual(obj)
         x = obj.ConsumoDiarioPromedio() * 30;
      end

      function data = to_String(obj)
          data = {obj.codigo,obj.nombre, obj.consumo_potencia, obj.frecuencia_dia, obj.frecuencia_noche, obj.frecuencia_semana,obj.cantidad, obj.tipo.nombre};
      end


      % function x = ConsumoTotal(obj, mes)
      %     %calcula el consumo total de n meses
      %   %donde n = parametro mes
      %    x = obj.potencia * (obj.horas_dia + obj.horas_noche) * obj.dia_semana * 4 *mes;
      %    if obj.tipo == "Esencial"
      %          x = x * 0.80;
      %    elseif obj.tipo == "No Esencial"
      %          x = x * 0.60;
      %    end
      % end
   end
end