%{



%}
classdef C_G_Inversor
  properties (Access = private)
    ID;
    nombre;
    potencia;
    admision;
    precio;
  end
  methods
    function obj = C_G_Inversor(nombre, potencia, admision, precio)
      obj.nombre = nombre;
      obj.potencia = potencia;
      obj.admision = admision;
      obj.precio = precio;
    end
  end
end 