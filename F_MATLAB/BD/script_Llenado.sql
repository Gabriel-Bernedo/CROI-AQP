USE `mydb` ;
-- Insertar los datos a la tabla Tipo con el estado activo "A"
INSERT INTO Tipo (TipNom, TipEstReg) VALUES ('Altamente Esencial', 'A');
INSERT INTO Tipo (TipNom, TipEstReg) VALUES ('Esencial', 'A');
INSERT INTO Tipo (TipNom, TipEstReg) VALUES ('No Esencial', 'A');


-- Insertar los datos a la tabla Ambiente con el estado activo "A"
INSERT INTO Ambiente (AmbNom, AmbEstReg) VALUES ('Cocina', 'A');
INSERT INTO Ambiente (AmbNom, AmbEstReg) VALUES ('Sala', 'A');
INSERT INTO Ambiente (AmbNom, AmbEstReg) VALUES ('Dormitorio', 'A');
INSERT INTO Ambiente (AmbNom, AmbEstReg) VALUES ('Baño', 'A');
INSERT INTO Ambiente (AmbNom, AmbEstReg) VALUES ('Lavanderia', 'A');

-- Insertar los datos Cocina con el estado activo "A"
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Horno Electrico', 4500, 1, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Hervidor de agua', 1700, 1, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Horno microondas', 1100, 1, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Waflera', 600, 1, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Olla arrocera', 800, 1, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Tostadora', 1000, 1, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Cafetera', 500, 1, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Licuadora', 300, 1, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Refrigeradora', 200, 1, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Batidora', 100, 1, 'A');

-- Insertar los datos Sala con el estado activo "A"
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Equipo de aire acondicionado', 700, 2, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Foco (Incandescente o LED)', 20, 2, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Televisor', 100, 2, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Equipo de sonido', 25, 2, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Laptop', 25, 2, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('DVD', 25, 2, 'A');

-- Insertar los datos Dormitorio con el estado activo "A"
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Computadora', 100, 3, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Ventilador', 100, 3, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Play Station', 100, 3, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Cargador de celular', 20, 3, 'A');

-- Insertar los datos Baño con el estado activo "A"
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Ducha eléctrica', 3700, 4, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Terma eléctrica', 1200, 4, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Secadora de cabello', 1000, 4, 'A');

-- Insertar los datos Lavandería con el estado activo "A"
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Secadora de ropa', 4200, 5, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Plancha', 1000, 5, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Aspiradora', 900, 5, 'A');
INSERT INTO Electrodomesticos (EleNom, ElePotCon, ambCod, EleEstReg) VALUES ('Lavadora', 300, 5, 'A');



-- Insertar en la tabla Region_ con el estado activo "A"
INSERT INTO Region (RegNom, RegEstReg) VALUES ('Arequipa', 'A');

-- Insertar datos en la tabla Radiacion_Mes_Temperatura con el estado activo "A"
INSERT INTO Radiacion_Mes_Temperatura (RadCod, TemCod, RegCod, RadMes, RadMesTemEstReg) VALUES (233.3, 15.1, 1, 'Enero', 'A');
INSERT INTO Radiacion_Mes_Temperatura (RadCod, TemCod, RegCod, RadMes, RadMesTemEstReg) VALUES (197.8, 14.8, 1, 'Febrero', 'A');
INSERT INTO Radiacion_Mes_Temperatura (RadCod, TemCod, RegCod, RadMes, RadMesTemEstReg) VALUES (229.5, 15.1, 1, 'Marzo', 'A');
INSERT INTO Radiacion_Mes_Temperatura (RadCod, TemCod, RegCod, RadMes, RadMesTemEstReg) VALUES (211.2, 15.0, 1, 'Abril', 'A');
INSERT INTO Radiacion_Mes_Temperatura (RadCod, TemCod, RegCod, RadMes, RadMesTemEstReg) VALUES (197.5, 14.9, 1, 'Mayo', 'A');
INSERT INTO Radiacion_Mes_Temperatura (RadCod, TemCod, RegCod, RadMes, RadMesTemEstReg) VALUES (183.6, 14.0, 1, 'Junio', 'A');
INSERT INTO Radiacion_Mes_Temperatura (RadCod, TemCod, RegCod, RadMes, RadMesTemEstReg) VALUES (196.5, 14.0, 1, 'Julio', 'A');
INSERT INTO Radiacion_Mes_Temperatura (RadCod, TemCod, RegCod, RadMes, RadMesTemEstReg) VALUES (201.4, 14.8, 1, 'Agosto', 'A');
INSERT INTO Radiacion_Mes_Temperatura (RadCod, TemCod, RegCod, RadMes, RadMesTemEstReg) VALUES (220.9, 15.1, 1, 'Septiembre', 'A');
INSERT INTO Radiacion_Mes_Temperatura (RadCod, TemCod, RegCod, RadMes, RadMesTemEstReg) VALUES (256.0, 15.4, 1, 'Octubre', 'A');
INSERT INTO Radiacion_Mes_Temperatura (RadCod, TemCod, RegCod, RadMes, RadMesTemEstReg) VALUES (263.5, 15.1, 1, 'Noviembre', 'A');
INSERT INTO Radiacion_Mes_Temperatura (RadCod, TemCod, RegCod, RadMes, RadMesTemEstReg) VALUES (273.0, 15.5, 1, 'Diciembre', 'A');


