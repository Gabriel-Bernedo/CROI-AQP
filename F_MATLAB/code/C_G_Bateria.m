
classdef C_G_Bateria
  properties 
    IDBateria;
    nombre;
    largo;
    ancho;
    alto;
    voltaje;
    AH;
    tipo;
    precio;
  end
  methods
    function obj = C_G_Bateria(Id, nombre, largo, ancho, alto, voltaje, AH, tipo, precio)
      obj.IDBateria = Id;
      obj.nombre = nombre;
      obj.largo = largo;
      obj.ancho = ancho;
      obj.alto = alto;
      obj.AH = AH;
      obj.tipo = tipo;
      obj.voltaje = voltaje;
      obj.precio = precio;
    end
  end
end