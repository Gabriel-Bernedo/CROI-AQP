function Grafica_Recibos(app)
    app.G_Estadistica.Visible = "on";
    sel = app.T_Recibo_1.Data;
    sel_num = cell2mat(sel(:,4));
    app.A_Year_Estadistica.Items = string(unique(sel_num))';
    value = app.A_Year_Estadistica.Value;
    sel  = sel(sel_num == str2num(value),:);
    sel = sortrows(sel, 5, 'ascend');
    costo = cell2mat(sel(:,3))'
    consumo = cell2mat(sel(:,2))'
    mes = cell2mat(sel(:,5))'
    app.G_Estadistica_Recibo.XLim = [min(mes) max(mes)];
    app.G_Estadistica_Recibo.YLim = [min([min(consumo), min(costo)]) max([max(consumo), max(costo)])];
    xlabel(app.G_Estadistica_Recibo, "Mes del Año");
    ylabel(app.G_Estadistica_Recibo, "Consumo mensual");
    plot(app.G_Estadistica_Recibo, mes, consumo);
    hold(app.G_Estadistica_Recibo, 'on');
    plot(app.G_Estadistica_Recibo, mes, costo);
    legend(app.G_Estadistica_Recibo, "Consumo", "Pago Mensual");
    hold(app.G_Estadistica_Recibo, 'off');
end