-- Insertar datos en la tabla Costo_Kw_historial

INSERT INTO `mydb`.`Costo_Kw_historial` (CosKHisMon, CosKHisM, CosKHisA, CosKHisEstReg) VALUES
(0.4072, 1, 2014, 'A'),
(0.4318, 2, 2014, 'A'),
(0.4318, 3, 2014, 'A'),
(0.4424, 4, 2014, 'A'),
(0.4564, 5, 2014, 'A'),
(0.4564, 6, 2014, 'A'),
(0.4572, 7, 2014, 'A'),
(0.4356, 8, 2014, 'A'),
(0.4376, 9, 2014, 'A'),
(0.4482, 10, 2014, 'A'),
(0.4447, 11, 2014, 'A'),
(0.4447, 12, 2014, 'A'),
(0.4587, 1, 2015, 'A'),
(0.4703, 2, 2015, 'A'),
(0.4703, 3, 2015, 'A'),
(0.4703, 4, 2015, 'A'),
(0.4955, 5, 2015, 'A'),
(0.4955, 6, 2015, 'A'),
(0.5110, 7, 2015, 'A'),
(0.5141, 8, 2015, 'A'),
(0.5185, 9, 2015, 'A'),
(0.5185, 10, 2015, 'A'),
(0.5204, 11, 2015, 'A'),
(0.5223, 12, 2015, 'A'),
(0.5396, 1, 2016, 'A'),
(0.5394, 2, 2016, 'A'),
(0.5404, 3, 2016, 'A'),
(0.5217, 4, 2016, 'A'),
(0.5174, 5, 2016, 'A'),
(0.5210, 6, 2016, 'A'),
(0.5210, 7, 2016, 'A'),
(0.5281, 8, 2016, 'A'),
(0.5293, 9, 2016, 'A'),
(0.5334, 10, 2016, 'A'),
(0.5525, 11, 2016, 'A'),
(0.5525, 12, 2016, 'A'),
(0.5379, 1, 2017, 'A'),
(0.5362, 2, 2017, 'A'),
(0.5362, 3, 2017, 'A'),
(0.5362, 4, 2017, 'A'),
(0.5122, 5, 2017, 'A'),
(0.5131, 6, 2017, 'A'),
(0.5263, 7, 2017, 'A'),
(0.5263, 8, 2017, 'A'),
(0.5264, 9, 2017, 'A'),
(0.5264, 10, 2017, 'A'),
(0.5457, 11, 2017, 'A'),
(0.5538, 12, 2017, 'A'),
(0.5538, 1, 2018, 'A'),
(0.5732, 2, 2018, 'A'),
(0.5756, 3, 2018, 'A'),
(0.5757, 4, 2018, 'A'),
(0.5537, 5, 2018, 'A'),
(0.5537, 6, 2018, 'A'),
(0.5567, 7, 2018, 'A'),
(0.5563, 8, 2018, 'A'),
(0.5563, 9, 2018, 'A'),
(0.5564, 10, 2018, 'A'),
(0.5656, 11, 2018, 'A'),
(0.5656, 12, 2018, 'A'),
(0.5665, 1, 2019, 'A'),
(0.5784, 2, 2019, 'A'),
(0.5767, 3, 2019, 'A'),
(0.5765, 4, 2019, 'A'),
(0.5781, 5, 2019, 'A'),
(0.5781, 6, 2019, 'A'),
(0.5761, 7, 2019, 'A'),
(0.5658, 8, 2019, 'A'),
(0.5664, 9, 2019, 'A'),
(0.5815, 10, 2019, 'A'),
(0.6077, 11, 2019, 'A'),
(0.6177, 12, 2019, 'A'),
(0.6178, 1, 2020, 'A'),
(0.6114, 2, 2020, 'A'),
(0.6114, 3, 2020, 'A'),
(0.6114, 4, 2020, 'A'),
(0.6114, 5, 2020, 'A'),
(0.6188, 6, 2020, 'A'),
(0.6342, 7, 2020, 'A'),
(0.6407, 8, 2020, 'A'),
(0.6407, 9, 2020, 'A'),
(0.6430, 10, 2020, 'A'),
(0.6440, 11, 2020, 'A'),
(0.6604, 12, 2020, 'A'),
(0.6609, 1, 2021, 'A'),
(0.6598, 2, 2021, 'A'),
(0.6598, 3, 2021, 'A'),
(0.6711, 4, 2021, 'A'),
(0.6542, 5, 2021, 'A'),
(0.6579, 6, 2021, 'A'),
(0.6646, 7, 2021, 'A'),
(0.6864, 8, 2021, 'A'),
(0.6950, 9, 2021, 'A'),
(0.7285, 10, 2021, 'A'),
(0.7236, 11, 2021, 'A'),
(0.7263, 12, 2021, 'A'),
(0.7263, 1, 2022, 'A'),
(0.7305, 2, 2022, 'A'),
(0.7305, 3, 2022, 'A'),
(0.7336, 4, 2022, 'A'),
(0.7394, 5, 2022, 'A'),
(0.7411, 6, 2022, 'A'),
(0.7435, 7, 2022, 'A'),
(0.7700, 8, 2022, 'A'),
(0.7700, 9, 2022, 'A'),
(0.7735, 10, 2022, 'A'),
(0.8136, 11, 2022, 'A'),
(0.8117, 12, 2022, 'A'),
(0.8112, 1, 2023, 'A'),
(0.7711, 2, 2023, 'A'),
(0.7711, 3, 2023, 'A'),
(0.7639, 4, 2023, 'A'),
(0.7506, 5, 2023, 'A'),
(0.7471, 6, 2023, 'A'),
(0.7471, 7, 2023, 'A'),
(0.7086, 8, 2023, 'A'),
(0.7117, 9, 2023, 'A'),
(0.7135, 10, 2023, 'A'),
(0.7428, 11, 2023, 'A'),
(0.7403, 12, 2023, 'A'),
(0.7403, 1, 2024, 'A'),
(0.7316, 2, 2024, 'A'),
(0.7316, 3, 2024, 'A'),
(0.7316, 4, 2024, 'A'),
(0.7327, 5, 2024, 'A'),
(0.7314, 6, 2024, 'A'),
(0.7314, 7, 2024, 'A');

