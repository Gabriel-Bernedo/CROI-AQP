classdef M1_Calculadora_Consumo
    properties
        recibos
        electrodomesticos
        ele_base
        rec_base
        costo_Kw
        radiacion
        ambientes
        tipo
        historial_e
        historial_r
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
            obj.rec_base = consulta.recibo();
            obj.tipo = consulta.tipo();
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
                obj.electrodomesticos(i).codigo
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

        %Falta Completar
        function data = Get_Electrodomesticos(obj)
            data = obj.electrodomesticos;
        end

        % Función para insertar Recibos
        function obj = I_Recibos(obj, data)
            for i = 1 : width(obj.rec_base)
                if(data{1} == obj.rec_base(i).nombre)
                    rec = obj.rec_base(i);
                end
            end
            codigo = obj.historial_r + 1;
            nuevo = C_G_Recibo(rec, codigo, data{2}, data{3}, data{4}, data{5});
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

        % Función para editar Recibos
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
    end
end