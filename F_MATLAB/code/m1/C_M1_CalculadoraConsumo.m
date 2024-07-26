%{

  calc_consumo = C_M1_CalculadoraConsumo(usuario)
    % usuario : instancia de C_G_Usuario

  
%}
classdef C_M1_CalculadoraConsumo
  properties
    usuario
  end
  methods
    function obj = C_M1_CalculadoraConsumo(usuario)
      obj.usuario = usuario;
    end
  end
end