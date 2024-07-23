%{

% bd = C_G_ControladorBD();           // Crear instancia BD

% bd.close() // Cerrar conexión a BD

% bd.Search(tabla, id, campo, valor)  // Buscar en BD
  % tabla: nombre de la tabla
  % id: columna de la tabla
  % campo: columna a filtrar
  % valor: valor a filtrar
// Devuelve un array de elementos de la busqueda

% bd.Registro_Tabla(tabla)  // Registros de una tabla en BD
  % tabla: nombre de la tabla
// Devuelve un array de elementos de la tabla mencionada

% bd.Insertar_Registro(tabla, data)  // Registros de una tabla en BD
  % tabla: nombre de la tabla
  % data: tabola de registros
// Inserta un Registro, guardados en una tabla

%}
classdef C_G_ControladorBD
  properties
    conn = 0;
  end
  methods
    function obj = C_G_ControladorBD()
      obj.conn = conectarBD();
    end

    function close(obj)
      close(obj.conn);
    end
    
    function x = Search(obj, tabla, id, campo, valor)
      query = sprintf('SELECT %s FROM %s WHERE %s = ''%s''', id,tabla,campo,valor);
      x = fetch(obj.conn, query);
    end
    function y = Registro_Tabla(obj, tabla)
        y = sqlread(obj.conn, tabla);
    end
    function Insertar_Registro(obj, tabla, data)
        sqlwrite(obj.conn, tabla, data);
    end
  end
end