%{

% elec_base = C_G_ElectrodomesticoBase(codigo, nombre, consumo, ambiente)
  % codigo : codigo del electrodomesticoBase 
  % nombre : nombre del electrodomesticoBase
  % consumo : potencia de consumo Base
  % ambiente : Instancia de C_G_Ambiente

%}

classdef C_G_ElectrodomesticoBase
  properties
    base_codigo
    nombre
    consumo_potencia
    ambiente
  end
  methods
    function obj = C_G_ElectrodomesticoBase(codigo, nombre, consumo, ambiente)
      obj.base_codigo = codigo;
      obj.nombre = nombre;
      obj.consumo_potencia = consumo;
      obj.ambiente = ambiente;
    end
  end
end