%{

% C_G_Inversor

# CONSTRUCTOR

% C_G_Inversor(nombre, potencia, admision, precio)
  % nombre: nombre del inversor
  % potencia: potencia del inversor
  % admision: admision del inversor
  % precio: precio del inversor

# METODOS DE INSTANCIA


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