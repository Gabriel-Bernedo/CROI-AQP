function conn = conectarBD()
    %nombre de tu conexion
    dbname = 'conexion';
    %Usuario de tu conexion
    username = 'root';
    %password de tu conexion
    password = 'root123';
    driver = 'com.mysql.cj.jdbc.Driver';
    url = 'jdbc:mysql://localhost:3306/mydb';
    conn = database(dbname, username, password);
    if ~isopen(conn)
        error('No se pudo conectar a la base de datos: %s', conn.Message);
    end
end

