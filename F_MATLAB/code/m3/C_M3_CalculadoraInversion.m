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

    function obj = simular(obj)
      inv = zeros(obj.tiempo,1);
      ahorro = zeros(obj.tiempo,1);
      ahorro_acumulados = zeros(obj.tiempo,1);
      costos = zeros(obj.tiempo,1);
      costos_acumulados = zeros(obj.tiempo,1);
      inv(1) = 14000; % inversion.costoTotal();
      consumo = 10;
      costos(1) = consumo * 30 * 12 * (126 * 0.0027 + 0.4286);
      costos_acumulados(1) = costos(1);

      ahorro(1) = costos(1) - obj.costo_mantenimiento * obj.periodo_mantenimiento;
      ahorro_acumulados(1) = ahorro(1);
      for i = 2:obj.tiempo
        costos(i) = consumo * 30 * 12 * ((12 * i + 114) * 0.0027 + 0.4286);  
        costos_acumulados(i) = costos_acumulados(i - 1) + costos(i);
        ahorro(i) = costos(i) - obj.costo_mantenimiento * obj.periodo_mantenimiento;
        ahorro_acumulados(i) = ahorro_acumulados(i - 1) + ahorro(i); 
        inv(i) = inv(1);  % + inversion.costoReemplazo();
      end 
      

      obj.resultado = [inv, ahorro, ahorro_acumulados, costos, costos_acumulados];
    end

    function x = get_resultado(obj)
      x = obj.resultado;
      x = [x(:,1), x(:,3)];
    end

    function x = get_comparacion(obj)
      x = obj.resultado;
      roi = zeros(obj.tiempo,1);
      r = obj.get_ROI();
      for i = 1:obj.tiempo
        roi(i) = r;
      end
      x = [roi, x(:,4)];
    end

    function x = get_ROI(obj)
      x = obj.get_Total();
      x = x / (obj.tiempo);
    end

    function x = get_TIR(obj)
      x = obj.get_ROI();
      x = x / obj.get_Costo();
    end

    function x = get_PRI(obj)
      x = -1;
      for i = 1:obj.tiempo
        if obj.resultado(i,1) <= obj.resultado(i,3)
          x = i;
          break;
        end
      end
    end

    function x = get_BC(obj)
      x = obj.get_BeneficioTotal();
      x = x / obj.get_Costo();
    end

    function x = get_Total(obj)
      x = obj.resultado(obj.tiempo,3);
    end

    function x = get_BeneficioTotal(obj)
      x = obj.get_Total() - obj.get_Costo();
    end

    function x = get_Costo(obj)
      x = obj.resultado(1,1);
    end
  end
end