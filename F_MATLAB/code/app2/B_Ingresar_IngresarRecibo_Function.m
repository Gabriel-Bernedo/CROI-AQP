function B_Ingresar_IngresarRecibo_Function(app)
    consumo = app.Fi_ConsumoMensual_IngresarR_1.Value;
    costo = app.Fi_CostoTotal_IngresarR_1.Value;
    fecha = app.Fi_ConsumoMesA_IngresarR_1.Value;
    Month = month(fecha);
    Year = year(fecha);
    data = table(consumo,costo,Year, Month, "A", 'VariableNames', {'RecConMen', 'RecCosTot', 'RecA', 'RecM', 'RecEstReg'});
    app.BD.Insertar_Registro("recibo", data)
end