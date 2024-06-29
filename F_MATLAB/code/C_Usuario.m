classdef C_Usuario
  properties
    id
    nombre
    direccion
    electrodomesticos = C_Electrodomestico.empty;
  end
  methods
    function obj = C_Usuario(id, nombre, direccion)
      obj.id = id;
      obj.nombre = nombre;
      obj.direccion = direccion;
    end
    function x = Add_Electrodomestico(obj, electrodomestico)
      obj.electrodomesticos.append(electrodomestico);
      x = true;
    end
    function x = ConsumoTotal(obj, mes)
      x = 0;
      for i = 1:length(obj.electrodomesticos)
        x = x + obj.electrodomesticos(i).ConsumoTotal(mes);
      end
    end
    function x = ConsumoTotalAnual(obj, anio)
      x = obj.ConsumoTotal(anio * 12);
    end
    function x = AhorrosAnuales(obj, costo_kWh)
      x = obj.ConsumoTotalAnual(1) * costo_kWh;
    end
    function x = CalcularROI(obj, costo_total, costo_kWh)
      x = costo_total / obj.AhorrosAnuales(costo_kWh);
    end
  end
end