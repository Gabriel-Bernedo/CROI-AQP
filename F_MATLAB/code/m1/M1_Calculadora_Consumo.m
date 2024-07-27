classdef M1_Calculadora_Consumo
    properties
        recibos
        electrodomesticos
        costo_Kw
        radiacion
        ambientes
    end

    methods
        function obj = M1_Calculadora_Consumo()
            obj.recibos = C_G_Tablas.recibo();
            obj.electrodomesticos = C_G_Tablas.electrodomesticos_usuario();
            obj.costo_Kw = C_G_Tablas.costo_kw_historial();
            obj.
        end

        %Funcion Recibos

        function answer =  I_Recibo(obj,data)
            if(data.empty())
                if(obj.recibos.RecM == data.RecM && obj.recibos.RecA == data.RecA)
                    answer = "Ya existe un recibo de ese Mes!";
                else
                    obj.recibos(end+1) = data;
                end
                answer = "Ingreso de Recibo Exitoso";
            end
                answer = "Se genero un error :(";
        end
        function answer = E_Recibo(obj, data)
            obj.recibos(obj.recibos.RecCod == data.RecCod) = data;
            answer = "Se cargaron los cambios correctamente";
        end
        function answer = D_Recibo(obj, data)
            obj.recibos(obj.recibos.RecCod == data.RecCod) = C_G_Costo_Kw_Historial.empty;
            answer = "Se elimino correctamente";
        end
        function tabla = Get_Recibos(obj)
            if(obj.recibos.empty())
                tabla = obj.recibos;
            end
        end
        %Funcion Electrodomesticos
    end
end