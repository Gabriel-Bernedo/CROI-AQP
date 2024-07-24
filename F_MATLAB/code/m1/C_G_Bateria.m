%{

% bateria = C_G_Bateria(codigo, modelo, potencia, costo, tiempo_vida, costo_mantenimiento, ancho, alto, largo)
  % codigo : codigo de la bateria 
  % modelo : modelo de la bateria
  % potencia : potencia de la bateria
  % costo : costo de compra de la bateria
  % tiempo_vida : tiempo de vida de la bateria
  % costo_mantenimiento : costo de mantenimiento de la bateria
  % ancho : ancho de la bateria
  % alto : alto de la bateria
  % largo : largo de la bateria

%}

classdef C_G_Bateria
    properties
        codigo
        modelo
        capacidad
        costo
        tiempo_vida
        costo_mantenimiento
        ancho
        alto
        largo
    end

    methods
        function obj = C_G_Bateria(codigo, modelo, capacidad, costo, tiempo_vida, costo_mantenimiento, ancho, alto, largo)
            obj.codigo = codigo;
            obj.modelo = modelo;
            obj.capacidad = capacidad;
            obj.costo = costo;
            obj.tiempo_vida = tiempo_vida;
            obj.costo_mantenimiento = costo_mantenimiento;
            obj.ancho = ancho;
            obj.alto = alto;
            obj.largo = largo;
        end
    end
end