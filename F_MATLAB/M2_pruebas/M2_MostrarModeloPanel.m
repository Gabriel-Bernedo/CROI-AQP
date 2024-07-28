function mostrar = M2_MostrarModeloPanel(tipo)
%M2_MOSTRARMODELO Summary of this function goes here
%   Detailed explanation goes here

    switch tipo
        case 'modelo'
            mostrar = mostrarModelo();
        case 'potencia'
            mostrar = mostrarPotencia();
        case 'voltaje'
            mostrar = mostrarVoltaje();
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
    mostrar = 'Panel ModeloXX';
end

function mostrar = mostrarPotencia()
    mostrar = 100;
end

function mostrar = mostrarVoltaje()
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