INSERT INTO PanelSolar (PanMod, PanPot, PanCosMon, PanTieVid, PanCosMan, PanAnc, PanAlt, PanEstReg) VALUES
('Bateria AGM 12v 65Ah CSBattery', 550, 1200, 25, 0, 1133, 2278, 'A'),
('Panel solar 100w 12v policristalino Sunlake', 100, 700, 25, 0, 670, 1130, 'A'),
('Panel Solar 100w 12v Monocristalino Sunlake', 100, 700, 25, 0, 700, 1150, 'A'),
('Panel solar 150w 12v policristalino Sunlake', 150, 900, 25, 0, 680, 1480, 'A'),
('Panel solar 150w 12v monocristalino Sunlake', 150, 950, 25, 0, 680, 1480, 'A'),
('Panel Solar 340w 24v Policristalino Eco Green', 340, 871.50, 25, 0, 992, 1956, 'A'),
('Panel Solar 450w 24v Monocristalino PERC Eco Green', 450, 1410, 25, 0, 1040, 2102, 'A'),
('Panel Solar 460Wp 24v Amerisolar Monocristalino Perc Half Cell', 460, 1180, 25, 0, 1040, 2102, 'A'),
('Panel Solar 550w 24v Monocristalino PERC Eco Green', 550, 1350, 25, 0, 1040, 2102, 'A'),
('Panel Solar policristalino 100wp Renjiang', 100, 369.64, 25, 0, 670, 1000, 'A'),
('Panel Solar 100W Amerisolar Policristalino', 100, 456, 25, 0, 670, 1010, 'A'),
('Panel Solar 150W Amerisolar Policristalino', 150, 600, 25, 0, 670, 1480, 'A'),
('Panel Solar 340W Amerisolar Policristalino', 340, 1160, 25, 0, 992, 1956, 'A'),
('Panel Solar 370Wp Amerisolar Monocristalino PERC', 370, 1272, 25, 0, 992, 1956, 'A'),
('Panel Solar Monocristalino 150W Sunlake', 150, 305, 25, 0, 670, 1480, 'A'),
('Panel Solar 160W Amerisolar Policristalino', 160, 625.56, 25, 0, 670, 1480, 'A'),
('Panel Solar 285W Amerisolar Policristalino', 285, 846.72, 25, 0, 992, 1640, 'A'),
('Panel Solar 370W Peimar Monocristalino PERC Peimar Italian', 370, 1142.89, 25, 0, 992, 1957, 'A'),
('Panel Solar 150W Peimar Italian Policristalino', 150, 485.73, 25, 0, 674, 1480, 'A'),
('Panel Solar 285wp Policristalino Peimar Italian', 285, 885.72, 25, 0, 992, 1640, 'A'),
('Panel Solar Jinko Solar 400Wp HC Monocristalino PERC', 400, 1244.8, 25, 0, 1002, 2008, 'A'),
('Panel Solar 400W Peimar Monocristalino PERC Peimar Italian', 400, 1196, 25, 0, 1002, 1979, 'A'),
('Panel Solar 450W Peimar Monocristalino Half Cell PERC Peimar Italian', 450, 1465.72, 25, 0, 1048, 2115, 'A'),
('Panel Solar 315wp Monocristalino PERC Peimar Italian', 315, 982.84, 25, 0, 992, 1640, 'A'),
('Panel Solar 340wp Policristalino Peimar Italian', 340, 1040, 25, 0, 992, 1956, 'A'),
('Panel Solar Jinko Solar 335Wp Policristalino', 335, 1045.73, 25, 0, 992, 1956, 'A'),
('Panel Solar 270wp Policristalino AE Solar PowerPlus', 270, 732.92, 25, 0, 992, 1650, 'A'),
('Panel Solar 450W TrinaSolar Monocristalino Half Cell PERC TALLMAX', 450, 1465.72, 25, 0, 1040, 2102, 'A'),
('TRINA SOLAR PANEL 24V 400W MONOPERC HALF CELL', 400, 1220.02, 25, 0, 1096, 1754, 'A'),
('PANEL SOLAR 460W 24V AE SOLAR MONOCRISTALINO PERC', 460, 1046, 25, 0, 1133, 1902, 'A');


