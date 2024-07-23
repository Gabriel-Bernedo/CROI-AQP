function conn = conectarBD()
    dbname = 'ConectarBD';
    username = 'root';
<<<<<<< HEAD
    password = '';
=======
    password = 'Gabokiller0711';
>>>>>>> 2a7f3b2396628ba74924213d2d2f55085f4da62f
    driver = 'com.mysql.cj.jdbc.Driver';
    url = 'jdbc:mysql://localhost:3306';
    conn = database(dbname, username, password);
    if ~isopen(conn)
        error('No se pudo conectar a la base de datos: %s', conn.Message);
    end
end
