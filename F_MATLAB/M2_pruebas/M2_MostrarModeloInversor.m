function M2_MostrarModeloInversor(app)
%M2_MOSTRARMODELOINVERSOR Summary of this function goes here
%   Detailed explanation goes here
    app.Fi_Modelo_Inversor.Value = mostrarModelo();
    app.Fi_Potencia_Inversor.Value = mostrarPotencia();
    app.Fi_VAdmisible_Inversor.Value = mostrarVadmisible();
    app.Fi_Costo_Inversor.Value = mostrarCosto();
    app.Fi_Tiempo_Vida_Inversor.Value = mostrarTvida();

    %parte INVERSOR
    app.MODELOEditField_3.Value = mostrarModelo();
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