INSERT INTO Inversor (InvMod, InvPot, InvAdmVol, InvCosMon, InvTieVid, InvCosMan, InvEstReg)
VALUES
('Inversor Victron Phoenix 24V 375VA VE.Direct', 700, 24, 458.06, 25, 0, 'A'),
('Inversor Victron Phoenix 24V 500VA VE.Direct', 900, 24, 570.66, 25, 0, 'A'),
('Inversor Victron Phoenix 24V 250VA VE.Direct', 400, 24, 486.76, 25, 0, 'A'),
('Inversor Victron Phoenix 24V 800VA VE.Direct', 1500, 24, 1038.78, 25, 0, 'A'),
('Inversor Victron Phoenix 24V 1200VA VE.Direct', 2200, 24, 1397.18, 25, 0, 'A'),
('Inversor Victron Phoenix 48V 1200VA 120V VE.Direct 5-15R', 2200, 48, 1363.17, 25, 0, 'A'),
('Inversor Victron Phoenix 48V 375VA VE.Direct', 700, 48, 521.04, 25, 0, 'A'),
('Inversor Victron Phoenix 48V 800VA VE.Direct', 1500, 48, 1114.62, 25, 0, 'A'),
('Inversor Victron Phoenix 48V 1200VA VE.Direct', 2200, 48, 1600.12, 25, 0, 'A'),
('Inversor Victron Phoenix 48V 250VA VE.Direct', 400, 48, 644.46, 25, 0, 'A'),
('Inversor Victron Phoenix 12V 375VA 120V VE.Direct 5-15R', 650, 12, 471.54, 25, 0, 'A'),
('Inversor Victron Phoenix 12V 500VA 120V VE.Direct 5-15R', 1000, 12, 592.99, 25, 0, 'A'),
('Inversor Victron Phoenix 12V 375VA VE.Direct', 700, 12, 455.33, 25, 0, 'A'),
('Inversor Victron Phoenix 12V 250VA VE.Direct', 400, 12, 494.74, 25, 0, 'A'),
('Inversor cargador 300W 12V 10A Must Solar', 300, 12, 506.4, 25, 0, 'A'),
('Inversor Victron Phoenix 12V 800VA VE.Direct', 1500, 12, 973.85, 25, 0, 'A');

