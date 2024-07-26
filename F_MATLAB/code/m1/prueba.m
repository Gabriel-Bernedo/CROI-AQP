%TABLAS REFERENCIALES

BD = C_G_ControladorBD();

% Cargar tabla Ambiente
tabla = BD.Registro_Tabla('ambiente');
RegistroAmbiente = C_G_Ambiente.empty(height(tabla), 0);
for i = 1:height(tabla)
    RegistroAmbiente(i) = C_G_Ambiente(tabla.AmbCod(i), tabla.AmbNom{i});
end

% Cargar tabla Bateria
tabla = BD.Registro_Tabla('bateria');
RegistroBateria = C_G_Bateria.empty(height(tabla), 0);
for i = 1:height(tabla)
    RegistroBateria(i) = C_G_Bateria(tabla.BatCod(i), tabla.BatMod{i}, tabla.BatCap(i),tabla.BatCosMon(i), tabla.BatTieVid(i), tabla.BatCosMan(i), tabla.BatAlt(i), tabla.BatAnc(i), tabla.BatLag(i));
end

% Cargar tabla PanelSolar
tabla = BD.Registro_Tabla('panelsolar');
RegistroPanelSolar = C_G_PanelSolar.empty(height(tabla), 0);
for i = 1:height(tabla)
    RegistroPanelSolar(i) = C_G_PanelSolar(tabla.PanCod(i), tabla.PanMod{i}, tabla.PanPot(i), tabla.PanCosMon(i), tabla.PanTieVid(i), tabla.PanCosMan(i), tabla.PanAnc(i), tabla.PanAlt(i));
end


% Cargar tabla Inversor
tabla = BD.Registro_Tabla('inversor');
RegistroInversor = C_G_Inversor.empty(height(tabla), 0);
for i = 1:height(tabla)
    RegistroInversor(i) = C_G_Inversor(tabla.InvCod(i), tabla.InvMod{i}, tabla.InvPot(i), tabla.InvCosMon(i), tabla.InvTieVid(i), tabla.InvCosMan(i));
end

% Cargar tabla Recibo
tabla = BD.Registro_Tabla('recibo');
RegistroRecibo = C_G_Recibo.empty(height(tabla), 0);
for i = 1:height(tabla)
    RegistroRecibo(i) = C_G_Recibo(tabla.RecCod(i), tabla.RecConMen(i), tabla.RecCosTot(i));
end

% Cargar tabla Region
tabla = BD.Registro_Tabla('region');
RegistroRegion = C_G_Region.empty(height(tabla), 0);
for i = 1:height(tabla)
    RegistroRegion(i) = C_G_Region(tabla.RegCod(i), tabla.RegNom{i});
end

% Cargar tabla Costo_Kw_historial
tabla = BD.Registro_Tabla('costo_kw_historial');
RegistroCostoKwHistorial = C_G_Costo_Kw_Historial.empty(height(tabla), 0);
for i = 1:height(tabla)
    RegistroCostoKwHistorial(i) = C_G_Costo_Kw_Historial(tabla.CosKHisCod(i), tabla.CosKHisMon(i), tabla.CosKHisM(i), tabla.CosKHisA(i));
end

% Cargar tabla Tipo
tabla = BD.Registro_Tabla('tipo');
RegistroTipo = C_G_Tipo.empty(height(tabla), 0);
for i = 1:height(tabla)
    RegistroTipo(i) = C_G_Tipo(tabla.TipCod(i), tabla.TipNom{i});
end

%TABLAS ASOCIATIVAS

% Cargar tabla Electrodomesticos
tabla = BD.Registro_Tabla('electrodomesticos');
RegistroElectrodomesticos = C_G_ElectrodomesticoBase.empty(height(tabla), 0);
for i = 1:height(tabla)
    ambiente = RegistroAmbiente([RegistroAmbiente.codigo] == tabla.ambCod(i));
    RegistroElectrodomesticos(i) = C_G_ElectrodomesticoBase(tabla.EleCod(i), tabla.EleNom{i}, tabla.ElePotCon(i), ambiente);
end

% Cargar tabla Radiacion_Mes_Temperatura
tabla = BD.Registro_Tabla('radiacion_mes_temperatura');
RegistroRadiacionMesTemperatura = C_G_Radiacion_Mes_Temperatura.empty(height(tabla), 0);
for i = 1:height(tabla)
    region =  RegistroRegion([RegistroRegion.codigo] == tabla.RegCod(i));
    RegistroRadiacionMesTemperatura(i) = C_G_Radiacion_Mes_Temperatura(tabla.RadMesTemCod(i), tabla.RadCod(i), tabla.TemCod(i), region, tabla.RadMes{i});
end


% Cargar tabla Electrodomesticos_usuario
tabla = BD.Registro_Tabla('electrodomesticos_usuario');
RegistroElectrodomesticosUsuario = C_G_Electrodomestico.empty(height(tabla), 0);
for i = 1:height(tabla)
     elec_base = RegistroElectrodomesticos([RegistroElectrodomesticos.base_codigo] == tabla.EleUsuEleCod(i));
     tipo = RegistroTipo([RegistroTipo.codigo] == tabla.TipCod(i));
    RegistroElectrodomesticosUsuario(i) = C_G_Electrodomestico(elec_base, tabla.EleUsuCod(i), tabla.EleUsuPot(i), tabla.EleUsuFreDia(i), tabla.EleUsuFreNoc, tabla.EleUsuFreSem, tipo);
end

% Cargar tabla RecomendacionPV
tabla = BD.Registro_Tabla('recomendacionpv');
RegistroRecomendacionPV = C_G_Recomendacion_PV.empty(height(tabla), 0);
for i = 1:height(tabla)
    panel = RegistroPanelSolar([RegistroPanelSolar.codigo] == tabla.PanCod(i));
    bateria = RegistroBateria([RegistroBateria.codigo] == tabla.BatCod(i));
    inversor = RegistroInversor([RegistroInversor.codigo] == tabla.InvCod(i));
    RegistroRecomendacionPV(i) = C_G_Recomendacion_PV(tabla.RecPVCod(i), panel, bateria, inversor, tabla.PanCan(i), tabla.BatCan(i));
end