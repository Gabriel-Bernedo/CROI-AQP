function M2_MostrarModeloPanel(app)
%M2_MOSTRARMODELO Summary of this function goes here
%   Detailed explanation goes here
    app.Fi_Modelo_Panel.Value = mostrarModelo();
    app.Fi_Potencia_Panel.Value = mostrarPotencia();
    app.Fi_Voltaje_Panel.Value = mostrarVoltaje();
    app.Fi_Ancho_Panel.Value = mostrarAncho();
    app.Fi_Alto_Panel.Value = mostrarAlto();
    app.Fi_Costo_Panel.Value = mostrarCosto();
    app.Fi_Tiempo_Vida_Panel.Value = mostrarTvida();
    
    %SOLUCION
    app.MODELOEditField.Value = mostrarModelo();
       
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