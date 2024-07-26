classdef C_M3_CalculadoraInversion
  properties
    inversion
    % tasa_interes
    tiempo
    usuario
    costo_mantenimiento
    periodo_mantenimiento
  end
  methods
    function obj = C_M3_CalculadoraInversion(tiempo, costo_mantenimiento, periodo_mantenimiento)
      % obj.inversion = inversion;
      % obj.tasa_interes = tasa_interes;
      obj.costo_mantenimiento = costo_mantenimiento;
      obj.periodo_mantenimiento = periodo_mantenimiento;
      obj.tiempo = tiempo;
    end

    function x = simular(obj)
      ahorro = zeros(obj.tiempo,1);
      costo = zeros(obj.tiempo,1);
      ahorro(1) = 3400; % inversion.costoTotal();
      costo(1) = 0;
      for i = 2:obj.tiempo
        costo(i) = 5.233 * 30 * 12 * ((12 * i + 114) * 0.0027 + 0.4286) + costo(i - 1) + obj.costo_mantenimiento * obj.periodo_mantenimiento;
        ahorro(i) = ahorro(1);  % + inversion.costoReemplazo();
      end
      x = [ahorro, costo];
    end
  end
end