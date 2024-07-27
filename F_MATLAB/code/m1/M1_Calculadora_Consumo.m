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
        end

        %Funcion Electrodomesticos
        
        %FRONTEND :: % % ("name_E",potencia, dia, noche, semana, cantidad, tipo)
        function obj = I_Electrodomesticos(obj, data)
            for i = 1 : width(obj.ele_base)
                if(data{1} == obj.ele_base(i).nombre)
                elec = obj.ele_base(i);
                end
            end
            for j = 1 : width(obj.tipo)
                if(data{7} == obj.tipo(j).nombre)
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

        function tabla = Table_Electrodomesticos(obj)
            datos = obj.Get_Electrodomesticos();

            tabla = 0;
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
    end
end