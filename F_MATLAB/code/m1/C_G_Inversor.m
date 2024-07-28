%{

% inversor = C_G_Inversor(codigo, modelo, potencia, costo, tiempo_vida, costo_mantenimiento)
  % codigo : codigo del inversor 
  % modelo : modelo del inversor
  % potencia : potencia del inversor
  % costo : costo de compra del inversor
  % tiempo_vida : tiempo de vida del inversor
  % costo_mantenimiento : costo de mantenimiento del inversor

%}

classdef C_G_Inversor
  properties
    codigo
    modelo
    potencia
    costo
    tiempo_vida
    costo_mantenimiento
  end
  methods
     function obj = C_G_Inversor(codigo, modelo, potencia, costo, tiempo_vida, costo_mantenimiento)
      obj.codigo = codigo;
      obj.modelo = modelo;
      obj.potencia = potencia;
      obj.costo = costo;
      obj.tiempo_vida = tiempo_vida;
      obj.costo_mantenimiento = costo_mantenimiento;
     end
    end
end