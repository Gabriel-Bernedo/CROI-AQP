classdef C_M3_CalculadoraInversion
  properties
    inversion
    tasa_interes
    tiempo
    usuario
    costo_mantenimiento
    periodo_mantenimiento
  end
  methods
    function obj = C_M3_CalculadoraInversion(inversion, tasa_interes, tiempo)
      obj.inversion = inversion;
      obj.tasa_interes = tasa_interes;
      obj.tiempo = tiempo;
    end

    function x = simular(obj, inversion)
      inversion = zeros(obj.tiempo,1);
      costo = zeros(obj.tiempo,1);
      inversion(0) = inversion.costoTotal();
      costo(0) = 0;
      for i = 1:obj.tiempo
        costo(i) = obj.usuario.consumoMensual() * 12 * ((12 * i + 114) * 0.0027 + 0.4286) + costo(i - 1);
        inversion(i) = inversion(i - 1) - costo(i) + obj.costo_mantenimiento / obj.periodo_mantenimiento;
      end
    end
  end
end