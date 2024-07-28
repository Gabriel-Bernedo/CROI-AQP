conn = database('croi_aqp', 'User', '@admin123');
curs = exec(conn, 'SELECT * FROM prueba');
curs = fetch(curs);
curs.Data