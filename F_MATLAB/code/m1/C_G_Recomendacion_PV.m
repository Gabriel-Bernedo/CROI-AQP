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
        costo_instalacion
    end

    methods
        function obj = C_G_Recomendacion_PV(codigo, panel, bateria, inversor, cantidad_panel, cantidad_bateria)
            obj.codigo = codigo;
            obj.panel = panel;
            obj.bateria = bateria;
            obj.inversor = inversor;
            obj.cantidad_panel = cantidad_panel;
            obj.cantidad_bateria = cantidad_bateria;
            obj.costo_instalacion = 0;
        end
        function obj = config_costo_instalacion(obj, costo_instalacion)
            obj.costo_instalacion = costo_instalacion;
        end
        function obj = optimizar(obj, consumoMensual, potenciaPico, horas, tipo)
            if tipo == "hibrido"
                obj.cantidad_panel = ceil(consumoMensual / ( 30 * obj.panel.potencia * horas));
                obj.cantidad_bateria = 0;
            elseif tipo == "aislado"
                seriesPan = ceil(potenciaPico / obj.panel.potencia);
                obj.cantidad_panel = ceil(consumoMensual / (30 * obj.panel.potencia * seriesPan * horas)) * seriesPan;

                seriesBat = ceil(potenciaPico / obj.bateria.voltaje);
                obj.cantidad_bateria = ceil(consumoMensual / (30 * obj.bateria.capacidad * seriesBat)) * seriesBat;
            end
        end

        function x = costoTotal(obj)
            x = obj.costo_instalacion;
            x = x + obj.costoCompra();
        end

        function x = costoCompra(obj)
            x = obj.cantidad_bateria * obj.bateria.costo;
            x = x + obj.cantidad_panel * obj.panel.costo;
            x = x + obj.inversor.costo;
        end

        function x = costoReemplazo(obj)
            x = obj.cantidad_bateria * obj.bateria.costo / obj.bateria.tiempo_vida;
            x = x + obj.cantidad_panel * obj.panel.costo / obj.panel.tiempo_vida;
        end
    end
end