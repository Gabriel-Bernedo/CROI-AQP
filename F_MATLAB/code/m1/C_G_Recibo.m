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
        RecA
        RecM
    end

    methods
        function obj = C_G_Recibo(codigo, consumo, costo,RecA,RecM)
            obj.codigo = codigo;
            obj.consumo = consumo;
            obj.costo = costo;
            obj.RecA = RecA;
            obj.RecM = RecM;   
        end
        function data = to_String(obj)
          data = {obj.codigo, obj.consumo, obj.costo, obj.RecA, obj.RecM};
        end
    end
end