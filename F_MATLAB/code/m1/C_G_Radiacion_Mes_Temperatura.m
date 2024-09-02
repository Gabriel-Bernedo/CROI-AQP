%{

RMT -> Radiacion_Mes_Temperatura

% Radiacion_Mes_Temperatura = C_G_Radiacion_Mes_Temperatura(codigo, radiacion, temperatura, region, mes)
  % codigo : codigo de la Radiacion Registrada 
  % radiacion : potencia en KW por metro cuadrado
  % temperatura : temperatura registrada
  % region :region de los datos
  % mes : mes del año registrada

%}

classdef C_G_Radiacion_Mes_Temperatura
    properties
        codigo
        radiacion
        temperatura
        region
        mes
    end

    methods
        function obj = C_G_Radiacion_Mes_Temperatura(codigo, radiacion, temperatura, region, mes)
            obj.codigo = codigo;
            obj.radiacion = radiacion;
            obj.temperatura = temperatura;
            obj.region = region;
            obj.mes = mes;
        end
    end
end