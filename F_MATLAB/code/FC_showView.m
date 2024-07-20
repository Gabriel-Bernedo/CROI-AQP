% app = Aplicacion
% view = instancia de vista

% Con respecto a view, cambiar las vistas de app : Paneles
function x = FC_showView(app, view)

    switch (view)
        case "1" % Click calculadora de consumo
        app.P_inicio_1.Visible = 'on';
        app.P_IngresarRecibo_1.Visible = 'off';
        app.P_TablaRecibo_Consumo_1.Visible = 'off';
        app.P_Anadir_IngresarE_1.Visible = 'off';
        app.P_Botones_Recibo_1.Visible = 'off';

    case "1.1" % Click ingresar recibo
        app.P_inicio_1.Visible = 'off';
        app.P_IngresarRecibo_1.Visible = 'on';
        app.P_Botones_Recibo_1.Visible = 'on';
          
    case "1.1.2" % Click regresar en ingresar recibo o ingresar electrodoméstico
        app.P_TablaRecibo_Consumo_1.Visible = 'off';
        app.P_IngresarRecibo_1.Visible = 'off';
        app.P_inicio_1.Visible = 'on';
        app.P_Botones_Recibo_1.Visible = 'off';
    case "1.1.3" % Click en añadir en recibo
        app.P_inicio_1.Visible = 'off';
        app.P_IngresarRecibo_1.Visible = 'on';
        app.P_TablaRecibo_Consumo_1.Visible = 'off';
        
    case "1.1.4" % Click en gestionar recibo
        app.P_inicio_1.Visible = 'off';
        app.P_IngresarRecibo_1.Visible = 'off';
        app.P_TablaRecibo_Consumo_1.Visible = 'on';
        
    case "1.2.1" % Click en añadir en Ingresar electrodomésticos
        app.P_Inicio_1.Visible = 'off';
        app.P_Anadir_IngresarE_1.Visible = 'on';
        app.P_Gestionar_IngresarE.Visible = 'off';
        app.P_CalcularConsumo_IngresarE_1.Visible = 'off';
        app.P_ModificarElectrodomesticos_IngresarE_1.Visible = "off";
        
    case "1.2.2" % Click en gestionar en Ingresar electrodomesticos
        app.P_Anadir_IngresarE_1.Visible = "off";
        app.P_Gestionar_IngresarE.Visible = "on";
        app.P_CalcularConsumo_IngresarE_1.Visible = "off";
        app.P_ModificarElectrodomesticos_IngresarE_1.Visible = "off";
        
    case "1.2.3" % Click en calcularConsumo en Ingresar electrodomesticos
        app.P_Anadir_IngresarE_1.Visible = "off";
        app.P_Gestionar_IngresarE.Visible = "off";
        app.P_CalcularConsumo_IngresarE_1.Visible = "on";
        app.P_ModificarElectrodomesticos_IngresarE_1.Visible = "off";
        
    case "1.2.4" % Click en ModificarElectrodomésticos en Ingresar electrodomesticos
        app.P_Anadir_IngresarE_1.Visible = "off";
        app.P_Gestionar_IngresarE.Visible = "off";
        app.P_CalcularConsumo_IngresarE_1.Visible = "off";
        app.P_ModificarElectrodomesticos_IngresarE_1.Visible = "on";
        
    otherwise
        fprintf("Vista invalida ");
    end
end
% No roetorna nada