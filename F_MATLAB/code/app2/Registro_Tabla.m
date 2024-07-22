function Registro = Registro_Tabla(tabla)
    conn = conectarBD();
    Registro = sqlread(conn, tabla);
end