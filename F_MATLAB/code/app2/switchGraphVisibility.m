function switchGraphVisibility(app, ax1, ax2, value)
    % switchGraphVisibility Cambia la visibilidad de dos ejes gráficos y limpia su contenido
    %
    % app  - El objeto de la aplicación
    % ax1  - Primer eje UIAxes
    % ax2  - Segundo eje UIAxes
    % value - Valor que determina la visibilidad de los ejes (1 o 0)
    
    % Limpiar el contenido gráfico de ambos UIAxes
    function clearAxes(ax)
        % Eliminar líneas
        delete(findall(ax, 'Type', 'line'));
        % Eliminar texto, como etiquetas y leyendas
        delete(findall(ax, 'Type', 'text'));
        % Eliminar leyendas
        legend(ax, 'off');
    end
    
    % Limpiar los ejes antes de cambiar la visibilidad
    clearAxes(ax1);
    clearAxes(ax2);
    
    % Cambiar visibilidad de los ejes según el valor del switch
    if value == 1
        % Ejecutar la función de promedio de producción
        disp('Ejecutando GraficarPromedioProduc');
        GraficarPromedioProduc(app);
        
        % Ajustar visibilidad
        ax1.Visible = 'off';
        ax2.Visible = 'on';
    else
        % Ejecutar la función de radiación y temperatura
        disp('Ejecutando plotRadiacionTemperatura');
        plotRadiacionTemperatura(app);
        
        % Ajustar visibilidad
        ax2.Visible = 'off';
        ax1.Visible = 'on';
    end
    
    % Asegurarse de que los ejes se ajusten correctamente
    drawnow; % Forzar el redibujado de los ejes
end
