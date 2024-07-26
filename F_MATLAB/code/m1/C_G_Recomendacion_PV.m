%{

% Recomendacion_PV = C_G_Recomendacion_PV(codigo, panel, bateria, inversor, cantidad_panel, cantidad_bateria)
  % codigo : codigo del sistema registrado 
  % panel : panel en el sistema
  % bateria : bateria en el sistema
  % inversor : inversor en el sistemas
  % cantidad_panel : cantidad de paneles
  % cantidad_bateria : cantidad de baterias

%}

classdef C_G_Recomendacion_PV
    properties
        codigo
        panel
        bateria
        inversor
        cantidad_panel
        cantidad_bateria
    end

    methods
        function obj = C_G_Recomendacion_PV(codigo, panel, bateria, inversor, cantidad_panel, cantidad_bateria)
            obj.codigo = codigo;
            obj.panel = panel;
            obj.bateria = bateria;
            obj.inversor = inversor;
            obj.cantidad_panel = cantidad_panel;
            obj.cantidad_bateria = cantidad_bateria;
        end
    end
end