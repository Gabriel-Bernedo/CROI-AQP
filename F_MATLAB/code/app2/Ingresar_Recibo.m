function Ingresar_Recibo(app)
    consumo = app.Fi_ConsumoMensual_IngresarR_1.Value;
    costo = app.Fi_CostoTotal_IngresarR_1.Value;
    fecha = app.Fi_ConsumoMesA_IngresarR_1.Value;
    Month = month(fecha);
    Year = year(fecha);
    %(consumo, costo,RecA,RecM)
    data = {consumo,costo, Year, Month};
    app.M1 = app.M1.I_Recibos(data);
    uialert(app.P_Main,'Se Registro Correctamente','Listo','Icon','success');
end