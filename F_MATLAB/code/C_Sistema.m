% Sistema PV que se considera solucion para el consumo del usuario
classdef C_Sistema
  properties
    paneles
    baterias
    inversores
  end
  methods
    function x = C_Sistema(Costo_TOTAL,Ahorros_Ani)
        x = Costo_TOTAL / Ahorros_Ani;
    end
  end
end