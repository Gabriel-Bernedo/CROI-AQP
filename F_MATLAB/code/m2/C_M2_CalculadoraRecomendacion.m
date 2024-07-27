classdef C_M2_CalculadoraRecomendacion
  properties
    % recomendacion
    % tasa_interes
    usuario
    modelo_panel
    modelo_inversor
    modelo_bateria
    tipo_instalacion
    horas_dia
  end
  methods

    function obj = C_M2_CalculadoraRecomendacion(usuario)
      % obj.recomendacion = recomendacion;
      % obj.tasa_interes = tasa_interes;
      obj.horas_dia = 12;
      obj.usuario = usuario;
    end

    function obj = config_panel(obj, panel)
      obj.modelo_panel = panel;
    end

    function obj = config_inversor(obj, inversor)
      obj.modelo_inversor = inversor;
    end

    function obj = config_bateria(obj, bateria)
      obj.modelo_bateria = bateria;
    end

    function obj = config_tipo_instalacion(obj, tipo_instalacion)
      obj.tipo_instalacion = tipo_instalacion;
    end

    function x = calcular(obj)
      x = C_G_Recomendacion_PV(1, obj.modelo_panel, obj.modelo_bateria, obj.modelo_inversor, 0, 0); 
      x.optimizar(obj.usuario.consumoMensual(), obj.usuario.potenciaPico(), obj.horas_dia, obj.tipo_instalacion);
      obj.usuario.recomendacion = x;
    end
  end
end