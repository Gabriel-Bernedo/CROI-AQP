function conn = conectarBD()
    %nombre de tu conexion
    dbname = 'mydb';
    %Usuario de tu conexion
    username = 'root';
    %password de tu conexion
    password = 'admin123';
    driver = 'com.mysql.cj.jdbc.Driver';
    url = 'jdbc:mysql://localhost:3306';
    conn = database(dbname, username, password);
    if ~isopen(conn)
        error('No se pudo conectar a la base de datos: %s', conn.Message);
    end
end

