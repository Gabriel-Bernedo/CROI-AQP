function costos = M2_MostrarCostos(tipo)
% M2_MostrarCostos Summary of this function goes here
    % Detailed explanation goes here
    
    switch tipo
        case 'costos'
            costos = mostrarCostos();
        case 'costosInstalacion'
            costos = mostrarCostosInstalacion();
        case 'compra'
            costos = mostrarCompra();
        case 'mantenimiento'
            costos = mostrarMantenimiento();
        otherwise
            error('Tipo no válido.');
    end
end

% Funciones locales
function costos = mostrarCostos()
    costos = 1000;
end

function costos = mostrarCostosInstalacion()
    costos = 500;
end

function costos = mostrarCompra()
    costos = 300;
end

function costos = mostrarMantenimiento()
    costos = 200;
end
