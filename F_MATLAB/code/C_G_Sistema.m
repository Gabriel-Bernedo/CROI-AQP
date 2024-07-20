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
    paneles
    baterias
    inversores
  end
  methods
    function x = C_G_Sistema(Costo_TOTAL,Ahorros_Ani)
        x = Costo_TOTAL / Ahorros_Ani;
    end
    function obj = config_Paneles(obj, paneles)
      obj.paneles = paneles;
    end
    function obj = config_Baterias(obj, baterias)
      obj.baterias = baterias;
    end
    function obj = config_Inversores(obj, inversores)
      obj.inversores = inversores;
    end
  end
end