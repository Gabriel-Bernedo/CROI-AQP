%{

% recibo = C_G_Recibo(codigo, consumo, costo)
  % codigo : codigo del recibo
  % consumo : modelo del recibo
  % costo : costo por Kw del recibo
  
%}

classdef C_G_Recibo
    properties
        codigo
        consumo
        costo
    end

    methods
        function obj = C_G_Recibo(codigo, consumo, costo)
            obj.codigo = codigo;
            obj.consumo = consumo;
            obj.costo = costo;
        end
    end
end