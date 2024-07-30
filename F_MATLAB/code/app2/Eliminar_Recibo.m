%Confirmación y selección de eliminación de dato

function Eliminar_Recibo(app)
    selection = app.T_Recibo_1.Selection;
    rowData = app.T_Recibo_1.Data([selection(:,1)], :);
    seleccion = uiconfirm(app.UIFigure,'¿Estas seguro de Elimar este registro?', ...
    'Confirmacion', 'Options',{'Si','No'}, 'DefaultOption',2,'CancelOption',2, ...
    'Icon','warning');
    if strcmp ('Si',seleccion)
        app.M1 = app.M1.D_Recibos(rowData{1});
        Tabla_Recibos(app);
        Gestionar_Recibo_Default(app);
    end
end

%No retorna nada