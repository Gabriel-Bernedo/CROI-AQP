classdef C_Producto
  properties
     potencia
     uso_dia
     uso_semana
     tipo
  end
  methods
     function obj = C_Producto(potencia, uso_dia, uso_semana, tipo)
        obj.potencia = potencia;
        obj.uso_dia = uso_dia;
        obj.uso_semana = uso_semana;
        obj.tipo = tipo;
     end
     function x = ConsumoTotal(obj)
        x = obj.potencia * obj.uso_dia * obj.uso_semana * mes;
     end
  end
end