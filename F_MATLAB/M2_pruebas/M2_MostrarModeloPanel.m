%{
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
%}
%posicion de paneles en app: 246,85,381,273

function M2_MostrarModeloPanel(app)
    %conectando BD para tabla 'panelsolar'
    mostrar = obtenerDatosPanel();
    
    

    %asignar valores
    %MOSTRAR SISTEMA YYYY
    app.Fi_Modelo_Panel.Value = string(mostrar.modelo);
    app.Fi_Potencia_Panel.Value = mostrar.potencia;
    app.Fi_Voltaje_Panel.Value = mostrar.voltaje;
    app.Fi_Ancho_Panel.Value = mostrar.ancho;
    app.Fi_Alto_Panel.Value = mostrar.alto;
    app.Fi_Costo_Panel.Value = mostrar.costo;
    app.Fi_Tiempo_Vida_Panel.Value = mostrar.tvida;
    
    %SOLUCION SISTEMA YYYY
    app.MODELOEditField.Value = string(mostrar.modelo);
    app.NumPanel.Value = 2; %numerito cualquiera :v
    
    %MOSTRAR HIBRIDO
    app.Fi_Modelo_Panel_2.Value = string(mostrar.modelo);
    app.Fi_Potencia_Panel_2.Value = mostrar.potencia;
    app.Fi_Voltaje_Panel_2.Value = mostrar.voltaje;
    app.Fi_Ancho_Panel_2.Value = mostrar.ancho;
    app.Fi_Alto_Panel_2.Value = mostrar.alto;
    app.Fi_Costo_Panel_2.Value = mostrar.costo;
    app.Fi_Tiempo_Vida_Panel_2.Value = mostrar.tvida;

    %SOLUCION HIBRIDO
    app.MODELOEditField_4.Value = string(mostrar.modelo);
    app.NumPanelH.Value = 2; %numerito cualquiera x2 :v

    %Datos para calcular costos
    global costoPanel;
    costoPanel = mostrar.costo;

    global costoPanelMantenimiento;
    costoPanelMantenimiento = mostrar.costoMan;
    
    global NumeroPanelYYYY;
    NumeroPanelYYYY = app.NumPanel.Value;

    global NumeroPanelH;
    NumeroPanelH = app.NumPanelH.Value;
    
end

function datos = obtenerDatosPanel()
    
    %conexion BD
    conn = conectarBD();

    % Leer los datos de la tabla 'panelsolar'
    ambiente = sqlread(conn, 'panelsolar');

    % Seleccionar la primera fila de datos
    sel = ambiente(1, :);
    
    datos.modelo = sel.PanMod;
    datos.potencia = sel.PanPot;
    datos.voltaje = 24;
    datos.ancho = sel.PanAnc;
    datos.alto = sel.PanAlt;
    datos.costo = sel.PanCosMon;
    datos.tvida = sel.PanTieVid;
    datos.costoMan = sel.PanCosMan;

    close(conn);


end

%{
function conn = conectarBD()
   %nombre de tu conexion
    dbname = 'mydb';
    %Usuario de tu conexion
    username = 'root';
    %password de tu conexion
    password = '';
    driver = 'com.mysql.cj.jdbc.Driver';
    url = 'jdbc:mysql://localhost:3306/mydb';
    conn = database(dbname, username, password,driver, url);
    if ~isopen(conn)
        error('No se pudo conectar a la base de datos: %s', conn.Message);
    end
end
%}