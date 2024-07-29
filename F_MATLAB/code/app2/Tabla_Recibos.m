% Creación tabla de recibos

function Tabla_Recibos(app)
    app.T_Recibo_1.Data = app.M1.Table_Recibos();
end

% Retorna los datos para la tabla