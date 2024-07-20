%{

% C_G_BDController

# CONSTRUCTORES

% !!! bd = C_G_BDController();                      // Controlador generico
% bd = C_G_BDController(dbname, username, password) // Controlador apropiado
  % dbname : nombre de la BD
  % username : nombre de usuario de BD
  % password : contraseña de usuario de BD
// Base de datos en loclahost:3306

# METODOS DE INSTANCIA

% bd.save_Electrodomestico(register)                // Guardar un electrodomestico
  % register : instancia de Electrodomestico

% bd.read_Electrodomestico()                        // Leer todos los electrodomesticos
% bd.read_Paneles()                                 // Leer todos los paneles
% bd.read_Baterias()                                // Leer todas las baterias
% bd.read_Inversor()                                // Leer todos los inversores
%}
classdef C_G_BDController
  properties (Access = private)
    connection;
  end
  methods
    function obj = C_G_BDController(dbname, username, password)
      % dbname = 'croi_aqp';
      % username = 'root';
      % password = 'Gabokiller0711';
      % driver = 'com.mysql.cj.jdbc.Driver';
      % url = 'jdbc:mysql://localhost:3306';
      conn = database(dbname, username, password);
      if ~isopen(conn)
        error('No se pudo conectar a la base de datos: %s', conn.Message);
      end
      obj.connection = conn;
    end
    function x = save_Electrodomestico(obj,register)

      sqlquery = sprintf("INSERT INTO electrodomesticos (nombre, consumo, horas, dias, tipo) VALUES ('%s', %d, %d, %d, '%s')", nombre, consumo, horas, dias, tipo);

      exec(conn, sqlquery);
      %METHOD1 Summary of this method goes here
      %   Detailed explanation goes here
    end
    function x = read_Electrodomestico(obj)
      res = sqlread(obj.connection, "electrodomesticos");
      % sqlquery = sprintf("SELECT * from electrodomesticos");

      
      x = C_Electrodomestico.empty(height(res), 0);

      % Crea un objeto C_Electrodomestico por cada registro
      for i = 1:height(res)
        x(i) = C_Electrodomestico(res{i,2}, res{i,3}, res{i,4}, res{i,5}, res{i,6});
      end
      %METHOD1 Summary of this method goes here
      %   Detailed explanation goes here
    end
    function x = read_Paneles(obj)
      res = sqlread(obj.connection, "panelsolar");
      % sqlquery = sprintf("SELECT * from electrodomesticos");

      
      x = C_Paneles.empty(height(res), 0);

      % Crea un objeto C_Electrodomestico por cada registro
      for i = 1:height(res)
        x(i) = C_Paneles(res{i,2}, res{i,3}, res{i,4}, res{i,5}, res{i,6}, res{i,7});
      end
      %METHOD1 Summary of this method goes here
      %   Detailed explanation goes here
    end
    function x = read_Baterias(obj)
      res = sqlread(obj.connection, "bateria");
      % sqlquery = sprintf("SELECT * from electrodomesticos");

      
      x = C_Bateria.empty(height(res), 0);

      % Crea un objeto C_Electrodomestico por cada registro
      for i = 1:height(res)
        x(i) = C_Bateria(res{i,2}, res{i,3}, res{i,4},res{i,5}, res{i,7}, res{i,8}, res{i,6}, res{i,9});
        fprintf ("XD \n");
      end
      %METHOD1 Summary of this method goes here
      %   Detailed explanation goes here
    end
    function x = read_Inversor(obj)
      res = sqlread(obj.connection, "inversor");
      % sqlquery = sprintf("SELECT * from electrodomesticos");

      
      x = C_Electrodomestico.empty(height(res), 0);

      % Crea un objeto C_Electrodomestico por cada registro
      for i = 1:height(res)
        x(i) = C_Electrodomestico(res{i,2}, res{i,3}, res{i,4},res{i,5}, res{i,7}, res{i,8}, res{i,6}, res{i,9});
      end
      %METHOD1 Summary of this method goes here
      %   Detailed explanation goes here
    end
  end
end