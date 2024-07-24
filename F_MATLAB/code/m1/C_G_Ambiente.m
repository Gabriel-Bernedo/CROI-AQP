%{

% ambiente = C_G_Ambiente(codigo, nombre)
  % codigo : codigo de la ambiente 
  % nombre : nombre de la ambiente

%}

classdef C_G_Ambiente
    properties
        codigo
        nombre
    end

    methods
        function obj = C_G_Ambiente(codigo,nombre)
           obj.codigo = codigo;
           obj.nombre = nombre;
        end
    end
end