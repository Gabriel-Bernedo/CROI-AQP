function conn = conectarBD()
    dbname = 'croi_aqp';
    username = 'root';
    password = 'admin123';
    driver = 'com.mysql.cj.jdbc.Driver';
    url = 'jdbc:mysql://localhost:3306/electrodomesticos_db';
    conn = database(dbname, username, password, driver, url);
    if ~isopen(conn)
        error('No se pudo conectar a la base de datos: %s', conn.Message);
    end
end
