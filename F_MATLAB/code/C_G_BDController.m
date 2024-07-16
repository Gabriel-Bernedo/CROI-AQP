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
    function x= save_Electrodomestico(obj,register)

      sqlquery = sprintf("INSERT INTO electrodomesticos (nombre, consumo, horas, dias, tipo) VALUES ('%s', %d, %d, %d, '%s')", nombre, consumo, horas, dias, tipo);

      exec(conn, sqlquery);
      %METHOD1 Summary of this method goes here
      %   Detailed explanation goes here
    end
    function x = read_Electrodomestico(obj)
      x = C_Electrodomestico.empty;
      sqlquery = sprintf("SELECT * from electrodomesticos");

      res = sqlread(conn, "electrodomesticos");
      for i = 1:length(res)
        x(i) = C_Electrodomestico(res(i).nombre, res(i).consumo, res(i).horas, res(i).dias, res(i).tipo);
      end
      %METHOD1 Summary of this method goes here
      %   Detailed explanation goes here
    end
  end
end