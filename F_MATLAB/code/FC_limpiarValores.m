function x = FC_limpiarValores(app)
 %el tipo y el nombre vuelvan a sus valores iniciales
    app.Fi_PotenciaEnWatts_1.Value = 0;
    app.Fi_HorasDias_1.Value = 0;
    app.Fi_HorasNoche_1.Value = 0;
    app.Fi_Uso_Semana_1 = 0;
    app.Tipo_anadir_1.Value = "Esencial";
    app.NombreEditField.Value = "";
end