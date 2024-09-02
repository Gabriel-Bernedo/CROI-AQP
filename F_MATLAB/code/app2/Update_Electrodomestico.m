
% Alerta de confirmación para la modificación de electrodomésticos

function Update_Electrodomestico(app)
    % Obtener los valores de los campos de entrada
    semana = app.Fi_Dias_ModificarE_1.Value;
    dia = app.Fi_Horas_ModificarE_1.Value;
    noche = app.Fi_Horas_ModificarE_2.Value;
    potencia = app.Fi_Modificar_ModificarE_1.Value;
    cantidad = app.Fi_Unidad_Electrodomestico.Value;
    tipo = app.D_Tipo_ModificarE_1.Value;
    
    % Selección de la fila de la tabla
    selection = app.T_Electrodomesticos_Gestionar_1.Selection;
    sel = app.T_Electrodomesticos_Gestionar_1.Data([selection(:,1)], :);
    
    % Obtener los valores actuales del electrodoméstico seleccionado
    nombreElectrodomestico = sel{2};
    potenciaActual = sel{3};
    diaActual = sel{4};
    nocheActual = sel{5};
    semanaActual = sel{6};
    cantidadActual = sel{7};
    tipoActual = sel{8};
    
    % Construir el mensaje de confirmación
    mensajeConfirmacion = sprintf(['¿Estas seguro de actualizar este registro?\n\n', ...
        'Electrodoméstico: %s\n\n', ...
        'Potencia: %d => %d\n', ...
        'Horas por día (Día): %d => %d\n', ...
        'Horas por día (Noche): %d => %d\n', ...
        'Días por semana: %d => %d\n', ...
        'Cantidad: %d => %d\n', ...
        'Tipo: %s => %s'], ...
        nombreElectrodomestico, potenciaActual, potencia, diaActual, dia, nocheActual, noche, ...
        semanaActual, semana, cantidadActual, cantidad, tipoActual, tipo);
    
    % Cuadro de diálogo de confirmación
    seleccion = uiconfirm(app.UIFigure, mensajeConfirmacion, ...
        'Confirmacion', 'Options', {'Si', 'No'}, 'DefaultOption', 2, 'CancelOption', 2, ...
        'Icon', 'warning');
    
    if strcmp('Si', seleccion)
        % Actualizar los datos del electrodoméstico
        %(codigo, potencia, dia, noche, semana, cantidad, tipo)
        data = {sel{1}, potencia, dia, noche, semana, cantidad, tipo};
        disp('Dato Alerta');
        disp(data);
        app.M1 = app.M1.E_Electrodomesticos(data);
        
        % Actualizar la tabla de electrodomésticos
        Tabla_Electrodomesticos(app);
        
        % Actualizar la interfaz de usuario
        app.B_Editar_Electrodomestico.Visible = "on";
        app.B_Actualizar_Electrodomestico.Visible = "off";
        app.B_Eliminar_Electrodomestico.Visible = "off";
        app.Fi_Modificar_ModificarE_1.Editable = "off";
        app.Fi_Dias_ModificarE_1.Editable = "off";
        app.Fi_Horas_ModificarE_1.Editable = "off";
        app.Fi_Horas_ModificarE_2.Editable = "off";
        app.Fi_Unidad_Electrodomestico.Editable = "off";
    end
end

% Retorna el electrodoméstico modificado o no en base a la respuesta de la
% alerta