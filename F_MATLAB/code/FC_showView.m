% app = Aplicacion
% view = instancia de vista

% Con respecot a view, cambiar las vistas de app : Paneles
function x = FC_showView(app, view)
    app.Panel.Visible = "off";
    app.Panel2.Visible = "off";
    app.Panel_3.Visible = "off";
    app.Panel_4.Visible = "off";
    app.Panel_5.Visible = "off";
    app.Panel_6.Visible = "off";

    switch (view)
        case "1.1"
            app.Panel.Visible = "on";
            app.Panel_3.Visible = "on";
        case "2"
            app.Panel2.Visible = "on";
        case "1.2"
            app.Panel.Visible = "on";
            app.Panel_3.Visible = "off";
            app.Panel_4.Visible = "on";
            app.Panel_5.Visible = "off";
            app.Panel_6.Visible = "off";
        case "1.3"
            app.Panel.Visible = "on";
             app.Panel_3.Visible = "off";
            app.Panel_4.Visible = "off";
            app.Panel_5.Visible = "on";
            app.Panel_6.Visible = "off";
        case "1.4"
            app.Panel.Visible = "on";
            app.Panel_3.Visible = "off";
            app.Panel_4.Visible = 'off'; % Panel con la tabla
            app.Panel_5.Visible = 'off'; % Panel de calcular consumo
            app.Panel_6.Visible = 'on';
        case "6"
            app.Panel_6.Visible = "on";
        otherwise
            fprintf("Vistan invalida ");
    end
end
% No roetorna nada