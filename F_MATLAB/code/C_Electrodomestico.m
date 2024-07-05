classdef C_Electrodomestico
   properties
      nombre
      potencia
      horas_dia
      dia_semana
      tipo
   end
   methods
      function obj = C_Electrodomestico(nombre, potencia, horas_dia, dia_semana, tipo)
         if dia_semana > 7 || dia_semana < 1
            ME = MException('C_Electrodomestico:Invalid_Param', 'Ingrese un número de días válido');
            throw(ME);
         elseif horas_dia > 24 || horas_dia < 1
            ME = MException('C_Electrodomestico:Invalid_Param', 'Ingrese un número de horas válido');
            throw(ME);
         elseif potencia < 1
            ME = MException('C_Electrodomestico:Invalid_Param', 'Ingrese un consumo válido (> 0)');
            throw(ME);
         else
            obj.nombre = nombre;
            obj.potencia = potencia;
            obj.horas_dia = horas_dia;
            obj.dia_semana = dia_semana;
            obj.tipo = tipo;
         end
      end
      function x = ConsumoTotal(obj, mes)
         x = obj.potencia * obj.horas_dia * obj.dia_semana * mes;
         if obj.tipo == "Esencial"
               x = x * 0.80;
         elseif obj.tipo == "No Esencial"
               x = x * 0.60;
         end
      end
   end
end