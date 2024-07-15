classdef AppPanel
    %PANEL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        
    end
    
    methods
        function obj = AppPanel(app)
            obj = uipanel(app.UIFigure);
            obj.Position = [247 85 369 312];
            obj.Visible = "on";
            label = uilabel(obj);
            label.Text = "Hello";
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

