classdef C_Calc_Retorno
    %C_CALC_RETORNO Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        mesesRetorno
    end
    
    methods
        function obj = C_Calc_Retorno(costoTotal, consumoDiario)
            %por ahora se asumira un valor unico para el precio de kWh el
            %cual es de 0,7314 -> 
            obj.mesesRetorno = ceil(costoTotal *1000/(consumoDiario*30*0.7314));
            fprintf('La cantidad de meses para recuperar la inversion es de %d\n', obj.mesesRetorno);
        end
    end
end

