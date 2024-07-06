classdef C_Usuario
  properties
    id
    nombre
    direccion
    electrodomesticos
  end
  methods
    function obj = C_Usuario(id, nombre, direccion)
      obj.id = id;
      obj.nombre = nombre;
      obj.direccion = direccion;
      obj.electrodomesticos = C_Electrodomestico.empty; % Inicializar como un arreglo vacío de objetos C_Electrodomestico
    end
    function obj = Add_Electrodomestico(obj, electrodomestico)
        name = electrodomestico.nombre;
        encontrado = false;
        %comprueba si existe un equipo con el mismo nombre
        for i = 1:length(obj.electrodomesticos)
            value = obj.electrodomesticos(i).nombre;
            if  strcmp(name, value)%comparar strinf a traves string compare,
                % hacerlo de forma "==" funciona de forma incorrecta
                encontrado = true;
                break;
            end
        end
        if encontrado%si lo encuenta lanza un error
            ME = MException('C_Usuaio:Invalid_Arg', 'No repita nombre de electrodomestico');
            throw(ME);
        else%de no encontrarlo lo agrega al final del arreglo
            obj.electrodomesticos(end + 1) = electrodomestico;
        end
    end
    function obj = Mod_Electrodomestico(obj, electrodomestico)
        name = electrodomestico.nombre;
        %modifica el electrodomestico en base al nombre
        for i = 1:length(obj.electrodomesticos)
            value = obj.electrodomesticos(i).nombre;
            if  strcmp(name, value)
                obj.electrodomesticos(i).potencia = electrodomestico.potencia;
                obj.electrodomesticos(i).horas_dia = electrodomestico.horas_dia;
                obj.electrodomesticos(i).dia_semana = electrodomestico.dia_semana;
                obj.electrodomesticos(i).tipo = electrodomestico.tipo;
                break;
            end
        end
    end
    function x = ConsumoTotal(obj, mes)%calcula el consumo total de n meses
        %donde n = parametro mes, de todos los electrodomesticos
      x = 0;
      for i = 1:length(obj.electrodomesticos)
        x = x + obj.electrodomesticos(i).ConsumoTotal(mes);
      end
    end
    function x = ConsumoTotalAnual(obj, anio)
        %calcula el consumo total de n años
        %donde n = parametro anio
      x = obj.ConsumoTotal(anio * 12);
    end
    function x = AhorrosAnuales(obj, costo_kWh)
      x = obj.ConsumoTotalAnual(1) * costo_kWh;
    end
    function x = CalcularROI(obj, costo_total, costo_kWh)
      x = costo_total / obj.AhorrosAnuales(costo_kWh);
    end
    function obj = pop(obj)%eliminar ultimo elemento
        %no completo
        if ~isempty(obj.electrodomesticos)
            obj.electrodomesticos(end) = [];
        else
            warning('No hay electrodomésticos para eliminar.');
        end
    end
  end
end
