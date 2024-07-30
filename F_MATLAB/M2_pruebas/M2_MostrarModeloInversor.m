%{
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
%}

function M2_MostrarModeloInversor(app)
    mostrar = obtenerDatosInversor();

    %Datos para calcular costos
    global costoInversor;
    costoInversor = mostrar.costo;

    global costoInversorMantenimiento;
    costoInversorMantenimiento = mostrar.costoMan;

    %   Detailed explanation goes here
    %MOSTRAR SISTEMA YYYY
    app.Fi_Modelo_Inversor.Value = string(mostrar.modelo);
    app.Fi_Potencia_Inversor.Value = mostrar.potencia;
    app.Fi_VAdmisible_Inversor.Value = mostrar.voladmisible;
    app.Fi_Costo_Inversor.Value = mostrar.costo;
    app.Fi_Tiempo_Vida_Inversor.Value = mostrar.tvida;

    %SOLUCION SISTEMA YYYY
    app.MODELOEditField_3.Value = string(mostrar.modelo);

    %MOSTRAR HIBRIDO
    app.Fi_Modelo_Inversor_2.Value = string(mostrar.modelo);
    app.Fi_Potencia_Inversor_2.Value = mostrar.potencia;
    app.Fi_VAdmisible_Inversor_2.Value = mostrar.voladmisible;
    app.Fi_Costo_Inversor_2.Value = mostrar.costo;
    app.Fi_Tiempo_Vida_Inversor_2.Value = mostrar.tvida;
    %SOLUCION HIBRIDO
    app.MODELOEditField_6.Value = string(mostrar.modelo);

end

function datos = obtenerDatosInversor()
    
    %conexion BD
    conn = conectarBD();

    % Leer los datos de la tabla 'inversor'
    ambiente = sqlread(conn, 'inversor');

    % Seleccionar la primera fila de datos
    sel = ambiente(1, :);
    
    datos.modelo = sel.InvMod;
    datos.potencia = sel.InvPot;
    datos.voladmisible = sel.InvAdmVol;
    datos.costo = sel.InvCosMon;
    datos.tvida = sel.InvTieVid;
    datos.costoMan = sel.InvCosMan;

    close(conn);
end