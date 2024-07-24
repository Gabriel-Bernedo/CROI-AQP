<<<<<<< HEAD
function conn = conectarBD()
    %nombre de tu conexion
    dbname = 'ConectarBD';
    %Usuario de tu conexion
    username = 'root';
    %password de tu conexion
    password = '';
    driver = 'com.mysql.cj.jdbc.Driver';
    url = 'jdbc:mysql://localhost:3306';
    conn = database(dbname, username, password);
    if ~isopen(conn)
        error('No se pudo conectar a la base de datos: %s', conn.Message);
    end
end
=======
function conn = conectarBD()
    %nombre de tu conexion
    dbname = '';
    %Usuario de tu conexion
    username = '';
    %password de tu conexion
    password = '';
    driver = 'com.mysql.cj.jdbc.Driver';
    url = 'jdbc:mysql://localhost:3306';
    conn = database(dbname, username, password);
    if ~isopen(conn)
        error('No se pudo conectar a la base de datos: %s', conn.Message);
    end
end
>>>>>>> 546b5384c61aa1d6e7d720f08591a035d4984fc3
