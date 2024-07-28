function Seleccion_Electrodomestico(app)
    drawnow;
    value = app.D_Electrodomesticos_IngresarE_1.Value;
    app.Fi_Nombre_anadir_IngresarE_1.Value = value;
    % Obtener los datos del electrodoméstico seleccionado
    data = app.M1.Obj_Electrodomesticos(value);
    disp(data);
    app.Fi_PotenciaEnWatts_IngresarE_1.Value = data.consumo_potencia_base;
    % Llamar a la nueva función para mostrar la imagen
    mostrar_Imagen(app, data.ambiente.nombre, data.base_codigo);
end