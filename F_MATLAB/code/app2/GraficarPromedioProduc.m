function GraficarPromedioProduc(app)
    % GraficarPromedioProduc Grafica el promedio de irradiación a lo largo de las horas del día.
    % Esta función toma los datos de irradiación promedio y los grafica en el componente UIAxes
    % de App Designer especificado, con una descripción en el TextArea correspondiente.

    % Datos de horas del día (eje x)
    horasDelDia = 6:18;

    % Datos de promedio de irradiación (eje y)
    promedioIrradiacion = [
        0.05379559946, 0.1434359121, 0.3185074673, 0.5890225331, ...
        0.907182723, 1.163612032, 1.243003087, 1.105825963, ...
        0.8193169293, 0.5055541107, 0.2597968821, 0.1111861761, ...
        0.03962946646
    ];

    % Limpiar el contenido gráfico del eje antes de graficar
    function clearAxes(ax)
        delete(findall(ax, 'Type', 'line')); % Eliminar líneas
        delete(findall(ax, 'Type', 'text')); % Eliminar texto, como etiquetas y leyendas
    end

    % Limpiar el eje antes de graficar
    clearAxes(app.G_RadTemp_Tendencias_2);

    % Graficar los datos
    plot(app.G_RadTemp_Tendencias_2, horasDelDia, promedioIrradiacion, '-o', 'LineWidth', 1.5);
    
    % Configurar las etiquetas y el título
    xlabel(app.G_RadTemp_Tendencias_2, 'Horas del Día');
    ylabel(app.G_RadTemp_Tendencias_2, 'Promedio de Irradiación (kWh/m^2)');
    title(app.G_RadTemp_Tendencias_2, 'Promedio de Irradiación Solar a lo largo del Día');
    
    % Ajustar los límites del eje x e y
    xlim(app.G_RadTemp_Tendencias_2, [min(horasDelDia)-0.5, max(horasDelDia)+0.5]);
    ylim(app.G_RadTemp_Tendencias_2, [0, max(promedioIrradiacion)*1.1]);
    
    % Añadir una rejilla
    grid(app.G_RadTemp_Tendencias_2, 'on');
    
    % Añadir una leyenda
    legend(app.G_RadTemp_Tendencias_2, {'Promedio de Irradiación'});
    
    % Agregar descripción en el TextArea
    app.TA_DescripcionAnalisisRadTemp_Tendencias_1.Value = 'El pico de raciadion se da a las 12 del día.';
end
