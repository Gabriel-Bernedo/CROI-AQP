%Recibe un electrodoméstico y valida sus datos para evitar errores del
%usuario

function Agregar_Electrodomestico(app)
    % Obtener los valores de los campos
    dia = app.Fi_HorasDias_IngresarE_1.Value;
    noche = app.Fi_HorasNoche_1_IngresarE_1.Value;
    semana = app.Fi_Uso_Semana_IngresarE_1.Value;
    potencia = app.Fi_PotenciaEnWatts_IngresarE_1.Value;
    cantidad = app.Fi_Cantidad_IngresarE_1.Value;
    electrodomestico = app.Fi_Nombre_anadir_IngresarE_1.Value;
    tipo = app.D_Tipo_anadir_IngresarE_1.Value;

    % Validar los datos ingresados
    if dia < 0 || noche < 0 || semana < 0
        uialert(app.P_Main, 'No se aceptan datos negativos en los campos de uso.', 'Error de Entrada', 'Icon', 'error');
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

    % Si los datos son válidos, agregar el electrodoméstico
    datos = {electrodomestico, potencia, dia, noche, semana, cantidad, tipo};
    app.M1 = app.M1.I_Electrodomesticos(datos);
    
    % Mostrar mensaje de éxito con ícono de éxito
    uialert(app.P_Main, 'Electrodoméstico agregado exitosamente.', 'Éxito', 'Icon', 'success');
end

%No retorna nada, solo añade el electrodomestico
