%Graficación de consumo de los recibos

function Grafica_Recibos(app)
    if height(app.T_Recibo_1.Data) > 0
        app.G_Estadistica.Visible = "on";
        app.P_TablaRecibo_Consumo_1.Visible = "off";
        app.P_IngresarRecibo_1.Visible = "off";
        sel = app.T_Recibo_1.Data;
        sel_num = cell2mat(sel(:,4));
        app.A_Year_Estadistica.Items = string(unique(sel_num))';
        value = app.A_Year_Estadistica.Value;
        sel  = sel(sel_num == str2num(value),:);
        sel = sortrows(sel, 5, 'ascend');
        costo = cell2mat(sel(:,3))';
        consumo = cell2mat(sel(:,2))';
        mes = cell2mat(sel(:,5))';
        minimo = min(mes);
        maximo = max(mes);
        if minimo == maximo
            maximo = maximo + 1;
        end
        app.G_Estadistica_Recibo.XLim = [minimo maximo];
        minimo = min([min(consumo), min(costo)]);
        maximo = max([max(consumo), max(costo)]);
        if minimo == maximo
            maximo = maximo+1;
        elseif minimo > maximo
            aux = maximo;
            maximo = minimo;
            minimo = aux;
        end
        app.G_Estadistica_Recibo.YLim = [minimo maximo];
        xlabel(app.G_Estadistica_Recibo, "Mes del Año");
        ylabel(app.G_Estadistica_Recibo, "Consumo mensual");
        plot(app.G_Estadistica_Recibo, mes, consumo);
        hold(app.G_Estadistica_Recibo, 'on');
        plot(app.G_Estadistica_Recibo, mes, costo);
        legend(app.G_Estadistica_Recibo, "Consumo", "Pago Mensual");
        hold(app.G_Estadistica_Recibo, 'off');
    else
        uialert(app.P_Main,'No hay Recibos','Warning','Icon','error');
    end
end

%Retorna los datos para la gráfica