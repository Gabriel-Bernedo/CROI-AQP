%{

% C_M2_Calculator

# CONSTRUCTOR

% solver = C_M2_Calculator(consumoDia, horasConRad, horasSinRad)
  % consumoDia: consumo diario del usuario
  % horasConRad: horas de radiacion solar
  % horasSinRad: horas sin radiacion solar

# METODOS DE INSTANCIA

% solver.config_Baterias(bateria)                                   // Configurar baterias
    % bateria : instancia de Baterias

% solver.config_Paneles(panel)                                      // Configurar paneles
    % panel : instancia de Paneles

% solver.config_Inversores(inversor)                                // Configurar inversores  
    % inversor : instancia de Inversores

% sovler.calc_Sistema(consumoMensual, consumoDiario, potenciaPico)  // Calcular sistema recomendado
    % consumoMensual: consumo mensual del usuario
    % consumoDiario: consumo diario del usuario
    % potenciaPico: potencia pico del sistema
% Devuelve una instancia de Sistema

% solver.Calc_Total()                                               // Calcular el costo total del sistema

%}
classdef C_M2_Calculator    
    properties
        consumoDia = 0
        consumoHora = 0
        cantBat = 0
        cantPan = 0
        modelo_Bateria = 0
        modelo_Panel = 0
        modelo_Inversor = 0
        horas_ConRad = 0
        horas_SinRad = 0
        consumo_SinRad = 0
        tipoInversor
        costos = [0,0,0] %paneles, baterias, inversor
        costoTotal = 0

        consumoSinRad = 0
        horasConRad = 0
        horasSinRad = 0

        tipoPan = 0
        tipoBat = 0

    end
    %
    methods
        %Rad = Radiacion solar
        function obj = C_M2_Calculator(consumoDia, horasConRad, horasSinRad)
            obj.consumoDia = consumoDia;
            obj.horasConRad = horasConRad;
            obj.horasSinRad = horasSinRad;
        end
        function obj = config_Baterias(obj, bateria)
            obj.modelo_Bateria = bateria;
        end
        function obj = config_Paneles(obj, panel)
            obj.modelo_Panel = panel;
        end
        function obj = config_Inversores(obj, inversor)
            obj.modelo_Inversor = inversor;
        end

        function x = calc_Sistema(obj, consumo_Mensual, consumo_Diario, potencia_Pico)
            x = C_G_Sistema();
            x.config_Paneles(obj.modelo_Panel);
            x.config_Baterias(obj.modelo_Bateria);
            x.config_Inversores(obj.modelo_Inversor);
        end

        function obj = Calc_Total(obj)
            obj = Calc_Cant_Paneles(obj);
            obj = Calc_Cant_Baterias(obj);
            obj =  Calc_Inversor(obj);
            obj.costoTotal = obj.costos(1) + obj.costos(2) + obj.costos(3);
            fprintf('El costo total es %d soles\n', obj.costoTotal);
        end
        function obj = Calc_Cant_Paneles(obj)
            %{
            100	350
            150	475
            460	520
            550	600
sistema de 12V
            %}
            if obj.consumoHora < 1000
                obj.cantPan = ceil(obj.consumoSinRad/(150*obj.horasConRad));
                obj.tipoPan = 150;
                obj.costos(1) = obj.cantPan*475;
            else
                if obj.consumoHora >1000 && obj.consumoHora < 3000%24V
                    obj.cantPan = ceil(obj.consumoSinRad/(550*obj.horasConRad));
                    obj.tipoPan = 550;
                elseif obj.consumoHora >3000 && obj.consumoHora < 5000%48V
                    obj.cantPan = ceil(obj.consumoSinRad/(550*obj.horasConRad));
                    if mod(obj.tipoPan, 2) == 1
                        obj.tipoPan = obj.tipoPan +1;
                    end
                    obj.tipoPan = 550;
                else
                    obj.cantPan = ceil(obj.consumoSinRad/(550*obj.horasConRad));
                    %dependeria de la admision del inversor
                    obj.tipoPan = 550;
                end
                obj.costos(1) = obj.cantPan*600;
            end
            fprintf('La energia requerida por hora es: %.2f Watts\n', obj.consumoSinRad/obj.horasConRad);
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
                %crear minimodelo usaremos 100Ah temporalmente
                %amp = Watts/12(ya que es el voltaje de TODAS las baterias)
                %P=I.V -> potencia =  intensidad * volatje 
                obj.cantBat = ceil(obj.consumoSinRad/1200);%watts, potencia
                obj.tipoBat = 100;%amperios
                obj.costos(2) = obj.cantBat*516;
            elseif obj.consumoHora >1000 && obj.consumoHora < 3000
                %cantBat debe ser multiplo de 2, ya que se necesita poner
                %en serie para que sumen 24 V
                obj.cantBat = ceil(obj.consumoSinRad/1800);
                if mod(obj.cantBat, 2) == 1
                    obj.cantBat = obj.cantBat +1;
                end
                obj.tipoBat = 300;
                obj.costos(2) = obj.cantBat*1330;
            elseif obj.consumoHora > 3000 && obj.consumoHora < 5000
                %cantBat debe ser multiplo de 2, ya que se necesita poner
                %en serie para que sumen 24 V
                obj.cantBat = ceil(obj.consumoSinRad/3000);
                obj.tipoBat = 600;
                if mod(obj.cantBat, 2) == 1
                    obj.cantBat = obj.cantBat +1;
                end
                obj.costos(2) = obj.cantBat*1628;
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
                obj.costos(2) = obj.cantBat*8990;
            end
            fprintf('La capacidad de almacenamiento requerida es %.2f Amp\n',obj.consumoSinRad/12);
            fprintf('La cantidad de baterias de %d Ah es: %d\n', obj.tipoBat, obj.cantBat);
            %fprintf('El costo es de las baterias es %d soles\n', costo);
        end
        function obj = Calc_Inversor(obj)
            % 600 - 2000 -> 12v, 3000 -> 24V, 5000 -> 48
            potencias = [600, 1000, 2000, 3000, 5000];
            precios = [140, 270, 1000, 1400, 3000];
            valor = obj.consumoHora;             
            % Convertir la lista de celdas a un array numérico
            %lista_pot = cell2mat(potencias);
            %lista_cos = cell2mat(costos);
            %dict = containers.Map(lista_pot, lista_cos);

            dict = containers.Map(potencias, precios);
            % Encontrar los valores en la lista que son mayores que el valor dado
            valores_mayores = potencias(potencias > valor);
            
            % Encontrar el valor más pequeño entre los valores mayores
            if ~isempty(valores_mayores)
                valor_proximo_superior = min(valores_mayores);
                obj.costos(3) = dict(valor_proximo_superior);
                fprintf('El valor más próximo superior a %.2f es %d\n', valor, valor_proximo_superior);
                fprintf('El costo es del inversor es %d soles\n', obj.costos(3));
            else
                fprintf('No hay valores superiores a %.2f en la lista\n', valor);
            end
        end
    end
end

