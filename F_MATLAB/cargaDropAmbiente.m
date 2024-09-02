% Conectar a la base de datos
            conn = database('ConectarBD','root','');
            
            % Leer datos de la tabla "ambiente"
            y = sqlread(conn, "ambiente");
            
            % Extraer la columna 2 como un cell array
            dataArray = y{:, 2}; % Si la columna es de tipo cell o string
            
            % Asegurarse de que el array es horizontal (no es necesario usar reshape aquí)
            dataArray = dataArray(:)'; % Transponer si es necesario para asegurar que es un array horizontal
            
            % Asignar el array horizontal al componente de la aplicación
            app.Lista_Electrodomesticos_1.Items = dataArray;
            
            % Cerrar la conexión
            close(conn);
function pepe()
a = 2;
a

end