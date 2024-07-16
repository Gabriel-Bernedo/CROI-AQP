classdef C_G_BDController
  properties (Access = private)
    connection;
  end
  methods
    function obj = C_G_BDController()
      dbname = 'croi_aqp';
      username = 'root';
      password = 'Gabokiller0711';
      % driver = 'com.mysql.cj.jdbc.Driver';
      % url = 'jdbc:mysql://localhost:3306';
      conn = database(dbname, username, password);
      if ~isopen(conn)
        error('No se pudo conectar a la base de datos: %s', conn.Message);
      end
      obj.connection = conn;
    end
    function [outputArg1,outputArg2] = save_Electrodomestico(obj,register)

      sqlquery = sprintf("INSERT INTO electrodomesticos (nombre, consumo, horas, dias, tipo) VALUES ('%s', %d, %d, %d, '%s')", nombre, consumo, horas, dias, tipo);

      exec(conn, sqlquery);
      %METHOD1 Summary of this method goes here
      %   Detailed explanation goes here
      outputArg1 = inputArg1;
      outputArg2 = inputArg2;
    end
  end
end