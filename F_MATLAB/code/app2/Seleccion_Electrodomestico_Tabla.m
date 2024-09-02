%Selección de electrodomésticos en la tabla general

function Seleccion_Electrodomestico_Tabla(app)
    % Obtener la selección y los datos de la tabla
    selection = app.T_Electrodomesticos_Gestionar_1.Selection;
    sel = app.T_Electrodomesticos_Gestionar_1.Data(selection(:,1), :);
    
    % Obtener el nombre del electrodoméstico
    nombreElectrodomestico = sel{2};

    % Llamar a Obj_Electrodomesticos para obtener el objeto del electrodoméstico
    electrodomestico = app.M1.Obj_Electrodomesticos(nombreElectrodomestico);

    % Actualizar los campos de la interfaz
    app.NombreLabel.Text = sel{2};
    app.Fi_Horas_ModificarE_1.Value = sel{4};
    app.Fi_Modificar_ModificarE_1.Value = sel{3};
    app.Fi_Dias_ModificarE_1.Value = sel{6};
    app.Fi_Horas_ModificarE_2.Value = sel{5};
    app.Fi_Unidad_Electrodomestico.Value = sel{7};
    
    % Obtener el tipo actual del DropDown
    tipoValue = sel{8};

    % Verificar si el tipo está en el DropDown y seleccionarlo si es así
    if ismember(tipoValue, app.D_Tipo_ModificarE_1.Items)
        app.D_Tipo_ModificarE_1.Value = tipoValue;
    else
        % Si el tipo no está en la lista, opcionalmente puedes manejar esto aquí
        disp(['El tipo "', tipoValue, '" no está en el DropDown.']);
    end

    % Hacer visible el botón de editar
    app.B_Editar_Electrodomestico.Visible = "on";

    % Llamar a mostrar_Imagen para mostrar la imagen del electrodoméstico
    mostrar_Imagen(app, electrodomestico.ambiente.nombre, electrodomestico.base_codigo, app.Image7);
end

%Retorna los datos del electrodoméstico para editarlo