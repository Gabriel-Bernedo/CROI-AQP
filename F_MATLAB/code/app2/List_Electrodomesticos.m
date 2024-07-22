function List_Electrodomesticos(app)
    dataArray = Registro_Tabla('ambiente').AmbNom';
    AmbId = find(strcmp(dataArray,app.D_Ambiente_IngresarE_1.Value));
    query = sprintf('SELECT * FROM electrodomesticos WHERE ambCod = ''%s''', num2str(AmbId));
    data = fetch(conectarBD(), query);
    data = cellstr(data.EleNom);
    app.D_Electrodomesticos_IngresarE_1.Items = data;
    
end
