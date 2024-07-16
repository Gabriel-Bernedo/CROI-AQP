function x = FC_showView(app, view)
    app.Panel.Visible = "off";
    app.Panel2.Visible = "off";
    app.Panel3.Visible = "off";
    app.Panel4.Visible = "off";
    app.Panel5.Visible = "off";
    app.Panel6.Visible = "off";

    switch (view)
        case 1
            app.Panel.Visible = "on";
        case 2
            app.Panel2.Visible = "on";
        case 3
            app.Panel3.Visible = "on";
        case 4
            app.Panel4.Visible = "on";
        case 5
            app.Panel5.Visible = "on";
        case 6
            app.Panel6.Visible = "on";
        otherwise
            fprintf("Vistan invalida ");
    end
end