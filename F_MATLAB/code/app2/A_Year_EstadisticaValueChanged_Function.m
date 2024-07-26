function A_Year_EstadisticaValueChanged_Function(app)
    sel = app.T_Recibo_1.Data;
    app.A_Year_Estadistica.Items = (string(unique(app.T_Recibo_1.Data.RecA)))';
    value = app.A_Year_Estadistica.Value;
    sel  = sel(sel.RecA == str2num(value),:);
    sel = sortrows(sel,'RecM','ascend');
    consumo = sel.RecConMen;
    mes = sel.RecM;
    app.G_Estadistica_Recibo.XTick = unique(mes);
    app.G_Estadistica_Recibo.YTick = unique(consumo);
    xlabel(app.G_Estadistica_Recibo,"Mes del Año");
    ylabel(app.G_Estadistica_Recibo,"Consumo mensual");
    %app.G_Estadistica_Recibo.
    plot(app.G_Estadistica_Recibo,mes,consumo);
end