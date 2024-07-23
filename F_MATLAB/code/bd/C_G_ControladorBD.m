%{

% bd = C_G_ControladorBD();           // Crear instancia BD

% bd.close() // Cerrar conexión a BD

% bd.Search(tabla, id, campo, valor)  // Buscar en BD
  % tabla: nombre de la tabla
  % id: columna de la tabla
  % campo: columna a filtrar
  % valor: valor a filtrar
// Devuelve un array de elementos de la busqueda

%}
classdef C_G_ControladorBD
  properties
    conn = null;
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
  end
end