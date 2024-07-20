%{

%}

classdef C_Bateria
  properties (Access = private)
    IDBateria;
    nombre;
    largo;
    ancho;
    alto;
    AH;
    Tipo;
    voltaje;
    precio;
  end
  methods
    function obj = C_Bateria( nombre, largo, ancho, alto, AH, tipo, voltaje, precio)
      obj.IDBateria = Id;
      obj.nombre = nombre;
      obj.largo = largo;
      obj.ancho = ancho;
      obj.alto = alto;
      obj.AH = AH;
      obj.Tipo = tipo;
      obj.voltaje = voltaje;
      obj.precio = precio;
    end
  end
end