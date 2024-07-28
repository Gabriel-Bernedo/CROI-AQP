function conn = conectarBD()
    %nombre de tu conexion
    dbname = 'mydb';
    %Usuario de tu conexion
    username = 'root';
    %password de tu conexion
    password = '1234';
    driver = 'com.mysql.cj.jdbc.Driver';
    url = 'jdbc:mysql://localhost:3306/mydb';
    conn = database(dbname, username, password,driver, url);
    if ~isopen(conn)
        error('No se pudo conectar a la base de datos: %s', conn.Message);
    end
end

