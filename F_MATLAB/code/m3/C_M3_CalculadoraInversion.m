classdef C_M3_CalculadoraInversion
  properties
    inversion
    tasa_interes
    tiempo
  end
  methods
    function obj = C_M3_CalculadoraInversion(inversion, tasa_interes, tiempo)
      obj.inversion = inversion;
      obj.tasa_interes = tasa_interes;
      obj.tiempo = tiempo;
    end

  end
end