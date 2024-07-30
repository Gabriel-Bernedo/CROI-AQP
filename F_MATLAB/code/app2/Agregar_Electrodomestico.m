function Agregar_Electrodomestico(app)
    % Obtener los valores de los campos
    dia = app.Fi_HorasDias_IngresarE_1.Value;
    noche = app.Fi_HorasNoche_1_IngresarE_1.Value;
    semana = app.Fi_Uso_Semana_IngresarE_1.Value;
    potencia = app.Fi_PotenciaEnWatts_IngresarE_1.Value;
    cantidad = app.Fi_Cantidad_IngresarE_1.Value;
    electrodomestico = app.Fi_Nombre_anadir_IngresarE_1.Value;
    tipo = app.D_Tipo_anadir_IngresarE_1.Value;
    
    % Obtener todos los datos de la tabla
    datos = app.T_Electrodomesticos_Gestionar_1.Data;
    
    % Validar los datos ingresados
    if semana < 1
        uialert(app.P_Main, 'El uso por semana debe ser al menos 1.', 'Error de Entrada', 'Icon', 'error');
        return;
    elseif dia < 0 || noche < 0
        uialert(app.P_Main, 'Los valores de uso en días y noches no pueden ser negativos.', 'Error de Entrada', 'Icon', 'error');
        return;
    elseif dia > 12 || noche > 12
        uialert(app.P_Main, 'El uso durante el día y la noche no puede exceder de 12 horas.', 'Error de Entrada', 'Icon', 'error');
        return;
    elseif dia == 0 && noche == 0
        uialert(app.P_Main, 'Al menos una de las horas de uso durante el día o la noche debe ser mayor que 0.', 'Error de Entrada', 'Icon', 'error');
        return;
    elseif potencia <= 0
        uialert(app.P_Main, 'La potencia debe ser mayor que cero.', 'Error de Entrada', 'Icon', 'error');
        return;
    elseif cantidad < 0
        uialert(app.P_Main, 'La cantidad no puede ser negativa.', 'Error de Entrada', 'Icon', 'error');
        return;
    elseif mod(cantidad, 1) ~= 0
        uialert(app.P_Main, 'La cantidad debe ser un número entero sin decimales.', 'Error de Entrada', 'Icon', 'error');
        return;
    elseif cantidad > 15
        % Confirmar si el usuario está seguro de ingresar una cantidad mayor a 15
        mensajeConfirmacion = sprintf('¿Estás seguro de ingresar %d electrodomésticos?', cantidad);
        seleccion = uiconfirm(app.P_Main, mensajeConfirmacion, ...
            'Confirmación de Cantidad', 'Options', {'Sí', 'No'}, 'DefaultOption', 2, 'CancelOption', 2, ...
            'Icon', 'warning');
        
        if strcmp('No', seleccion)
            return;
        end
    end
    
    if ~isempty(datos)
        % Verificar si el electrodoméstico ya existe con el mismo nombre y potencia
        nombres_electrodomesticos = datos(:, 2); % Columna de nombres, suponiendo que es la primera columna
        potencias_electrodomesticos = cell2mat(datos(:, 3)); % Columna de potencias, suponiendo que es la segunda columna
        
        % Comparar nombres y potencias
        for i = 1:length(nombres_electrodomesticos)
            if strcmp(nombres_electrodomesticos{i}, electrodomestico) && potencias_electrodomesticos(i) == potencia
                % Mostrar mensaje de error si se encuentra un electrodoméstico repetido
                mensajeError = sprintf('El electrodoméstico "%s" con potencia %.2f ya existe en la tabla.', electrodomestico, potencia);
                uialert(app.P_Main, mensajeError, 'Error de Entrada', 'Icon', 'error');
                return;
            end
        end
    end

    % Si los datos son válidos y el electrodoméstico no existe con el mismo nombre y potencia, agregarlo
    nuevoRegistro = {electrodomestico, potencia, dia, noche, semana, cantidad, tipo};
    app.M1 = app.M1.I_Electrodomesticos(nuevoRegistro);
    
    % Mostrar mensaje de éxito con ícono de éxito
    uialert(app.P_Main, 'Electrodoméstico agregado exitosamente.', 'Éxito', 'Icon', 'success');
end
