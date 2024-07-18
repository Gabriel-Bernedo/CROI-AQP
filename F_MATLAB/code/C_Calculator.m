classdef C_Calculator    
    properties
        consumoDia = 0
        consumoHora = 0
        cantBat = 0
        cantPan = 0
        tipoBat = 0
        tipoPan
    end
    
    methods
        function obj = C_Calculator(consumoPicoPorHora)
            obj.consumoHora = consumoPicoPorHora;
        end
        
        function obj = Calc_Cant_Baterias(obj)
            % calcula la cantidad de baterias necesarias
            consumo = obj.consumoHora;
            if consumo < 1000
               obj.cantBat = ceil(consumo / 100);
               obj.tipoBat = 100;
            elseif consumo >= 1000 && consumo < 3000
                obj.cantBat = ceil(consumo / 300);
                obj.tipoBat = 300;
                if mod(obj.cantBat, 2) == 1
                    obj.cantBat = obj.cantBat + 1;
                end
            elseif consumo >= 3000 && consumo < 5000
                obj.cantBat = ceil(consumo / 600);
                obj.tipoBat = 600;
                if mod(obj.cantBat, 2) == 1
                    obj.cantBat = obj.cantBat + 1;
                end
            else
                obj.cantBat = ceil(consumo / 2400);
                obj.tipoBat = 2400;
                sobra = mod(obj.cantBat, 4);
                if sobra > 0
                    obj.cantBat = obj.cantBat + (4 - sobra);
                end
            end
        end
    end
end

