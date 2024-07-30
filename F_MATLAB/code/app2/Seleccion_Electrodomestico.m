function Seleccion_Electrodomestico(app)
    drawnow;
    
    % Obtener el valor seleccionado del Dropdown
    value = app.D_Electrodomesticos_IngresarE_1.Value;
    
    % Establecer el nombre del electrodoméstico en el campo correspondiente
    app.Fi_Nombre_anadir_IngresarE_1.Value = value;
    
    % Obtener los datos del electrodoméstico seleccionado
    data = app.M1.Obj_Electrodomesticos(value);
    disp(data);
    
    % Establecer los valores de los campos basados en los datos obtenidos
    app.Fi_PotenciaEnWatts_IngresarE_1.Value = data.consumo_potencia_base;
    app.Fi_Cantidad_IngresarE_1.Value = 1;
    app.Fi_HorasNoche_1_IngresarE_1.Value = 0;
    app.Fi_Uso_Semana_IngresarE_1.Value = 1;
    app.Fi_HorasDias_IngresarE_1.Value = 1;
    
    % Llamar a la función para mostrar la imagen del electrodoméstico
    mostrar_Imagen(app, data.ambiente.nombre, data.base_codigo, app.Image9);
end
