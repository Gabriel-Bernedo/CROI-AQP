function mostrar_Imagen(app, ambiente, base_codigo, imageComponent)
    % Crear el path de la imagen
    imagePath = fullfile('C:\Users\Ilak\Downloads\MAT-lab\IPS\CROI-AQP\F_MATLAB\Imagenes', ['img_', ambiente], ['img_', num2str(base_codigo), '.png']);
    
    % Verificar si la imagen existe
    if isfile(imagePath)
        % Mostrar la imagen en el componente uiimage
        imageComponent.ImageSource = imagePath;
    else
        warning('La imagen no existe: %s', imagePath);
    end
end
