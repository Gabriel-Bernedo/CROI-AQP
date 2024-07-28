function mostrar = M2_MostrarModeloInversor(tipo)
%M2_MOSTRARMODELOINVERSOR Summary of this function goes here
%   Detailed explanation goes here
    switch tipo
        case 'modelo'
            mostrar = mostrarModelo();
        case 'potencia'
            mostrar = mostrarPotencia();
        case 'vadmisible'
            mostrar = mostrarVadmisible();
        case 'costo'
            mostrar = mostrarCosto();
        case 'tvida'
            mostrar = mostrarTvida();
        otherwise
            error('Tipo no válido.');
    end

end

function mostrar = mostrarModelo()
    mostrar = 'Inversor ModeloXX';
end

function mostrar = mostrarPotencia()
    mostrar = 100;
end

function mostrar = mostrarVadmisible()
    mostrar = 110;
end

function mostrar = mostrarCosto()
    mostrar = 140;
end

function mostrar = mostrarTvida()
    mostrar = 150;
end