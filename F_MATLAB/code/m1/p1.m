A = rand(3);
B = ones(5);
try
    C = [A;B];
catch ME
    %uialert(uifigure, identificador, 'Error', 'Icon','info');
    seleccion = uiconfirm(uifigure, '¿Estas seguro de Elimar este registro?', ...
        'Confirmacion', 'Options',{'Si','No'}, 'DefaultOption',2,'CancelOption',2, ...
        'Icon','warning')

end