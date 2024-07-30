function GraficoConsumoTendencia(app)
    % Obtener todos los datos de la tabla
    datos = app.T_Electrodomesticos_Gestionar_1.Data;

    % Verificar si hay datos
    if isempty(datos)
        disp('No hay datos disponibles para graficar.');
        return; % Salir de la función si no hay datos
    end

    % Verificar si las columnas necesarias existen
    numCols = size(datos, 2);
    if numCols < 5
        disp('Los datos no contienen suficientes columnas.');
        return; % Salir de la función si no hay suficientes columnas
    end

    % Extraer los datos de las columnas específicas
    electrodomesticos = datos(:, 2); % columna 2 nombres
    potencias = cell2mat(datos(:, 3)); % columna 3 tiene las potencias
    horas_dia = cell2mat(datos(:, 4)); % columna 4 tiene las horas en el día
    horas_noche = cell2mat(datos(:, 5)); % columna 5 tiene las horas en la noche

    % Crear nombres únicos para las columnas de la tabla
    nombres_unicos = makeUniqueColumnNames(electrodomesticos);

    % Inicializar la tabla de uso por hora
    horas = [6:23, 0:5]; % Horas del día y la noche
    uso_hora = zeros(length(horas), length(electrodomesticos)); % Matriz de uso por hora

    % Definir los rangos de horas de día y noche
    rango_dia = 6:17;
    rango_noche = [18:23, 0:5];

    % Llenar la tabla con los datos de uso por hora
    for i = 1:length(electrodomesticos)
        % Llenar las horas de día desde la última hora hacia atrás
        for j = 0:horas_dia(i)-1
            hora = mod(rango_dia(end) - j - 6, 24); % Ajustar para que el índice sea correcto
            uso_hora(hora + 1, i) = potencias(i); % +1 porque las horas en MATLAB empiezan desde 1
        end
        
        % Llenar las horas de noche desde la primera hora hacia adelante
        for j = 0:horas_noche(i)-1
            hora = mod(rango_noche(1) + j - 6, 24); % Ajustar para que el índice sea correcto
            uso_hora(hora + 1, i) = potencias(i); % +1 porque las horas en MATLAB empiezan desde 1
        end
    end

    % Convertir a tabla para visualización
    t = array2table(uso_hora, 'VariableNames', nombres_unicos, 'RowNames', cellstr(num2str(horas')));
    disp(t);

    % Crear un arreglo de horas ordenado
    horas_ordenadas = 0:23; % Orden correcto

    % Crear etiquetas para el eje X
    etiquetas_horas = {'6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', ...
                       '18', '19', '20', '21', '22', '23', '0', '1', '2', '3', '4', '5'};

    % Calcular la potencia total consumida
    potencia_total = sum(sum(uso_hora));

    % Graficar la suma de potencia por hora en el UIAxes de la aplicación
    ax = app.G_PvsT_Tendencias_1; % Obtener el UIAxes
    
    % Limpiar el UIAxes antes de graficar
    cla(ax);

    % Graficar la suma de potencia por hora
    plot(ax, horas_ordenadas, sum(uso_hora, 2), '-o', 'LineWidth', 2);
    
    % Configurar los ejes
    xticks(ax, horas_ordenadas); % Asegurarse de que todas las horas estén en el eje X
    xticklabels(ax, etiquetas_horas); % Asignar las etiquetas al eje X
    xlabel(ax, 'Hora Dia|Hora Noche');
    ylabel(ax, 'Potencia (W)');
    title(ax, 'Consumo de Potencia por Hora');
    grid(ax, 'on');

    % Ajustar el tamaño de la fuente para mejorar la visibilidad
    ax.XAxis.FontSize = 10;
    ax.YAxis.FontSize = 10;
    ax.Title.FontSize = 12;
    ax.XLabel.FontSize = 10;
    ax.YLabel.FontSize = 10;

    % Ajustar los límites del eje X e Y para mejorar la visualización
    xlim(ax, [0 23]); % Ajustar el margen en el eje X
    ylim(ax, [0 max(sum(uso_hora, 2)) * 1.1]); % Aumentar el margen en el eje Y, 10% más alto que el valor máximo

    % Agregar descripción en el TextArea con la potencia total
    app.TA_DescripcionAnalisisPvsT_Tendencias_1.Value = sprintf('La potencia total consumida en un dia es: %.2f W', potencia_total);
end

function uniqueNames = makeUniqueColumnNames(names)
    % Generar nombres únicos para las columnas de la tabla
    uniqueNames = names;
    counts = containers.Map;
    for i = 1:length(uniqueNames)
        name = uniqueNames{i};
        if isKey(counts, name)
            counts(name) = counts(name) + 1;
            uniqueNames{i} = sprintf('%s_%d', name, counts(name));
        else
            counts(name) = 1;
        end
    end
end
