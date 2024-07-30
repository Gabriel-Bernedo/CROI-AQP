%{
function M2_MostrarCostos(app)
% M2_MostrarCostos Summary of this function goes here
    % Detailed explanation goes here
    %parte SOLUCION
    app.Fi_Costo_Instalacion_Solucion.Value = mostrarCostoInstalacion();
    app.Fi_Costo_Compra_Solucion.Value = mostrarCostoCompra();
    app.Fi_Costo_Mantenimiento_Solucion.Value = mostrarCostoMantenimiento();
    app.Fi_Costo_Total_Solucion.Value = mostrarCostoTotal();
end

% Funciones locales
function costos = mostrarCostoInstalacion()
    costos = 100000;
end

function costos = mostrarCostoCompra()
    costos = 500;
end

function costos = mostrarCostoMantenimiento()
    costos = 300;
end

function costos = mostrarCostoTotal()
    costos = 200;
end
%}

function M2_MostrarCostos(app)
    
    %llamando a las funciones para obtener datos 
    %intentar modificar cambiando las varaibles globales, usar funciones
    %que obtengan los datos directamente y usarlo 
    %{
    'function [costoPanel,costoPanelMantenimiento] = obtenerCostosDesdeApp(app)'
    costoPanel = app.Fi_Costo_Panel.Value;
    costoPanelMantenimiento = app.Fi_Costo_Panel.Value;   #no existe un field
    para mantenimiento
    %}
    %function M2_MostrarCostos(app)

    global costoPanel costoPanelMantenimiento costoBateria  costoInversor costoInversorH costoInversorMantenimiento NumeroBateriaYYYY NumeroInversorYYYY NumeroInversorH NumeroPanelYYYY NumeroPanelH;
    M2_MostrarModeloPanel(app);
    M2_MostrarModeloBateria(app);
    M2_MostrarModeloInversor(app);
    
    
    %parte SOLUCION
    app.Fi_Costo_Instalacion_Solucion.Value = 0;
    app.Fi_Costo_Compra_Solucion.Value = (costoPanel * NumeroPanelYYYY) + (costoBateria * NumeroBateriaYYYY) + (costoInversor * NumeroInversorYYYY) + 0;
    app.Fi_Costo_Mantenimiento_Solucion.Value = (costoPanelMantenimiento * NumeroPanelYYYY) + (costoInversorMantenimiento * NumeroInversorYYYY)+0;
    app.Fi_Costo_Total_Solucion.Value = app.Fi_Costo_Instalacion_Solucion.Value + app.Fi_Costo_Compra_Solucion.Value + app.Fi_Costo_Mantenimiento_Solucion.Value+0;
    
    %parte SOLUCION HIBRIDA
    app.Fi_Costo_Instalacion_Solucion_2.Value = 0;
    app.Fi_Costo_Compra_Solucion_2.Value = (costoPanel * NumeroPanelH) + (costoInversorH * NumeroInversorH) + 0;
    app.Fi_Costo_Mantenimiento_Solucion_2.Value = (costoPanelMantenimiento * NumeroPanelH)  + (costoInversorMantenimiento * NumeroInversorH) + 0;
    app.Fi_Costo_Total_Solucion_2.Value = app.Fi_Costo_Instalacion_Solucion_2.Value + app.Fi_Costo_Compra_Solucion_2.Value + app.Fi_Costo_Mantenimiento_Solucion_2.Value + 0;
    
    disp(['costoPanel: ', num2str(costoPanel)]);
    disp(['costoPanelMantenimiento: ', num2str(costoPanelMantenimiento)]);
    disp(['costoBateria: ', num2str(costoBateria)]);
    disp(['costoInversor: ', num2str(costoInversor)]);
    disp(['costoInversorMantenimiento: ', num2str(costoInversorMantenimiento)]);

end



