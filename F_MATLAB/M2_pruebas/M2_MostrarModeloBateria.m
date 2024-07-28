function mostrar = M2_MostrarModeloBateria(tipo)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    switch tipo
        case 'modelo'
            mostrar = mostrarModelo();
        case 'capacidad'
            mostrar = mostrarCapacidad();
        case 'largo'
            mostrar = mostrarLargo();
        case 'ancho'
            mostrar = mostrarAncho();
        case 'alto'
            mostrar = mostrarAlto();
        case 'costo'
            mostrar = mostrarCosto();
        case 'tvida'
            mostrar = mostrarTvida();
        otherwise
            error('Tipo no válido.');
    end

end

function mostrar = mostrarModelo()
    mostrar = 'Bateria ModeloXX';
end

function mostrar = mostrarCapacidad()
    mostrar = 100;
end

function mostrar = mostrarLargo()
    mostrar = 110;
end

function mostrar = mostrarAncho()
    mostrar = 120;
end

function mostrar = mostrarAlto()
    mostrar = 130;
end

function mostrar = mostrarCosto()
    mostrar = 140;
end

function mostrar = mostrarTvida()
    mostrar = 150;
end