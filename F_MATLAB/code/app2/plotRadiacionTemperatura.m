%Gráfica para la radiación solar y temperatura

function plotRadiacionTemperatura(app)
    % plotRadiacionTemperatura Grafica datos de radiación solar y temperatura.
    % Esta función obtiene los datos de la clase M1_Calculadora_Consumo
    % y los grafica en un eje con dos yy-axis en un componente UIAxes
    % de App Designer.

    % Crear una instancia de la clase M1_Calculadora_Consumo
    calculadora = app.M1;

    % Obtener los datos de radiación solar
    datosRadiacion = calculadora.Get_Radiacion();

    % Extraer los datos de radiación, temperatura y meses para la gráfica
    radiaciones = [datosRadiacion.radiacion];
    temperaturas = [datosRadiacion.temperatura];
    meses = {datosRadiacion.mes};

    % Configurar el eje izquierdo para la radiación solar
    yyaxis(app.G_RadTemp_Tendencias_1, 'left');
    plot(app.G_RadTemp_Tendencias_1, 1:length(meses), radiaciones, '-o', 'LineWidth', 1.5);
    ylabel(app.G_RadTemp_Tendencias_1, 'Radiación Solar (kWh/m^2)');
    
    % Ampliar los márgenes superior e inferior del eje Y
    margen_superior = max(radiaciones) * 0.1;
    margen_inferior = min(radiaciones) * 0.1;
    ylim(app.G_RadTemp_Tendencias_1, [min(radiaciones) - margen_inferior, max(radiaciones) + margen_superior]);

    % Configurar el eje derecho para la temperatura
    yyaxis(app.G_RadTemp_Tendencias_1, 'right');
    plot(app.G_RadTemp_Tendencias_1, 1:length(meses), temperaturas, '-x', 'LineWidth', 1.5);
    ylabel(app.G_RadTemp_Tendencias_1, 'Temperatura (°C)');
    
    % Ampliar los márgenes superior e inferior del eje Y para la temperatura
    margen_superior_temp = max(temperaturas) * 0.1;
    margen_inferior_temp = min(temperaturas) * 0.1;
    ylim(app.G_RadTemp_Tendencias_1, [min(temperaturas) - margen_inferior_temp, max(temperaturas) + margen_superior_temp]);

    % Configurar los ejes x y y
    set(app.G_RadTemp_Tendencias_1, 'XTick', 1:length(meses), 'XTickLabel', meses);

    % Ajustar los límites del eje x para dar más espacio
    xlim(app.G_RadTemp_Tendencias_1, [0.5 length(meses) + 0.5]);

    % Configurar las etiquetas y el título
    title(app.G_RadTemp_Tendencias_1, 'Relación entre Radiación Solar y Temperatura a lo largo de los Meses');
    xlabel(app.G_RadTemp_Tendencias_1, 'Meses');
    grid(app.G_RadTemp_Tendencias_1, 'on');

    % Añadir una leyenda
    legend(app.G_RadTemp_Tendencias_1, {'Radiación Solar', 'Temperatura'});
end

%Retorna los datos para la gráfica