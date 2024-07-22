function List_Ambiente(app)
    dataArray = cellstr(Registro_Tabla('ambiente').AmbNom)';
    app.D_Ambiente_IngresarE_1.Items = dataArray;
    List_Electrodomesticos(app);
end
