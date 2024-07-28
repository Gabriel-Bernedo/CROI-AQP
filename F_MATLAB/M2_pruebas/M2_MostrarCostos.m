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
