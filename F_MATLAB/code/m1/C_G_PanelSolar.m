%{

% panelsolar = C_G_PanelSolar(codigo, modelo, potencia, costo, tiempo_vida, costo_mantenimiento, ancho, alto)
  % codigo : codigo del panel solar 
  % modelo : modelo del panel solar
  % potencia : potencia del panel solar
  % costo : costo de compra del panel solar
  % tiempo_vida : tiempo de vida del panel solar
  % costo_mantenimiento : costo de mantenimiento del panel solar
  % ancho : ancho del panel solar
  % alto : alto del panel solar

%}

classdef C_G_PanelSolar
    properties
        codigo
        modelo
        potencia
        costo
        tiempo_vida
        costo_mantenimiento
        ancho
        alto
    end

    methods
        function obj = C_G_PanelSolar(codigo, modelo, potencia, costo, tiempo_vida, costo_mantenimiento, ancho, alto)
            obj.codigo = codigo;
            obj.modelo = modelo;
            obj.potencia = potencia;
            obj.costo = costo;
            obj.tiempo_vida = tiempo_vida;
            obj.costo_mantenimiento = costo_mantenimiento;
            obj.ancho = ancho;
            obj.alto = alto;
        end
    end
end