classdef M1_Calculadora_Consumo
    properties
        recibos
        electrodomesticos
        ele_base
        costo_Kw
        radiacion
        ambientes
        tipo
        historial_e
        historial_r
        usuario
    end

    methods
        function obj = M1_Calculadora_Consumo()
            consulta = C_G_Tablas();
            obj.recibos = consulta.recibo();
            obj.electrodomesticos = consulta.electrodomesticos_usuario();
            obj.costo_Kw = consulta.costo_kw_historial();
            obj.radiacion = consulta.radiacion_mes_temperatura();
            obj.ambientes = consulta.ambiente();
            obj.ele_base = consulta.electrodomesticos();
            obj.tipo = consulta.tipo();
            %obj.usuario = usuario;
            if isempty(obj.electrodomesticos)
                obj.historial_e = 0;
            else
                obj.historial_e = obj.electrodomesticos(end).codigo;
            end
            if isempty(obj.recibos)
                obj.historial_r = 0;
            else
                obj.historial_r = obj.recibos(end).codigo;
            end
        end

        %Funcion Electrodomesticos
        
        %FRONTEND :: % % ("name_E",potencia, dia, noche, semana, cantidad, tipo)
        function obj = I_Electrodomesticos(obj, data)
            for i = 1 : width(obj.ele_base)
                if strcmp(data{1}, obj.ele_base(i).nombre)
                elec = obj.ele_base(i);
                end
            end
            for j = 1 : width(obj.tipo)
                if strcmp(data{7}, obj.tipo(j).nombre)
                tip = obj.tipo(j);
                end
            end
            codigo = obj.historial_e+1;
            nuevo = C_G_Electrodomestico(elec,codigo,data{2},data{3},data{4},data{5},data{6}, tip);
            obj.electrodomesticos(end+1) = nuevo;
            obj.historial_e = codigo;
        end

        %FRONTEND :: % (codigo)
        function obj = D_Electrodomesticos(obj, id)
            for i = 1 : width(obj.electrodomesticos)
                if(obj.electrodomesticos(i).codigo == id)
                    obj.electrodomesticos(i) = [];
                    break;
                end
            end
        end

        %FRONTEND :: % (codigo, potencia, dia, noche, semana, cantidad, tipo)
        function obj = E_Electrodomesticos(obj, data)
            for j = 1 : width(obj.tipo)
                if(data{7} == obj.tipo(j).nombre)
                    tip = obj.tipo(j);
                end
            end
            for i = 1 : width(obj.electrodomesticos)
                if(data{1} == obj.electrodomesticos(i).codigo)
                obj.electrodomesticos(i).consumo_potencia = data{2};
                obj.electrodomesticos(i).frecuencia_dia = data{3};
                obj.electrodomesticos(i).frecuencia_noche = data{4};
                obj.electrodomesticos(i).frecuencia_semana = data{5};
                obj.electrodomesticos(i).cantidad = data{6};
                obj.electrodomesticos(i).tipo = tip;
                end
            end
        end

        function data = Get_Electrodomesticos(obj)
            data = obj.electrodomesticos;
        end

        function table = Table_Electrodomesticos(obj)
            table = {};
            for i = 1 : numel(obj.electrodomesticos)
                electrodomesticoStr = obj.electrodomesticos(i).to_String();
                table(end+1, :) = electrodomesticoStr(:);
            end
        end


        
        function item = Item_Ambiente(obj)
            item = {};
            for i = 1: width(obj.ambientes)
                item{end+1} = obj.ambientes(i).nombre;
            end
        end
        function item = Item_Tipo(obj)
            item = {};
            for i = 1: width(obj.tipo)
                item{end+1} = obj.tipo(i).nombre;
            end
        end
        function item = Item_Electrodomestico(obj, ambiente)
            item = {};
            for i = 1: width(obj.ele_base)
                if strcmp(obj.ele_base(i).ambiente.nombre, ambiente)
                    item{end+1} = obj.ele_base(i).nombre;
                end
            end
        end
        function electro = Obj_Electrodomesticos(obj, id)
            for i = 1: width(obj.ele_base)
                if strcmp(obj.ele_base(i).nombre, id)
                    electro = obj.ele_base(i);
                end
            end
        end

        % FRONTEND :: (consumo, costo,RecA,RecM)
        % Función para insertar Recibos
        function obj = I_Recibos(obj, data)
            codigo = obj.historial_r + 1;
            nuevo = C_G_Recibo(codigo, data{1}, data{2}, data{3}, data{4});
            obj.recibos(end+1) = nuevo;
            obj.historial_r = codigo;
        end

        % Función para eliminar Recibos
        function obj = D_Recibos(obj, id)
            for i = 1 : length(obj.recibos)
                if(obj.recibos(i).codigo == id)
                    obj.recibos(i) = [];
                    break;
                end
            end
        end


        %FRONTEND :: % (codigo, consumo, costo, Año, Mes)
        function obj = E_Recibos(obj, data)
            for i = 1 : length(obj.recibos)
                if(data{1} == obj.recibos(i).codigo)
                    obj.recibos(i).consumo = data{2};
                    obj.recibos(i).costo = data{3};
                    obj.recibos(i).RecA = data{4};
                    obj.recibos(i).RecM = data{5};
                end
            end
        end
        % Función para obtener los Recibos
        function data = Get_Recibos(obj)
            data = obj.recibos;
        end

        % Función para obtener los datos de radiación solar
        function data = Get_Radiacion(obj)
            data = obj.radiacion;
        end
        function table = Table_Recibos(obj)
            table = {};
            for i = 1 : numel(obj.recibos)
                recibosstr = obj.recibos(i).to_String();
                table(end+1, :) = recibosstr(:);
            end
        end
    end
end
