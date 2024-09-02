%{

% tipo = C_G_Tipo(codigo, nombre)
  % codigo : codigo del tipo 
  % nombre : nombre del tipo

%}

classdef C_G_Tipo
    properties
        codigo
        nombre
    end

    methods
        function obj = C_G_Tipo(codigo,nombre)
            obj.codigo = codigo;
            obj.nombre = nombre;
        end
    end
end