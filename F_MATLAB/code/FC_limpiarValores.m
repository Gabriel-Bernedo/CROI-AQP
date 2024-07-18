function x = FC_limpiarValores(app)
 %el tipo y el nombre vuelvan a sus valores iniciales
    app.PotenciaEnWattsEditField.Value = 0;
    app.UsoEnHorasEditField.Value = 0;
    app.CantidadDiasEditField.Value = 0;
    app.TipoDropDown.Value = "Esencial";
    app.NombreEditField.Value = "";
end