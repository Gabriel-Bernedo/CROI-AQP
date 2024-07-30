computerName = getenv('COMPUTERNAME');
disp(['El nombre de tu computadora es: ', computerName]);
%%
% Obtener el nombre de la computadora
hostname = char(java.net.InetAddress.getLocalHost.getHostName);

% Obtener la dirección IP de la computadora
ipAddress = char(java.net.InetAddress.getByName(char(java.net.InetAddress.getLocalHost.getHostName)).getHostAddress);

disp(['La dirección IP de tu computadora es: ', ipAddress]);
%%
userName = getenv('USERNAME');
disp(['El nombre de usuario es: ', userName]);
%%
usu = C_Usuario(userName,computerName,ipAddress);
x = M1_Calculadora_Consumo(usu);
%FRONTEND :: % % ("name_E",potencia, dia, noche, semana, cantidad, tipo)
%%
x = x.I_Electrodomesticos({"Batidora",1200,1,2,3,1,"Esencial"});
%%
x.usuario.electrodomesticos = x.Get_Electrodomesticos;
x.usuario.Get_electrodomestico()
