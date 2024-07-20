classdef C_G_Paneles
  properties (Access = private)
    IDPanelSolar;
    nombre;
    largo;
    ancho;
    potencia;
    voltaje;
    precio;
  end
  methods
    function obj = C_G_Paneles(Id, nombre, largo, ancho, potencia, voltaje, precio)
      obj.IDPanelSolar = Id;
      obj.nombre = nombre;
      obj.largo = largo;
      obj.ancho = ancho;
      obj.potencia = potencia;
      obj.voltaje = voltaje;
      obj.precio = precio;
    end
  end
end