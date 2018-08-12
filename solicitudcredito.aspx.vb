Imports System.Net.NetworkCredential
Imports System.Net
Imports System.IO
Imports referenciaws
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc

Partial Class solicitudcredito
    Inherits System.Web.UI.Page
	
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Try
		
		'-- Si no hay usuario logueado, que vaya directamente al loguin
		If Session("ActiveUser") = "" Then
			Response.Write("<script language='JavaScript'>top.location.href='LoginAcceso.aspx';</script>")
		End If
		If Session("PerfilUser") = "Admin" Then
			Response.Write("<script language='JavaScript'>top.location.href='menu.aspx';</script>")
		End If
		If Session("ComunidadUser") <> 2 Then
			Response.Write("<script language='JavaScript'>top.location.href='menu.aspx';</script>")
		End If
		'--
		
		Session("ReferenciaBuro") = ""
		
		If tradicional.Checked Then
            TCredito.Visible = False
			TPrestamos.Visible = False
        End If
		
		Dim k As Integer
		For k = (CInt(Now().Year) - 100) To CInt(Now().Year) - 18
			Anio.Items.Add(k)
		Next
		Anio.Items.Insert(0, New ListItem("", ""))
		For k = 2013 To Now.Year
			Anio.Items.Insert(Anio.Items.Count, New ListItem(k, k))
		Next
		
		'LlenaEstado()

		Catch ex As Exception
			
		End Try
    End Sub
	
	Protected Sub btninsertdatos_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btninsertdatos.Click
		Try
		
		'-- Si no hay usuario logueado, que vaya directamente al loguin
		If Session("ActiveUser") = "" Then
			Response.Write("<script language='JavaScript'>top.location.href='LoginAcceso.aspx';</script>")
		End If
		If Session("PerfilUser") = "Admin" Then
			Response.Write("<script language='JavaScript'>top.location.href='menu.aspx';</script>")
		End If
		'--
		
		'Hace el llamado al Web service de Buro de Crédito
		GuardarCliente()
		
		Catch ex As Exception
			'MsgBox("Ha ocurrido un error para Conectarse al WebService!", MsgBoxStyle.Critical, "Advertencia")
		End Try
	End Sub
	
	Sub LlenaEstado()
		
		'Creamos la cadena de conexion'
		Dim strConexion As String
		strConexion = ConfigurationManager.ConnectionStrings("dbMysql").ConnectionString
		
		'Creamos el objeto conexion para enlazar con el servidor de datos
		Dim oConnection As OdbcConnection = New OdbcConnection(strConexion)

		'Creamos la sentencia SQL que devuelva los datos deseados
		Dim strSQL As String
		strSQL = "SELECT codigo,estado FROM estado "

		'Instanciamos el objeto Command
		Dim oDataAdapter As OdbcDataAdapter = New OdbcDataAdapter(strSQL, oConnection)
		Dim oDataSet As DataSet = New DataSet()
		oDataAdapter.Fill(oDataSet,"estadoscombo")
		
		Dim x As Integer = 0
		estado.Items.Insert(x, "")
		If oDataSet.Tables("estadoscombo").Rows.Count <> 0 Then
			Do While x <> oDataSet.Tables("estadoscombo").Rows.Count
				x = x + 1
				estado.Items.Insert(x , oDataSet.Tables("estadoscombo").Rows(x)("estado").ToString)
			Loop
		End If
		estado.SelectedIndex = 0
	
	End Sub
	
	Sub GuardarClienteClientsisweb(ByVal refburo As String)
		
		Dim TipoConsultaOpcion As String
		Dim TCreditoOpcion As String
		Dim TCHipoOpcion As String
		Dim TCAutoOpcion As String
		Dim Viviendapro As String
		
		If propiasi.Checked = True Then
			Viviendapro = "V"
		Else
			Viviendapro = "F"
		End If
		If tradicional.Checked = True Then
			TipoConsultaOpcion = "BC"
		Else
			TipoConsultaOpcion = "AU"
		End If
		If TipoConsultaOpcion = "AU" Then
			If tcreditosi.Checked = True Then
				TCreditoOpcion = "V"
			Else
				TCreditoOpcion = "F"
			End If
			If hipotecariosi.Checked = True Then
				TCHipoOpcion = "V"
			Else
				TCHipoOpcion = "F"
			End If
			If automotrizsi.Checked = True Then
				TCAutoOpcion = "V"
			Else
				TCAutoOpcion = "F"
			End If
		End If
		'Creamos la cadena de conexion'
		Dim strConexionSQLSever As String
		strConexionSQLSever = ConfigurationManager.ConnectionStrings("dbclientsisweb").ConnectionString
		Using cn As New SqlConnection(strConexionSQLSever)
			cn.Open()
			Dim cmd As New SqlCommand()
			
			'Dim pruebastxt As String
			'pruebastxt = "INSERT INTO registro_clientes (primernombre,segundonombre,apellidopaterno,apellidomaterno,fechanacimiento,referencia,rfc,calle,numexterior,numinterior,manzana,lote,colonia,municipio,ciudad,estado,codpostal,Antdomicilio,salario,tipoempleo,antlaboral,referenciaburo,tipoConsulta,cuentaTarjetaCredito,ultimosCuatroDigitosTarjetaCredito,creditoHipotecario,creditoAutomotriz,Viviendapropia) VALUES('" & txtnombre.Text & "','" &  nombre1.Text & "','" &  apellidos.Text & "','" &  apellidos1.Text & "','" &  Dia.SelectedItem.Value & "/" & Mes.SelectedItem.Value & "/" & Anio.SelectedItem.Value & "','" &  referencia.Text & "','" &  rfc.Text & "','" &  calle.Text & "','" &  numexterior.Text & "','" &  numinterior.Text & "','" &  manzana.Text & "','" &  lote.Text & "','" &  colonia.Text & "','" &  municipio.Text & "','" &  ciudad.Text & "','" &  estado.Text & "','" &  codpostal.Text & "','" &  Antdomicilio.Text & "','" &  salario.Text & "','" &  tipoempleo.Text & "','" &  antlaboral.Text & "','" &  refburo & "','" &  TipoConsultaOpcion & "','" &  TCreditoOpcion & "','" &  ultimosCuatroDigitosTarjetaCredito.Text & "','" &  TCHipoOpcion & "','" &  TCAutoOpcion & "','" &  Viviendapro & "')"
			'ErrorMsg.Text = pruebastxt
			cmd.CommandText = "INSERT INTO registro_clientes (primernombre,segundonombre,apellidopaterno,apellidomaterno,fechanacimiento,referencia,rfc,calle,numexterior,numinterior,manzana,lote,colonia,municipio,ciudad,estado,codpostal,Antdomicilio,salario,tipoempleo,antlaboral,referenciaburo,tipoConsulta,cuentaTarjetaCredito,ultimosCuatroDigitosTarjetaCredito,creditoHipotecario,creditoAutomotriz,Viviendapropia,Puntos,Semaforo) VALUES('" & txtnombre.Text & "','" &  nombre1.Text & "','" &  apellidos.Text & "','" &  apellidos1.Text & "','" &  Mes.SelectedItem.Value & "/" & Dia.SelectedItem.Value & "/" & Anio.SelectedItem.Value & "','" &  referencia.Text & "','" &  rfc.Text & "','" &  calle.Text & "','" &  numexterior.Text & "','" &  numinterior.Text & "','" &  manzana.Text & "','" &  lote.Text & "','" &  colonia.Text & "','" &  municipio.Text & "','" &  ciudad.Text & "','" &  estado.Text & "','" &  codpostal.Text & "','" &  Antdomicilio.Text & "','" &  salario.Text & "','" &  tipoempleo.Text & "','" &  antlaboral.Text & "','" &  refburo & "','" &  TipoConsultaOpcion & "','" &  TCreditoOpcion & "','" &  ultimosCuatroDigitosTarjetaCredito.Text & "','" &  TCHipoOpcion & "','" &  TCAutoOpcion & "','" &  Viviendapro & "','" &  puntosdato.Text & "','" &  semaforodato.Text & "')"
			cmd.Connection = cn
			cmd.ExecuteNonQuery()
			cn.Close()
	    End Using

	End Sub
	
	Sub GuardarCliente()
		Dim TipoConsultaOpcion As String
		Dim TCreditoOpcion As String
		Dim TCHipoOpcion As String
		Dim TCAutoOpcion As String
		Dim mensajejava As String
		If tradicional.Checked = True Then
			TipoConsultaOpcion = "BC"
		Else
			TipoConsultaOpcion = "AU"
		End If
		If TipoConsultaOpcion = "AU" Then
			If tcreditosi.Checked = True Then
				TCreditoOpcion = "V"
			Else
				TCreditoOpcion = "F"
			End If
			If hipotecariosi.Checked = True Then
				TCHipoOpcion = "V"
			Else
				TCHipoOpcion = "F"
			End If
			If automotrizsi.Checked = True Then
				TCAutoOpcion = "V"
			Else
				TCAutoOpcion = "F"
			End If
		End If
        'Crea la referencia al web service de java
        Dim jws As New referenciaws.ConsultaBuroCreditoWebServiceImplService
        Dim oPuedePesar As New referenciaws.datosBuroCredito
        oPuedePesar.apellidoMaterno = apellidos1.Text
        oPuedePesar.apellidoPaterno = apellidos.Text
        oPuedePesar.calle = calle.Text
        oPuedePesar.ciudad = ciudad.Text
        oPuedePesar.codigoPostal = codpostal.Text
        oPuedePesar.colonia = colonia.Text
        oPuedePesar.creditoAutomotriz = TCAutoOpcion
        oPuedePesar.creditoHipotecario = TCHipoOpcion
        oPuedePesar.cuentaTarjetaCredito = TCreditoOpcion
        oPuedePesar.estado = estado.SelectedItem.Value
        oPuedePesar.fechaNacimiento = Dia.SelectedItem.Value & Mes.SelectedItem.Value & Anio.SelectedItem.Value
        oPuedePesar.lote = lote.Text
        oPuedePesar.manzana = manzana.Text
        oPuedePesar.municipio = municipio.Text
        oPuedePesar.numeroExterior = numexterior.Text
        oPuedePesar.numeroInterior = numinterior.Text
        oPuedePesar.primerNombre = txtnombre.Text
        oPuedePesar.referenciaCliente = referencia.Text
        oPuedePesar.rfc = rfc.Text
        oPuedePesar.segundoNombre = nombre1.Text
        oPuedePesar.tipoConsulta = TipoConsultaOpcion
        oPuedePesar.ultimosCuatroDigitosTarjetaCredito = ultimosCuatroDigitosTarjetaCredito.Text

        'Si devuelve falso es porque se inserto ese dato
        Dim oPuedePesarResponse As referenciaws.respuestaBuroCredito = jws.consultarBuroCredito(oPuedePesar)
        If oPuedePesarResponse.error Then
            ErrorMsg.Text = "ERROR: " & oPuedePesarResponse.mensaje 
			'mensajejava = TipoConsultaOpcion & " - " & ultimosCuatroDigitosTarjetaCredito.Text & " - " & TCreditoOpcion & " - " & TCHipoOpcion & " - " & TCAutoOpcion
			'Response.Write("<script language='JavaScript'>alert('" & mensajejava & "');</script>")
        Else
            Session("ReferenciaBuro") = oPuedePesarResponse.referenciaBuroCredito
			'Genera los campos Puntos y Semaforo
			SemaforoPuntos()
			'Guardar la información del formulario en la db ClientsisWeb
			GuardarClienteClientsisweb(oPuedePesarResponse.referenciaBuroCredito)
			'Response.Write("<script language='JavaScript'>alert('El cliente ha sido registrado Correctamente! Referencia No. " & oPuedePesarResponse.referenciaBuroCredito & "');</script>")
			Response.Redirect("consultas.aspx")
            'ErrorMsg.Text = "El cliente ha sido registrado Correctamente! Referencia No. " & oPuedePesarResponse.referenciaBuroCredito
            'ErrorMsg.Text = "- " & oPuedePesarResponse.error & "- " & oPuedePesarResponse.mensaje & "- " & oPuedePesarResponse.errorSpecified & "- " & oPuedePesarResponse.fechaConsulta & "- " & oPuedePesarResponse.nombreCliente & "- " & oPuedePesarResponse.referenciaBuroCredito
        End If

    End Sub
	
	Protected Sub tradicional_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles tradicional.CheckedChanged
		If tradicional.Checked Then
            TCredito.Visible = False
			TPrestamos.Visible = False
        End If
	End Sub
	
	Protected Sub autenticacion_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles autenticacion.CheckedChanged
		If autenticacion.Checked Then
            TCredito.Visible = True
			TPrestamos.Visible = True
        End If
	End Sub
	
	Private Function CalcularEdad(ByVal DiaNacimiento As Integer, ByVal MesNacimiento As Integer, ByVal AñoNacimiento As Integer)
        ' SE DEFINEN LAS FECHAS ACTUALES
        Dim AñoActual As Integer = Year(Now)
        Dim MesActual As Integer = Month(Now)
        Dim DiaActual As Integer = Now.Day
        Dim Cumplidos As Boolean = False
        ' SE COMPRUEBA CUANDO FUE EL ULTIMOS CUMPLEAÑOS
        ' FORMULA:
        '   Años cumplidos = (Año del ultimo cumpleaños - Año de nacimiento)
        If (MesNacimiento <= MesActual) Then
            If (DiaNacimiento <= DiaActual) Then
                If (DiaNacimiento = DiaActual and MesNacimiento = MesActual) Then
                    'MsgBox("Feliz Cumpleaños!")
                End If
					' MsgBox("Ya cumplio")
                Cumplidos = True
            End If
        End If

        If (Cumplidos = False) Then
            AñoActual = (AñoActual - 1)
            'MsgBox("Ultimo cumpleaños: " & AñoActual)
        End If
        ' Se realiza la resta de años para definir los años cumplidos
        Dim EdadAños As Integer = (AñoActual - AñoNacimiento)
        ' DEFINICION DE LOS MESES LUEGO DEL ULTIMO CUMPLEAÑOS
        Dim EdadMes As Integer
        If Not (AñoActual = Now.Year) Then
            EdadMes = (12 - MesNacimiento)
            EdadMes = EdadMes + Now.Month
        Else
            EdadMes = Math.Abs(Now.Month - MesNacimiento)
        End If
        'SACAMOS LA CANTIDAD DE DIAS EXACTOS
        Dim EdadDia As Integer = (DiaActual - DiaNacimiento)

        'RETORNAMOS LOS VALORES EN UNA CADENA STRING
        'Return ("Ud. tiene exactamente " & EdadAños & " años , " & EdadMes & " meses y " & EdadDia & " dias")
		Return (EdadAños)

    End Function
	
	Sub SemaforoPuntos()
		Dim semaforo As String
		Dim puntos As Integer
		Dim scoredvalor As Integer
		Dim edadanio As String
		'Correr Políticas Básicas Fase I
			puntos = 0
			semaforo = "Rojo"
			'Edad del cliente
			edadanio = CalcularEdad(Dia.SelectedItem.Value,Mes.SelectedItem.Value,Anio.SelectedItem.Value)
			'edadanio = CalcularEdad(06,05,1950)
			If edadanio < 18 or edadanio > 64 Then
				semaforo = "Amarillo"
			End If
			'antiguedad domicilio
			If Antdomicilio.SelectedItem.Value = "Menor que 1 Año" Then
				puntos = puntos + 0
			End If
			If Antdomicilio.SelectedItem.Value = "Entre 1 y 3 Años" Then
				puntos = puntos + 5
			End If
			If Antdomicilio.SelectedItem.Value = "Mas de 3 Años" Then
				puntos = puntos + 15
			End If
			'vivienda propia
			If propiasi.Checked = True Then
				puntos = puntos + 5
			Else
				puntos = puntos + 0
			End If
		'
		'Correr Políticas Básicas Fase II
			'Tipo de empleo
			If tipoempleo.SelectedItem.Value = "Independiente" Then
				puntos = puntos + 0
			End If
			If tipoempleo.SelectedItem.Value = "Empleado" Then
				puntos = puntos + 15
			End If
			'antiguedad laboral
			If antlaboral.SelectedItem.Value = "Menor que 1 Año" Then
				puntos = puntos + 0
			End If
			If antlaboral.SelectedItem.Value = "Entre 1 y 3 Años" Then
				puntos = puntos + 5
			End If
			If antlaboral.SelectedItem.Value = "Mas de 3 Años" Then
				puntos = puntos + 15
			End If
		'
		'VI Proceso BCScore
			'Creamos la cadena de conexion'
			Dim strConexion As String
			strConexion = ConfigurationManager.ConnectionStrings("dbMysql").ConnectionString
			
			'Creamos el objeto conexion para enlazar con el servidor de datos
			Dim oConnection As OdbcConnection = New OdbcConnection(strConexion)
			
			'Creamos la sentencia SQL que devuelva los datos deseados
			Dim strSQL As String
			If Session("ReferenciaBuro") <> "" Then
				strSQL = "SELECT ifnull(s.valor_score,'') as valor_score FROM consulta c left outer join score s on s.id_consulta = c.id WHERE c.referencia_buro = '" & Session("ReferenciaBuro") & "' "
			End If

			'Instanciamos el objeto Command
			Dim oDataAdapter As OdbcDataAdapter = New OdbcDataAdapter(strSQL, oConnection)
			Dim oDataSet As DataSet = New DataSet()
			oDataAdapter.Fill(oDataSet,"scoredato")

			If oDataSet.Tables("scoredato").Rows.Count <> 0 Then
				scoredvalor = oDataSet.Tables("scoredato").Rows(0).Item("valor_score")
				If scoredvalor < 430 Then
					puntos = puntos + 0
				End If
				If scoredvalor >= 430 and scoredvalor <= 600 Then
					puntos = puntos + 5
				End If
				If scoredvalor > 600 Then
					puntos = puntos + 25
				End If
			End If
		'
		'En caso que: Puntos 
			If puntos <= 50 Then
				semaforo = "Rojo"
			End If
			If puntos >= 51 and puntos <= 80  Then
				semaforo = "Amarillo"
			End If
			If puntos >= 81 Then
				semaforo = "Verde"
			End If
		'
		'ErrorMsg.Text = "PUNTOS: " & puntos & "SEMAFORO: " & semaforo
		puntosdato.Text = puntos
		semaforodato.Text = semaforo
	End Sub

End Class


