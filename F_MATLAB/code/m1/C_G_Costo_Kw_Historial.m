%{
CKH-> C_G_Costo_Kw_Historial
% CKH = C_G_Costo_Kw_Historial(codigo, costo, mes, year)
  % codigo : codigo del historial del costo por Kw
  % costo : costo por Kw en el historial
  % mes : mes del historia del costo por Kw
  % year : año del historial del costo por Kw
  
%}

classdef C_G_Costo_Kw_Historial
    properties
        codigo
        costo
        mes
        year
    end

    methods
        function obj = C_G_Costo_Kw_Historial(codigo, costo, mes, year)
            obj.codigo = codigo;
            obj.costo = costo;
            obj.mes = mes;
            obj.year = year;
        end
    end
end