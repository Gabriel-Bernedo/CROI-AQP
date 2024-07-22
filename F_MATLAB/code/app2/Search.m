function idx = Search(tabla,id,campo,valor)
    query = sprintf('SELECT %s FROM %s WHERE %s = ''%s''', id,tabla,campo,valor);
    idx = fetch(conectarBD(), query);
end