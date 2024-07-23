%{
  usuario = C_G_Usuario(id, nombre)
    id : id del usuario en la BD
    nombre : nombre del usuario
  
    // Ex: usuario = C_G_Usuario(1, 'Gabito')

  usuario.Add_Electrodomestico(electrodomestico)
    electrodomestico : instancia de C_Electrodomestico

  usuario.Mod_Electrodomestico(electrodomestico)
    electrodomestico : instancia de C_Electrodomestico existente
  
  usuario.Restore_Electrodomestico(bd) // Restaurar electrodomesticos desde la base de datos
    bd : instancia de C_G_BD
  // !No implmeemntado

  
%}

classdef C_G_Usuario
  properties 
    id
    nombre
    electrodomesticos
  end
  methods
    function obj = C_G_Usuario(id, nombre)
      obj.id = id;
      obj.nombre = nombre;
      obj.electrodomesticos = C_Electrodomestico.empty;
    end
    
    function obj = Add_Electrodomestico(obj, elec)
      codigo = elec.codigo;
      encontrado = false;
      for i = 1:length(obj.electrodomesticos)
        value = obj.electrodomesticos(i).codigo;
        if strcmp(codigo, value)
          encontrado = true;
          break;
        end
      end
      if encontrado
        ME = MException('C_Usuaio:Invalid_Arg', 'No repita nombre de electrodomestico');
        throw(ME);
      else
        obj.electrodomesticos(end + 1) = elec;
      end
    end
    
    function obj = Mod_Electrodomestico(obj, elec)
      codigo = elec.codigo;
      for i = 1:length(obj.electrodomesticos)
        value = obj.electrodomesticos(i).codigo;
        if strcmp(codigo, value)
          obj.electrodomesticos(i) = elec;
          break;
        end
      end
    end

    function obj = Restore_Electrodomestico(obj, bd)
      % no implementado
    end
  end
end