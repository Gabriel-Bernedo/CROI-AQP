function Registros_Electrodomesticos(app)
     query = ['SELECT electrodomesticos.EleNom AS Electrodomestico, ', ... 
              'electrodomesticos_usuario.EleUsuPot, ', ...        
              'electrodomesticos_usuario.EleUsuFreDia, ', ...
              'electrodomesticos_usuario.EleUsuFreNoc, ', ...
              'electrodomesticos_usuario.EleUsuFreSem, ', ...
              'tipo.TipNom AS Tipo ', ...
              'FROM electrodomesticos_usuario ', ...
              'JOIN Tipo ON electrodomesticos_usuario.TipCod = tipo.TipCod ', ...
              'JOIN Electrodomesticos ON electrodomesticos_usuario.EleUsuEleCod = electrodomesticos.EleCod'];
    initialData =  fetch(conectarBD(), query)
    % Asignar los datos iniciales a la tabla
    app.T_Electrodomesticos_Gestionar_1.Data = initialData;
end