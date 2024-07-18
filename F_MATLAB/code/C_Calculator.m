classdef C_Calculator    
    properties
        consumoDia = 0
        consumoHora = 0
        cantBat = 0
        cantPan = 0
    end
    
    methods
        function obj = C_Calculator(consumoPicoPorHora)
            obj.consumoHora = consumoPicoPorHora;
        end
        
        function cantBat = Calc_Cant_Baterias(obj)
            % calcula la cantidad de baterias necesarias
            consumo = obj.consumoHora;
            if consumo < 1000
                %100AH	516
                %150AH	708
                %250 110
                %300 1330
                %600 1628
                %crear minimodelo usaremos 100 temporalmente
               obj.cantBat = ceil(consumo/100);
            elseif consumo >1000 && consumo < 3000
                obj.cantBat = ceil(consumo/300);
            elseif consumo > 3000 && consumo < 5000
                obj.cantBat = ceil(consumo/600);
            else
                %inversores mas complejos, para todo un departamento o
                %industrias (no es nuestro enfoque)
                %emplear baterias de litio (medidad en kW)
                %2,4 4460
                %3.5 6540
                %4,8 8990
                obj.cantBat = ceil(consumo/2400);
            end
            cantBat = obj.cantBat;
        end
    end
end

