%{

% C_G_Electrodomestico

% electro = C_G_Electrodomestico(nombre, potencia, horas_dia, dia_semana, tipo)
   % nombre: nombre del electrodomestico
   % potencia: consumo en watts
   % horas_dia: horas de uso diario
   % dia_semana: dias de uso a la semana
   % tipo: tipo de electrodomestico (Altamente Esecial, Esencial, No Esencial)

# METODOS DE OBJETO
% electro.consumoTotal(mes)                // Consumo total de n meses
   % mes : numero de meses
// Otros usos
   % electro.consumoTotal(1)              // Consumo total de 1 mes
// Verificar consideracion del tipo para el calulo (Para los devs del Backend)

%}

classdef C_G_Electrodomestico
   properties
      id
      nombre
      potencia
      horas_dia
      dia_semana
      tipo
   end
   methods
      function obj = C_G_Electrodomestico(id, nombre, potencia, horas_dia, dia_semana, tipo)
          % Captura de excepciones de entrada de parámetros inválidos
         if strcmp(nombre, "")
             ME = MException('C_G_Electrodomestico:Invalid_Param', 'Ingrese un nombre');
            throw(ME);
         elseif potencia < 1
            ME = MException('C_G_Electrodomestico:Invalid_Param', 'Ingrese un consumo válido (> 0)');
            throw(ME);
         elseif horas_dia > 24 || horas_dia < 1
            ME = MException('C_G_Electrodomestico:Invalid_Param', 'Ingrese un número de horas válido');
            throw(ME);
         elseif dia_semana > 7 || dia_semana < 1
            ME = MException('C_G_Electrodomestico:Invalid_Param', 'Ingrese un número de días válido');
            throw(ME);
         else % Agrega un objeto de forma exitosa
            obj.id = id;
            obj.nombre = nombre;
            obj.potencia = potencia;
            obj.horas_dia = horas_dia;
            obj.dia_semana = dia_semana;
            obj.tipo = tipo;
         end
      end
      
      function x = ConsumoTotal(obj, mes)
          % Calcula el consumo total de n meses
          % Donde n = parametro mes
         x = obj.potencia * obj.horas_dia * obj.dia_semana * 4 * mes;
         if strcmp(obj.tipo, "Esencial")
               x = x * 0.80;
         elseif strcmp(obj.tipo, "No Esencial")
               x = x * 0.60;
         end
      end
   end
end