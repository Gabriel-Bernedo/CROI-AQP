function M2_MostrarModeloBateria(app)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    app.Fi_Modelo_Bateria.Value = mostrarModelo();
    app.Fi_Capacidad_Bateria.Value = mostrarCapacidad();
    app.Fi_Largo_Bateria.Value = mostrarLargo();
    app.Fi_Ancho_Bateria.Value = mostrarAncho();
    app.Fi_Alto_Bateria.Value = mostrarAlto();
    app.Fi_Costo_Bateria.Value = mostrarCosto();
    app.Fi_Tiempo_Vida_Bateria.Value = mostrarTvida();

    %parte SOLUCION
    app.MODELOEditField_2.Value = mostrarModelo();
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