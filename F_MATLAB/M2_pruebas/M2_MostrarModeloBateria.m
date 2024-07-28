%{
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
%}
function M2_MostrarModeloBateria(app)
    mostrar = obtenerDatosBateria();

    %   Detailed explanation goes here
    app.Fi_Modelo_Bateria.Value = string(mostrar.modelo);
    app.Fi_Capacidad_Bateria.Value = mostrar.capacidad;
    app.Fi_Largo_Bateria.Value = mostrar.largo;
    app.Fi_Ancho_Bateria.Value = mostrar.ancho;
    app.Fi_Alto_Bateria.Value = mostrar.alto;
    app.Fi_Costo_Bateria.Value = mostrar.costo;
    app.Fi_Tiempo_Vida_Bateria.Value = mostrar.tvida;

    %parte SOLUCION
    app.MODELOEditField_2.Value = string(mostrar.modelo);
end

function datos = obtenerDatosBateria()
    
    %conexion BD
    conn = conectarBD();

    % Leer los datos de la tabla 'panelsolar'
    ambiente = sqlread(conn, 'bateria');

    % Seleccionar la primera fila de datos
    sel = ambiente(1, :);
    
    datos.modelo = sel.BatMod;
    datos.capacidad = sel.BatCap;
    datos.largo = sel.BatLag;
    datos.ancho = sel.BatAnc;
    datos.alto = sel.BatAlt;
    datos.costo = sel.BatCosMon;
    datos.tvida = sel.BatTieVid;

    close(conn);


end