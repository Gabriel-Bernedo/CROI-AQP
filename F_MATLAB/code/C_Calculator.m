classdef C_Calculator    
    properties
        consumoDia = 0
        consumoHora = 0
        cantBat = 0
        cantPan = 0
        tipoBat = 0
        tipoPan = 0
        horasConRad = 0
        horasSinRad = 0
        consumoSinRad = 0
    end
    
    methods
        %Rad = Radiacion solar
        function obj = C_Calculator(consumoDia, horasConRad, horasSinRad)
            obj.consumoDia = consumoDia;
            obj.horasConRad = horasConRad;
            obj.horasSinRad = horasSinRad;
        end
        function obj = Calc_Cant_Paneles(obj)
            if obj.consumoHora < 1000
                obj.cantPan = ceil(obj.consumoSinRad/(150*obj.horasConRad));
                obj.tipoPan = 150;
            elseif obj.consumoHora >1000 && obj.consumoHora < 3000
                obj.cantPan = ceil(obj.consumoSinRad/(550*obj.horasConRad));
                if mod(obj.cantBat, 2) == 1
                    obj.cantBat = obj.cantBat +1;
                end
                obj.tipoPan = 550;
            elseif obj.consumoHora >3000 && obj.consumoHora < 5000
                obj.cantPan = ceil(obj.consumoSinRad/(550*obj.horasConRad));
                sobra =  mod(obj.cantPan, 4);
                if sobra > 0
                    obj.cantBat = obj.cantBat +(4-sobra);
                end
                obj.tipoPan = 550;
            else
                obj.cantPan = ceil(obj.consumoSinRad/(550*obj.horasConRad));
                %dependeria de la admision del inversor
                obj.tipoPan = 550;
            end
            fprintf('La cantidad de paneles de %d Ah es: %d\n', obj.tipoPan, obj.cantPan);
        end
        
        function obj = Calc_Cant_Baterias(obj)
            % calcula la cantidad de baterias necesarias
            % se agrega un 10% extra de perdida del sistema
            obj.consumoHora = obj.consumoDia*1.1/24;
            fprintf('Consumo por hora es: %.2f Watts\n', obj.consumoHora);
            % se divide entre 75% ya que es el ciclo recomendado de
            % profundidad de descarga y se multiplica por el numero de
            % horas sin radiacion
            obj.consumoSinRad = obj.consumoHora * obj.horasSinRad / 0.75;
            fprintf('Capacidad energetica necesearia sin radiacion es: %.2f Watts\n', obj.consumoSinRad);
            if obj.consumoHora < 1000
                %100AH	1200 516
                %150AH	1800 708
                %250 3000 110
                %300 3600 1330
                %600 7200 1628
                %crear minimodelo usaremos 100 temporalmente
                %amp = Watts/12(ya que es el voltaje de TODAS las baterias)
                obj.cantBat = ceil(obj.consumoSinRad/1200);
                obj.tipoBat = 100;
            elseif obj.consumoHora >1000 && obj.consumoHora < 3000
                %cantBat debe ser multiplo de 2, ya que se necesita poner
                %en serie para que sumen 24 V
                obj.cantBat = ceil(obj.consumoSinRad/1800);
                obj.tipoBat = 300;
            elseif obj.consumoHora > 3000 && obj.consumoHora < 5000
                %cantBat debe ser multiplo de 2, ya que se necesita poner
                %en serie para que sumen 24 V
                obj.cantBat = ceil(obj.consumoSinRad/3000);
                obj.tipoBat = 600;
                if mod(obj.cantBat, 2) == 1
                    obj.cantBat = obj.cantBat +1;
                end
            else
                %inversores mas complejos, para todo un departamento o
                %industrias (no es nuestro enfoque)
                %emplear baterias de litio (medidad en kW)
                %2,4 4460
                %3.5 6540
                %4,8 8990
                obj.cantBat = ceil(obj.consumoSinRad/4800);
                sobra = mod(obj.cantBat, 4);
                obj.tipoBat = 2400;
                if sobra > 0
                    obj.cantBat = obj.cantBat +(4-sobra);
                end
            end
            fprintf('La capacidad de almacenamiento requerida es %.2f Amp\n',obj.consumoSinRad/12);
            fprintf('La cantidad de baterias de %d Ah es: %d\n', obj.tipoBat, obj.cantBat);
        end
    end
end