INSERT INTO Bateria (BatMod, BatLag, BatAnc, BatAlt, BatVol, BatCap, BatTip, BatCosMon)
VALUES
('Bateria AGM 12v 65Ah CSBattery', 350, 167, 178, 12, 65, 'AGM', 792),
('Bateria AGM 12v 100Ah CSBattery', 350, 175, 190, 12, 100, 'AGM', 742),
('Bateria AGM 12v 150Ah CSBattery', 360, 180, 200, 12, 150, 'AGM', 810),
('Bateria Narada 12v 100Ah AGM', 395, 108, 287, 12, 100, 'AGM', 1217.76),
('Bateria Narada 12v 150Ah AGM', 550, 125, 283, 12, 150, 'AGM', 1585.92),
('Bateria AGM 12v 100Ah Kaise', 330, 171, 215, 12, 100, 'AGM', 868.28),
('BATERIA KAISE AGM 12V 65A', 348, 167, 178, 12, 65, 'AGM', 616.80),
('Bateria Solar AGM 12v 100Ah Aokly', 331, 173, 213, 12, 100, 'AGM', 857.21),
('Bateria Kaise AGM 150Ah Libre Mantenimiento', 483, 170, 238.5, 12, 150, 'AGM', 1305.61),
('BATERIA SOLAR AOKLY 12V 200AH AGM LIBRE MANTENIMIENTO', 522, 240, 218, 12, 200, 'AGM', 1388.05),
('Bateria Kaise AGM 200Ah Libre Mantenimiento', 546, 125, 310, 12, 200, 'AGM', 1837.40),
('Bateria Solar AGM 12v 65Ah Aokly', 340, 170, 180, 12, 65, 'AGM', 648.05),
('BATERIA SOLAR GEL 12V 100AH AOKLY', 329, 172, 214, 12, 100, 'GEL', 1097.20),
('Bateria GEL 12v 100Ah Kaise', 330, 171, 216, 12, 100, 'GEL', 744.05),
('BATERIA CSBattery 600A 6V', 300, 200, 250, 6, 600, 'GEL', 0),
('BATERIA SOLAR 200Ah 12v GEL CSBATTERY', 532, 206, 219, 12, 200, 'GEL', 1047),
('BATERIA DE GEL CSBattery 100Ah 12V', 307, 169, 211, 12, 100, 'GEL', 525.00),
('BATERIA MARCA CSBATTERY LITIO 12V 100AH', 522, 240, 224, 12, 100, 'LITIO', 1500);
