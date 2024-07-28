function x = ActualizarCallback(app)
    try
        consumo = app.PotenciaEnWattsEditField.Value;%captura el consumo
        horas = app.UsoEnHorasEditField.Value;%captura el uso en horas
        dias = app.CantidadDiasEditField.Value;%captura el tiempo en dias
        tipo = app.TipoDropDown.Value;%captura el tipo de electrodomestico
        nombre = app.NombreEditField.Value;%captura el nombre}
        %crea un electrodomestico con su constructor, se pasan como
        %argumento los valores obtenidos previamente
        equipo = C_Electrodomestico(nombre, consumo, horas, dias, tipo);
        %modifica un equipo(electrodomestico) del usuario a traves del metodo
        %Mod_Electrodomestico() se le pasa por argumente el equipo
        app.usuario = app.usuario.Mod_Electrodomestico(equipo);
        %muestra mensaje en caso no halla error
        message = "El consumo actualizado a: "+ equipo.ConsumoTotal(1)+" Watts al mes";
        %cambia el valor del boton de Actualizar a Agregar
        app.AgregarButton.Text = "Agregar";
        %cambia el callback a AgregarCallback
        app.AgregarButton.ButtonPushedFcn = createCallbackFcn(app, @AgregarCallback, true);
        %habilita los demas botones y hace no visisble a SeleccioneDropDown
        %ya que ya se modifico el valor
        app.NombreEditField.Editable = "on";
        app.SeleccioneDropDown.Visible = "off";
        app.ModificarButton.Enable = "on";
        app.EliminartodoButton.Enable = "on";
        app.CalcularPotenciaButton.Enable = "on";
        app.EliminarButton.Enable = "on";
        limpiarValores(app);%limpia los campos
    catch exception%captura excepciones
        message = exception.message;
    end
    app.ResultadoLabel.Text = message;%muestra el mensaje
end