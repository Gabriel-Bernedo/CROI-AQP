classdef Hello < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                    matlab.ui.Figure
        Panel_3                     matlab.ui.container.Panel
        ModificarModelosButton      matlab.ui.control.Button
        AadirButton                 matlab.ui.control.Button
        GestionarButton             matlab.ui.control.Button
        CalcularConsumoButton       matlab.ui.control.Button
        Image                       matlab.ui.control.Image
        Panel_2                     matlab.ui.container.Panel
        GridLayout                  matlab.ui.container.GridLayout
        EnergaProducidaButton       matlab.ui.control.Button
        InstalacionButton           matlab.ui.control.Button
        CalculadoradeConsumoButton  matlab.ui.control.Button
        Panel                       matlab.ui.container.Panel
        ModelosLabel                matlab.ui.control.Label
        ListBox                     matlab.ui.control.ListBox
        DasLabel                    matlab.ui.control.Label
        HorasLabel                  matlab.ui.control.Label
        WattsLabel                  matlab.ui.control.Label
        CantidadDiasEditField       matlab.ui.control.NumericEditField
        UsoporsemanaLabel           matlab.ui.control.Label
        UsoEnHorasEditField         matlab.ui.control.NumericEditField
        UsopordaLabel               matlab.ui.control.Label
        PotenciaEnWattsEditField    matlab.ui.control.NumericEditField
        PotenciaLabel               matlab.ui.control.Label
        NombreEditField             matlab.ui.control.EditField
        NombreEditFieldLabel        matlab.ui.control.Label
        TipoDropDown                matlab.ui.control.DropDown
        TipoDropDownLabel           matlab.ui.control.Label
        AgregarButton               matlab.ui.control.Button
        CalcularPotenciaButton      matlab.ui.control.Button
        ResultadoLabel              matlab.ui.control.Label
        CalculadoradeROIenlaimplementacindeenergasolarvselctricaLabel  matlab.ui.control.Label
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create CalculadoradeROIenlaimplementacindeenergasolarvselctricaLabel
            app.CalculadoradeROIenlaimplementacindeenergasolarvselctricaLabel = uilabel(app.UIFigure);
            app.CalculadoradeROIenlaimplementacindeenergasolarvselctricaLabel.WordWrap = 'on';
            app.CalculadoradeROIenlaimplementacindeenergasolarvselctricaLabel.FontName = 'Times New Roman';
            app.CalculadoradeROIenlaimplementacindeenergasolarvselctricaLabel.FontSize = 16;
            app.CalculadoradeROIenlaimplementacindeenergasolarvselctricaLabel.FontWeight = 'bold';
            app.CalculadoradeROIenlaimplementacindeenergasolarvselctricaLabel.Position = [57 429 529 30];
            app.CalculadoradeROIenlaimplementacindeenergasolarvselctricaLabel.Text = 'Calculadora de ROI en la implementación de energía solar vs eléctrica';

            % Create Panel
            app.Panel = uipanel(app.UIFigure);
            app.Panel.Position = [247 85 369 312];

            % Create ResultadoLabel
            app.ResultadoLabel = uilabel(app.Panel);
            app.ResultadoLabel.FontWeight = 'bold';
            app.ResultadoLabel.Visible = 'off';
            app.ResultadoLabel.Position = [33 50 321 32];
            app.ResultadoLabel.Text = 'Resultado';

            % Create CalcularPotenciaButton
            app.CalcularPotenciaButton = uibutton(app.Panel, 'push');
            app.CalcularPotenciaButton.Enable = 'off';
            app.CalcularPotenciaButton.Position = [89 18 109 22];
            app.CalcularPotenciaButton.Text = 'Calcular Potencia';

            % Create AgregarButton
            app.AgregarButton = uibutton(app.Panel, 'push');
            app.AgregarButton.Position = [220 18 100 22];
            app.AgregarButton.Text = 'Agregar';

            % Create TipoDropDownLabel
            app.TipoDropDownLabel = uilabel(app.Panel);
            app.TipoDropDownLabel.HorizontalAlignment = 'right';
            app.TipoDropDownLabel.Position = [145 90 28 22];
            app.TipoDropDownLabel.Text = 'Tipo';

            % Create TipoDropDown
            app.TipoDropDown = uidropdown(app.Panel);
            app.TipoDropDown.Items = {'Esencial', 'No Esencial', 'Altamente Esencial'};
            app.TipoDropDown.Position = [188 90 132 22];
            app.TipoDropDown.Value = 'Esencial';

            % Create NombreEditFieldLabel
            app.NombreEditFieldLabel = uilabel(app.Panel);
            app.NombreEditFieldLabel.HorizontalAlignment = 'right';
            app.NombreEditFieldLabel.Position = [178 210 48 22];
            app.NombreEditFieldLabel.Text = 'Nombre';

            % Create NombreEditField
            app.NombreEditField = uieditfield(app.Panel, 'text');
            app.NombreEditField.HorizontalAlignment = 'right';
            app.NombreEditField.Position = [241 210 113 22];

            % Create PotenciaLabel
            app.PotenciaLabel = uilabel(app.Panel);
            app.PotenciaLabel.HorizontalAlignment = 'right';
            app.PotenciaLabel.Position = [173 182 52 22];
            app.PotenciaLabel.Text = 'Potencia';

            % Create PotenciaEnWattsEditField
            app.PotenciaEnWattsEditField = uieditfield(app.Panel, 'numeric');
            app.PotenciaEnWattsEditField.HorizontalAlignment = 'center';
            app.PotenciaEnWattsEditField.Position = [240 182 114 22];

            % Create UsopordaLabel
            app.UsopordaLabel = uilabel(app.Panel);
            app.UsopordaLabel.HorizontalAlignment = 'right';
            app.UsopordaLabel.Position = [159 154 67 22];
            app.UsopordaLabel.Text = 'Uso por día';

            % Create UsoEnHorasEditField
            app.UsoEnHorasEditField = uieditfield(app.Panel, 'numeric');
            app.UsoEnHorasEditField.HorizontalAlignment = 'center';
            app.UsoEnHorasEditField.Position = [241 154 113 22];

            % Create UsoporsemanaLabel
            app.UsoporsemanaLabel = uilabel(app.Panel);
            app.UsoporsemanaLabel.HorizontalAlignment = 'right';
            app.UsoporsemanaLabel.Position = [133 124 93 22];
            app.UsoporsemanaLabel.Text = 'Uso por semana';

            % Create CantidadDiasEditField
            app.CantidadDiasEditField = uieditfield(app.Panel, 'numeric');
            app.CantidadDiasEditField.HorizontalAlignment = 'center';
            app.CantidadDiasEditField.Position = [241 124 113 22];

            % Create WattsLabel
            app.WattsLabel = uilabel(app.Panel);
            app.WattsLabel.Position = [319 182 35 22];
            app.WattsLabel.Text = 'Watts';

            % Create HorasLabel
            app.HorasLabel = uilabel(app.Panel);
            app.HorasLabel.Position = [319 154 35 22];
            app.HorasLabel.Text = 'Horas';

            % Create DasLabel
            app.DasLabel = uilabel(app.Panel);
            app.DasLabel.Position = [320 124 30 22];
            app.DasLabel.Text = 'Días';

            % Create ListBox
            app.ListBox = uilistbox(app.Panel);
            app.ListBox.Items = {'Adornos', 'Aire acondicionado', 'Altavoces', 'Consola', 'Computadora', 'Foco', 'Televisión'};
            app.ListBox.Position = [8 140 125 97];
            app.ListBox.Value = 'Adornos';

            % Create ModelosLabel
            app.ModelosLabel = uilabel(app.Panel);
            app.ModelosLabel.Position = [8 245 50 22];
            app.ModelosLabel.Text = 'Modelos';

            % Create Panel_2
            app.Panel_2 = uipanel(app.UIFigure);
            app.Panel_2.Position = [20 85 224 221];

            % Create GridLayout
            app.GridLayout = uigridlayout(app.Panel_2);
            app.GridLayout.ColumnWidth = {'1x'};
            app.GridLayout.RowHeight = {'1x', '1x', '1x'};

            % Create CalculadoradeConsumoButton
            app.CalculadoradeConsumoButton = uibutton(app.GridLayout, 'push');
            app.CalculadoradeConsumoButton.Icon = 'calc.png';
            app.CalculadoradeConsumoButton.BackgroundColor = [0.2706 0.7843 0.9608];
            app.CalculadoradeConsumoButton.FontWeight = 'bold';
            app.CalculadoradeConsumoButton.Layout.Row = 1;
            app.CalculadoradeConsumoButton.Layout.Column = 1;
            app.CalculadoradeConsumoButton.Text = 'Calculadora de Consumo';

            % Create InstalacionButton
            app.InstalacionButton = uibutton(app.GridLayout, 'push');
            app.InstalacionButton.Icon = 'panel.png';
            app.InstalacionButton.BackgroundColor = [0.4745 0.5137 0.5294];
            app.InstalacionButton.FontWeight = 'bold';
            app.InstalacionButton.Layout.Row = 2;
            app.InstalacionButton.Layout.Column = 1;
            app.InstalacionButton.Text = 'Instalación';

            % Create EnergaProducidaButton
            app.EnergaProducidaButton = uibutton(app.GridLayout, 'push');
            app.EnergaProducidaButton.Icon = 'energia.png';
            app.EnergaProducidaButton.BackgroundColor = [0 0.0902 0.1098];
            app.EnergaProducidaButton.FontWeight = 'bold';
            app.EnergaProducidaButton.FontColor = [1 1 1];
            app.EnergaProducidaButton.Layout.Row = 3;
            app.EnergaProducidaButton.Layout.Column = 1;
            app.EnergaProducidaButton.Text = 'Energía Producida';

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.BackgroundColor = [0 0 0];
            app.Image.Position = [82 321 100 100];
            app.Image.ImageSource = 'logo.jpg';

            % Create Panel_3
            app.Panel_3 = uipanel(app.UIFigure);
            app.Panel_3.Position = [246 359 370 38];

            % Create CalcularConsumoButton
            app.CalcularConsumoButton = uibutton(app.Panel_3, 'push');
            app.CalcularConsumoButton.BackgroundColor = [0 0.0902 0.1098];
            app.CalcularConsumoButton.FontColor = [0.9412 0.9412 0.9412];
            app.CalcularConsumoButton.Position = [179 1 96 37];
            app.CalcularConsumoButton.Text = {'Calcular '; 'Consumo'};

            % Create GestionarButton
            app.GestionarButton = uibutton(app.Panel_3, 'push');
            app.GestionarButton.BackgroundColor = [0 0.0902 0.1098];
            app.GestionarButton.FontColor = [1 1 1];
            app.GestionarButton.Position = [94 1 85 38];
            app.GestionarButton.Text = 'Gestionar';

            % Create AadirButton
            app.AadirButton = uibutton(app.Panel_3, 'push');
            app.AadirButton.BackgroundColor = [0 0.0902 0.1098];
            app.AadirButton.FontColor = [1 1 1];
            app.AadirButton.Position = [1 1 93 38];
            app.AadirButton.Text = 'Añadir';

            % Create ModificarModelosButton
            app.ModificarModelosButton = uibutton(app.Panel_3, 'push');
            app.ModificarModelosButton.BackgroundColor = [0 0.0902 0.1098];
            app.ModificarModelosButton.FontColor = [0.9412 0.9412 0.9412];
            app.ModificarModelosButton.Position = [274 1 96 37];
            app.ModificarModelosButton.Text = {'Modificar'; 'Modelos'};

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end