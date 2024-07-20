%{

% C_G_Sistema

# CONSTRUCTOR
% sistema = C_G_Sistema()

# METODOS DE INSTANCIA

% sistema.config_Paneles(paneles)                // Configurar paneles
  % paneles : instancia de Paneles

% sistema.config_Baterias(baterias)              // Configurar baterias
  % baterias : instancia de Baterias

% sistema.config_Inversores(inversores)          // Configurar inversores
  % inversores : instancia de Inversores

%}
classdef C_G_Sistema
  properties
    modelo_Paneles
    modelo_Baterias
    modelo_inversores
    cantidad_Paneles
    cantidad_Baterias
    cantidad_Inversores
  end
  methods
    function x = C_G_Sistema(Costo_TOTAL,Ahorros_Ani)
        x = Costo_TOTAL / Ahorros_Ani;
    end
    function obj = config_Paneles(obj, paneles)
      obj.modelo_Paneles = paneles;
    end
    function obj = config_Baterias(obj, baterias)
      obj.modelo_Baterias = baterias;
    end
    function obj = config_Inversores(obj, inversores)
      obj.modelo_inversores = inversores;
    end
    function obj = calc_sistema(obj, consumo_Mensual, consumoHora, potencia_Pico)
      obj.cantidad_Inversores = 1;
      obj.cantidad_Baterias = 10;
      obj.cantidad_Paneles = 10;
    end
  end
end