function M2_MostrarModeloBateria(app)
    mostrar = obtenerDatosBateria();

    %   Detailed explanation goes here
    app.Fi_Modelo_Bateria.Value = string(mostrar.modelo);
    app.Fi_Capacidad_Bateria.Value = mostrar.capacidad;
    app.Fi_Largo_Bateria.Value = mostrar.largo;
    app.Fi_Ancho_Bateria.Value = mostrar.ancho;
    app.Fi_Alto_Bateria.Value = mostrar.alto;
    app.Fi_Costo_Bateria.Value = mostrar.costo;
    app.Fi_Voltaje_Bateria.Value = mostrar.vol;
    %{
    El field(campo) solo permite valor numerico, actualmente se cambio a
    TIPO, por lo que seria modificar a un field de textos, por ahora
    comentado, se cambio tiempo de vida a VOLTAJE
    %}

    %parte SOLUCION
    app.MODELOEditField_2.Value = string(mostrar.modelo);
    app.NumBateria.Value = 2; %numerito cualquiera :v


    %Datos para calcular costos
    global costoBateria;
    costoBateria = mostrar.costo;

    global NumeroBateriaYYYY;
    NumeroBateriaYYYY = app.NumBateria.Value;

end

function datos = obtenerDatosBateria()
    
    %conexion BD
    conn = conectarBD();

    % Leer los datos de la tabla 'bateria'
    ambiente = sqlread(conn, 'bateria');

    % Seleccionar la primera fila de datos
    sel = ambiente(1, :);
    
    datos.modelo = sel.BatMod;
    datos.capacidad = sel.BatCap;
    datos.largo = sel.BatLag;
    datos.ancho = sel.BatAnc;
    datos.alto = sel.BatAlt;
    datos.costo = sel.BatCosMon;
    %datos.tvida = sel.BatTieVid;
    %datos.costoMan = sel.BatCosMan;
    %{
    costo de Mantenimiento ya no existe, ahora se agrega BatVol - varaible
    global ya eliminada y no se utilizara para sumar en costos 
    %}
    datos.vol = sel.BatVol;
    
    
    close(conn);


end