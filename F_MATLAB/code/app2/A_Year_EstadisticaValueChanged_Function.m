function A_Year_EstadisticaValueChanged_Function(app)
    app.G_Estadistica.Visible = "on";
    sel = app.T_Recibo_1.Data;
    app.A_Year_Estadistica.Items = (string(unique(app.T_Recibo_1.Data.RecA)))';
    value = app.A_Year_Estadistica.Value;
    sel  = sel(sel.RecA == str2num(value),:);
    sel = sortrows(sel,'RecM','ascend');
    costo = sel.RecCosTot;
    consumo = sel.RecConMen;
    mes = sel.RecM;
     app.G_Estadistica_Recibo.XLim = [min(mes) max(mes)];
    app.G_Estadistica_Recibo.YLim = [min(min(consumo), min(costo)) max(max(consumo), max(costo))];
    xlabel(app.G_Estadistica_Recibo,"Mes del Año");
    ylabel(app.G_Estadistica_Recibo,"Consumo mensual");
    %app.G_Estadistica_Recibo.
    plot(app.G_Estadistica_Recibo,mes,consumo);
    hold(app.G_Estadistica_Recibo, 'on');
    plot(app.G_Estadistica_Recibo,mes,costo);
    legend(app.G_Estadistica_Recibo,"Consumo","Pago Mensual");
    hold(app.G_Estadistica_Recibo, 'off');

end