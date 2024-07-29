%Selección y eliminación de electrodoméstico, con su confirmación

function Eliminar_Electrodomestico(app)
    % Obtener la selección y los datos de la tabla
    selection = app.T_Electrodomesticos_Gestionar_1.Selection;
    rowData = app.T_Electrodomesticos_Gestionar_1.Data([selection(:,1)], :);

    % Obtener el nombre del electrodoméstico
    nombreElectrodomestico = rowData{2}; % Asumiendo que el nombre está en la segunda columna

    % Crear mensaje de confirmación con el nombre del electrodoméstico
    mensajeConfirmacion = sprintf('¿Estás seguro de eliminar el electrodoméstico "%s"?', nombreElectrodomestico);

    % Mostrar cuadro de confirmación
    seleccion = uiconfirm(app.P_Main, mensajeConfirmacion, ...
        'Confirmacion', 'Options', {'Si', 'No'}, 'DefaultOption', 2, 'CancelOption', 2, ...
        'Icon', 'warning');
    
    if strcmp('Si', seleccion)
        % Eliminar el electrodoméstico de la tabla
        app.T_Electrodomesticos_Gestionar_1.Data([selection(:,1)], :) = [];
        
        % Convertir el código a número (asumiendo que está en la primera columna)
        codigo = rowData{1};
        
        % Llamar a la función para eliminar el electrodoméstico de la clase M1
        app.M1 = app.M1.D_Electrodomesticos(codigo);
    end
end

%No retorna nada