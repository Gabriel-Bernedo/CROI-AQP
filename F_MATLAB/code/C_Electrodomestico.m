classdef C_Electrodomestico
   properties
      nombre
      potencia
      horas_dia
      dia_semana
      tipo
   end
   methods
      function obj = C_Producto(nombre, potencia, horas_dia, dia_semana, tipo)
         obj.nombre = nombre;
         obj.potencia = potencia;
         obj.horas_dia = horas_dia;
         obj.dia_semana = dia_semana;
         obj.tipo = tipo;
      end
      function x = ConsumoTotal(obj, mes)
         x = obj.potencia * obj.horas_dia * obj.dia_semana * mes;
      end
   end
end