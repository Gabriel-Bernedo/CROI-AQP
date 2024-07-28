classdef C_Recibo
  properties (Access = private)
    IDRecibo;
    Mes;
    Consumo_Mensual;
    Costo_Total;
    Costo_KWH;
  end
  methods
      function obj = C_G_Paneles(Id, mes, consumo_Mensual, Costo_Total, Costo_KWH)
      obj.IDRecibo = Id;
      obj.mes = mes;
      obj.Consumo_Mensual = consumo_Mensual;
      obj.Costo_Total = Costo_Total;
      obj.Costo_KWH = Costo_KWH;
    end
  end
end