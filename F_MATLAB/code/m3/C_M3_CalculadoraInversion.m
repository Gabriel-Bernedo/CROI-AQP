classdef C_M3_CalculadoraInversion
  properties
    inversion
    % tasa_interes
    tiempo
    usuario
    costo_mantenimiento
    periodo_mantenimiento
    resultado
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
      inv = zeros(obj.tiempo,1);
      ahorro = zeros(obj.tiempo,1);
      inv(1) = 3400; % inversion.costoTotal();
      ahorro(1) = 0;
      for i = 2:obj.tiempo
        ahorro(i) = 5.233 * 30 * 12 * ((12 * i + 114) * 0.0027 + 0.4286) + costo(i - 1) - obj.costo_mantenimiento * obj.periodo_mantenimiento;
        inv(i) = inv(1);  % + inversion.costoReemplazo();
      end
      x = [inv, ahorro];
      obj.resultado = x;
    end
    function x = get_ROI(obj)
      x = 0;
      obj.resultado;
      for i = 1:obj.tiempo
        x = x + obj.resultado(i,2);
      end
      x = x / obj.tiempo;
    end
    function x = get_PRI(obj)
      x = obj.get_ROI();
      x = x / obj.resultado(1,1);
    end
    function x = get_TIR(obj)
      x = -1;
      for i = 1:obj.tiempo
        if obj.resultado(i,1) <= obj.resultado(i,2)
          x = i;
          break;
        end
      end
    end
  end
end