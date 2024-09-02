%Ingreso de recibo y validación de este

function Ingresar_Recibo(app)
    consumo = app.Fi_ConsumoMensual_IngresarR_1.Value;
    costo = app.Fi_CostoTotal_IngresarR_1.Value;
    fecha = app.Fi_ConsumoMesA_IngresarR_1.Value;
    Month = month(fecha);
    Year = year(fecha);
    %(consumo, costo,RecA,RecM)
    if(app.M1.Search_Recibo(Year,Month))
        uialert(app.UIFigure,'Ya existe un recibo registrado con ese mes y año','Duplicado','Icon','error');
    else
        data = {consumo,costo, Year, Month};
        app.M1 = app.M1.I_Recibos(data);
        uialert(app.UIFigure,'Se Registro Correctamente','Listo','Icon','success');
    end
    Anadir_Recibo_Default(app);
end

%Retorna alertas