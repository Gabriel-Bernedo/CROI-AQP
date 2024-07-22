function List_Tipo(app)
    dataArray = cellstr(Registro_Tabla('tipo').TipNom)';
    app.Items = dataArray;
end