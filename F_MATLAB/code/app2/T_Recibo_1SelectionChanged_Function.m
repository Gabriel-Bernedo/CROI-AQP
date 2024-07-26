function T_Recibo_1SelectionChanged_Function(app)
    selection = app.T_Recibo_1.Selection;
    x = selection(:,1);
    rowData = app.T_Recibo_1.Data(x, :);
    app.Fi_ReciboCostoTotal_1.Value = rowData.RecCosTot;
    app.Fi_ReciboConsumo_1.Value = rowData.RecConMen;
    app.D_Mes_Gestionar_1.Value = app.D_Mes_Gestionar_1.Items{rowData.RecM};
end