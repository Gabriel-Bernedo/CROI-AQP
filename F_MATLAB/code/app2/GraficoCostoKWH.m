%Gráfico costo KWH por mes desde 2014

function GraficoCostoKWH(app)
    % Datos proporcionados
    data = [
    2014, 1, 0.4072;
    2014, 2, 0.4318;
    2014, 3, 0.4318;
    2014, 4, 0.4424;
    2014, 5, 0.4564;
    2014, 6, 0.4564;
    2014, 7, 0.4572;
    2014, 8, 0.4356;
    2014, 9, 0.4376;
    2014, 10, 0.4482;
    2014, 11, 0.4447;
    2014, 12, 0.4447;
    2015, 1, 0.4587;
    2015, 2, 0.4703;
    2015, 3, 0.4703;
    2015, 4, 0.4703;
    2015, 5, 0.4955;
    2015, 6, 0.4955;
    2015, 7, 0.511;
    2015, 8, 0.5141;
    2015, 9, 0.5185;
    2015, 10, 0.5185;
    2015, 11, 0.5204;
    2015, 12, 0.5223;
    2016, 1, 0.5396;
    2016, 2, 0.5394;
    2016, 3, 0.5404;
    2016, 4, 0.5217;
    2016, 5, 0.5174;
    2016, 6, 0.521;
    2016, 7, 0.521;
    2016, 8, 0.5281;
    2016, 9, 0.5293;
    2016, 10, 0.5334;
    2016, 11, 0.5525;
    2016, 12, 0.5525;
    2017, 1, 0.5379;
    2017, 2, 0.5362;
    2017, 3, 0.5362;
    2017, 4, 0.5362;
    2017, 5, 0.5122;
    2017, 6, 0.5131;
    2017, 7, 0.5263;
    2017, 8, 0.5263;
    2017, 9, 0.5264;
    2017, 10, 0.5264;
    2017, 11, 0.5457;
    2017, 12, 0.5538;
    2018, 1, 0.5538;
    2018, 2, 0.5732;
    2018, 3, 0.5756;
    2018, 4, 0.5757;
    2018, 5, 0.5537;
    2018, 6, 0.5537;
    2018, 7, 0.5567;
    2018, 8, 0.5563;
    2018, 9, 0.5563;
    2018, 10, 0.5564;
    2018, 11, 0.5656;
    2018, 12, 0.5656;
    2019, 1, 0.5665;
    2019, 2, 0.5784;
    2019, 3, 0.5767;
    2019, 4, 0.5765;
    2019, 5, 0.5781;
    2019, 6, 0.5781;
    2019, 7, 0.5761;
    2019, 8, 0.5658;
    2019, 9, 0.5664;
    2019, 10, 0.5815;
    2019, 11, 0.6077;
    2019, 12, 0.6177;
    2020, 1, 0.6178;
    2020, 2, 0.6114;
    2020, 3, 0.6114;
    2020, 4, 0.6114;
    2020, 5, 0.6114;
    2020, 6, 0.6188;
    2020, 7, 0.6342;
    2020, 8, 0.6407;
    2020, 9, 0.6407;
    2020, 10, 0.643;
    2020, 11, 0.644;
    2020, 12, 0.6604;
    2021, 1, 0.6609;
    2021, 2, 0.6598;
    2021, 3, 0.6598;
    2021, 4, 0.6711;
    2021, 5, 0.6542;
    2021, 6, 0.6579;
    2021, 7, 0.6646;
    2021, 8, 0.6864;
    2021, 9, 0.695;
    2021, 10, 0.7285;
    2021, 11, 0.7236;
    2021, 12, 0.7263;
    2022, 1, 0.7263;
    2022, 2, 0.7305;
    2022, 3, 0.7305;
    2022, 4, 0.7336;
    2022, 5, 0.7394;
    2022, 6, 0.7411;
    2022, 7, 0.7435;
    2022, 8, 0.77;
    2022, 9, 0.77;
    2022, 10, 0.7735;
    2022, 11, 0.8136;
    2022, 12, 0.8117;
    2023, 1, 0.8112;
    2023, 2, 0.7711;
    2023, 3, 0.7711;
    2023, 4, 0.7639;
    2023, 5, 0.7506;
    2023, 6, 0.7471;
    2023, 7, 0.7471;
    2023, 8, 0.7086;
    2023, 9, 0.7117;
    2023, 10, 0.7135;
    2023, 11, 0.7428;
    2023, 12, 0.7403;
    2024, 1, 0.7403;
    2024, 2, 0.7316;
    2024, 3, 0.7316;
    2024, 4, 0.7316;
    2024, 5, 0.7327;
    2024, 6, 0.7314;
    2024, 7, 0.7314
    ];

    % Extraer años y costos
    years = unique(data(:, 1));
    avg_cost_per_year = zeros(length(years), 1);

    % Calcular promedio por año
    for i = 1:length(years)
        year = years(i);
        avg_cost_per_year(i) = mean(data(data(:, 1) == year, 3));
    end

    % Mostrar resultados
    disp('Promedio del costo por hora por año:');
    for i = 1:length(years)
        fprintf('Año %d: %.4f\n', years(i), avg_cost_per_year(i));
    end

    % Graficar en el UIAxes de App Designer
    ax = app.G_CostoMeses_Tendencias_1;
    
    % Limpiar el UIAxes antes de graficar
    cla(ax);
    
    % Graficar el costo promedio por año
    plot(ax, years, avg_cost_per_year, '-o', 'LineWidth', 2);
    xlabel(ax, 'Año');
    ylabel(ax, 'Costo Promedio KWH');
    title(ax, 'Promedio del Costo por Hora de Energía Eléctrica (BT5B-Residencial)');
    grid(ax, 'on');
    
    % Ajustar el tamaño de la fuente para mejorar la visibilidad
    ax.XAxis.FontSize = 10;
    ax.YAxis.FontSize = 10;
    ax.Title.FontSize = 12;
    ax.XLabel.FontSize = 10;
    ax.YLabel.FontSize = 10;
    
    % Ajustar los límites del eje X e Y para mejorar la visualización
    xlim(ax, [min(years) max(years)]);
    ylim(ax, [min(avg_cost_per_year) max(avg_cost_per_year) * 1.1]); % Aumentar el margen en el eje Y, 10% más alto que el valor máximo
end

%Retorna los datos para la gráfica
