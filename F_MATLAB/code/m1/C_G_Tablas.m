classdef C_G_Tablas
    %TABLAS REFERENCIALES
    properties
        BD = 0;
    end
    
    methods
        function obj = C_G_Tablas()
            obj.BD = conectarBD(); % Asegúrate de que conectarBD retorne una conexión válida a la base de datos
        end
        function RegistroAmbiente = ambiente(obj)
            tabla = obj.BD.Registro_Tabla('ambiente');
            RegistroAmbiente = C_G_Ambiente.empty(height(tabla), 0);
            for i = 1:height(tabla)
                RegistroAmbiente(i) = C_G_Ambiente(tabla.AmbCod(i), tabla.AmbNom{i});
            end
        end
        
        function RegistroBateria = bateria(obj)
            tabla = obj.BD.Registro_Tabla('bateria');
            RegistroBateria = C_G_Bateria.empty(height(tabla), 0);
            for i = 1:height(tabla)
                RegistroBateria(i) = C_G_Bateria(tabla.BatCod(i), tabla.BatMod{i}, tabla.BatCap(i), tabla.BatCosMon(i), tabla.BatTieVid(i), tabla.BatCosMan(i), tabla.BatAlt(i), tabla.BatAnc(i), tabla.BatLag(i), tabla.BatTip(i), tabla.BatVol(i));
            end
        end
        
        function RegistroPanelSolar = panelsolar(obj)
            tabla = obj.BD.Registro_Tabla('panelsolar');
            RegistroPanelSolar = C_G_PanelSolar.empty(height(tabla), 0);
            for i = 1:height(tabla)
                RegistroPanelSolar(i) = C_G_PanelSolar(tabla.PanCod(i), tabla.PanMod{i}, tabla.PanPot(i), tabla.PanCosMon(i), tabla.PanTieVid(i), tabla.PanCosMan(i), tabla.PanAnc(i), tabla.PanAlt(i));
            end
        end
        
        function RegistroInversor = inversor(obj)
            tabla = obj.BD.Registro_Tabla('inversor');
            RegistroInversor = C_G_Inversor.empty(height(tabla), 0);
            for i = 1:height(tabla)
                RegistroInversor(i) = C_G_Inversor(tabla.InvCod(i), tabla.InvMod{i}, tabla.InvPot(i), tabla.InvCosMon(i), tabla.InvTieVid(i), tabla.InvCosMan(i), tabla.InvAdmVol(i));
            end
        end
        
        function RegistroRecibo = recibo(obj)
            tabla = obj.BD.Registro_Tabla('recibo');
            RegistroRecibo = C_G_Recibo.empty(height(tabla), 0);
            for i = 1:height(tabla)
                RegistroRecibo(i) = C_G_Recibo(tabla.RecCod(i), tabla.RecConMen(i), tabla.RecCosTot(i), tabla.RecA(i), tabla.RecM(i));
            end
        end
        
        function RegistroRegion = region(obj)
            tabla = obj.BD.Registro_Tabla('region');
            RegistroRegion = C_G_Region.empty(height(tabla), 0);
            for i = 1:height(tabla)
                RegistroRegion(i) = C_G_Region(tabla.RegCod(i), tabla.RegNom{i});
            end
        end
        
        function RegistroCostoKwHistorial = costo_kw_historial(obj)
            tabla = obj.BD.Registro_Tabla('costo_kw_historial');
            RegistroCostoKwHistorial = C_G_Costo_Kw_Historial.empty(height(tabla), 0);
            for i = 1:height(tabla)
                RegistroCostoKwHistorial(i) = C_G_Costo_Kw_Historial(tabla.CosKHisCod(i), tabla.CosKHisMon(i), tabla.CosKHisM(i), tabla.CosKHisA(i));
            end
        end
        
        function RegistroTipo = tipo(obj)
            tabla = obj.BD.Registro_Tabla('tipo');
            RegistroTipo = C_G_Tipo.empty(height(tabla), 0);
            for i = 1:height(tabla)
                RegistroTipo(i) = C_G_Tipo(tabla.TipCod(i), tabla.TipNom{i});
            end
        end
        
        %TABLAS ASOCIATIVAS
        
        function RegistroElectrodomesticos = electrodomesticos(obj)
            tabla = obj.BD.Registro_Tabla('electrodomesticos');
            RegistroAmbiente = obj.ambiente(); % Cargar los datos necesarios
            RegistroElectrodomesticos = C_G_ElectrodomesticoBase.empty(height(tabla), 0);
            for i = 1:height(tabla)
                ambiente = RegistroAmbiente([RegistroAmbiente.codigo] == tabla.ambCod(i));
                RegistroElectrodomesticos(i) = C_G_ElectrodomesticoBase(tabla.EleCod(i), tabla.EleNom{i}, tabla.ElePotCon(i), ambiente);
            end
        end
        
        function RegistroRadiacionMesTemperatura = radiacion_mes_temperatura(obj)
            tabla = obj.BD.Registro_Tabla('radiacion_mes_temperatura');
            RegistroRegion = obj.region(); % Cargar los datos necesarios
            RegistroRadiacionMesTemperatura = C_G_Radiacion_Mes_Temperatura.empty(height(tabla), 0);
            for i = 1:height(tabla)
                region = RegistroRegion([RegistroRegion.codigo] == tabla.RegCod(i));
                RegistroRadiacionMesTemperatura(i) = C_G_Radiacion_Mes_Temperatura(tabla.RadMesTemCod(i), tabla.RadCod(i), tabla.TemCod(i), tabla.RegCod(i), tabla.RadMes{i});
            end
        end
        
        function RegistroElectrodomesticosUsuario = electrodomesticos_usuario(obj)
            tabla = obj.BD.Registro_Tabla('electrodomesticos_usuario');
            RegistroElectrodomesticos = obj.electrodomesticos(); % Cargar los datos necesarios
            RegistroTipo = obj.tipo(); % Cargar los datos necesarios
            RegistroElectrodomesticosUsuario = C_G_Electrodomestico.empty(height(tabla), 0);
            for i = 1:height(tabla)
                elec_base = RegistroElectrodomesticos([RegistroElectrodomesticos.base_codigo] == tabla.EleUsuEleCod(i));
                tipo = RegistroTipo([RegistroTipo.codigo] == tabla.TipCod(i));
                RegistroElectrodomesticosUsuario(i) = C_G_Electrodomestico(elec_base, tabla.EleUsuCod(i), tabla.EleUsuFreSem(i), tabla.EleUsuFreDia(i), tabla.EleUsuFreNoc(i), tabla.EleUsuPot(i), tabla.EleUsuCan(i), tabla.TipCod(i), tabla.EleUsuEleCod(i));
            end
        end
        
        function RegistroRecomendacionPV = recomendacionpv(obj)
            tabla = obj.BD.Registro_Tabla('recomendacionpv');
            RegistroPanelSolar = obj.panelsolar(); % Cargar los datos necesarios
            RegistroBateria = obj.bateria(); % Cargar los datos necesarios
            RegistroInversor = obj.inversor(); % Cargar los datos necesarios
            RegistroRecomendacionPV = C_G_Recomendacion_PV.empty(height(tabla), 0);
            for i = 1:height(tabla)
                panel = RegistroPanelSolar([RegistroPanelSolar.codigo] == tabla.PanCod(i));
                bateria = RegistroBateria([RegistroBateria.codigo] == tabla.BatCod(i));
                inversor = RegistroInversor([RegistroInversor.codigo] == tabla.InvCod(i));
                RegistroRecomendacionPV(i) = C_G_Recomendacion_PV(tabla.RecPVCod(i), panel, bateria, inversor, tabla.PanCan(i), tabla.BatCan(i));
            end
        end
        
    end
end