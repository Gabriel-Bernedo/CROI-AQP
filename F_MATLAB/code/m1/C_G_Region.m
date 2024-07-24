%{

% C_G_Region

% region = C_G_Region(codigo, nombre)
   % codigo: codigo de la region
   % nombre: nombre de la region

%}

classdef C_G_Region
    properties
        codigo
        nombre
    end

    methods
        function obj = C_G_Region(codigo,nombre)
            obj.codigo =  codigo;
            obj.nombre = nombre;
        end
    end
end