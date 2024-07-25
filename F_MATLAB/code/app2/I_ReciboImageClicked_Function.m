function I_ReciboImageClicked_Function(app)
    sel = app.T_Recibo_1.Data;
    sel  = sel(sel.RecA == 2023,:);
    sel = sortrows(sel,'RecM','descend');
    consumo = sel.RecConMen;
    mes = sel.RecM;
    app.G_Estadistica_Recibo.XTick = unique(mes);
    xlabel(app.G_Estadistica_Recibo,"Mes del Año");
    ylabel(app.G_Estadistica_Recibo,"Consumo mensual");
    %app.G_Estadistica_Recibo.
    plot(app.G_Estadistica_Recibo,mes,consumo);
end