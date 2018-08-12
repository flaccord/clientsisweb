Imports System.Net.NetworkCredential
Imports System.Net
Imports System.IO
Imports referenciaws
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc

Partial Class solicitudcreditoPrest
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
            If Session("ComunidadUser") <> 1 Then
                Response.Write("<script language='JavaScript'>top.location.href='menu.aspx';</script>")
            End If
            '--

            Session("ReferenciaBuro") = ""

            Dim k As Integer
            For k = (CInt(Now().Year) - 100) To CInt(Now().Year) - 18
                Anio.Items.Add(k)
                Anioempleo.Items.Add(k)
            Next
            Anio.Items.Insert(0, New ListItem("", ""))
            Anioempleo.Items.Insert(0, New ListItem("", ""))
            For k = 1999 To Now.Year
                Anio.Items.Insert(Anio.Items.Count, New ListItem(k, k))
                Anioempleo.Items.Insert(Anioempleo.Items.Count, New ListItem(k, k))
            Next

            Dim identra As String
            identra = Request.QueryString("Ref")
            If identra <> "" And Not Page.IsPostBack Then
                ListaRegistroCliente()
            End If

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

    Protected Sub BuscarCP_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles BuscarCP.Click
        Try

            '-- Si no hay usuario logueado, que vaya directamente al loguin
            If Session("ActiveUser") = "" Then
                Response.Write("<script language='JavaScript'>top.location.href='LoginAcceso.aspx';</script>")
            End If
            If Session("PerfilUser") = "Admin" Then
                Response.Write("<script language='JavaScript'>top.location.href='menu.aspx';</script>")
            End If
            '--

            Dim CodigoP As String
            CodigoP = codpostal.Text
            If CodigoP <> "" Then
                Dim strConexionSQLSever As String
                strConexionSQLSever = ConfigurationManager.ConnectionStrings("dbclientsisweb").ConnectionString
                Using cn As New SqlConnection(strConexionSQLSever)
                    cn.Open()
                    Dim cmd As New SqlCommand()
                    Dim dReader As System.Data.SqlClient.SqlDataReader
                    cmd.CommandText = "select asenta from Catalogo_CP where codigo = '" & CodigoP & "' group by asenta"
                    cmd.Connection = cn
                    dReader = cmd.ExecuteReader()
                    colonia.DataSource = dReader
                    colonia.DataTextField = "asenta"
                    colonia.DataValueField = "asenta"
                    colonia.DataBind()
                    dReader.Close()
                    Dim dReader1 As System.Data.SqlClient.SqlDataReader
                    cmd.CommandText = "select mnpio from Catalogo_CP where codigo = '" & CodigoP & "' group by mnpio"
                    cmd.Connection = cn
                    dReader1 = cmd.ExecuteReader()
                    municipio.DataSource = dReader1
                    municipio.DataTextField = "mnpio"
                    municipio.DataValueField = "mnpio"
                    municipio.DataBind()
                    dReader1.Close()
                    Dim dReader2 As System.Data.SqlClient.SqlDataReader
                    cmd.CommandText = "select ciudad from Catalogo_CP where codigo = '" & CodigoP & "' group by ciudad"
                    cmd.Connection = cn
                    dReader2 = cmd.ExecuteReader()
                    ciudad.DataSource = dReader2
                    ciudad.DataTextField = "ciudad"
                    ciudad.DataValueField = "ciudad"
                    ciudad.DataBind()
                    dReader2.Close()
                    Dim dReader3 As System.Data.SqlClient.SqlDataReader
                    cmd.CommandText = "select codestado,estado from Catalogo_CP where codigo = '" & CodigoP & "' group by codestado,estado"
                    cmd.Connection = cn
                    dReader3 = cmd.ExecuteReader()
                    estado.DataSource = dReader3
                    estado.DataTextField = "estado"
                    estado.DataValueField = "codestado"
                    estado.DataBind()
                    dReader3.Close()

                    cn.Close()
                End Using
            End If

        Catch ex As Exception
            'MsgBox("Ha ocurrido un error para Conectarse al WebService!", MsgBoxStyle.Critical, "Advertencia")
        End Try
    End Sub

    Sub GuardarClienteClientsisweb(ByVal refburo As String)

        Dim TipoConsultaOpcion As String
        Dim TCreditoOpcion As String
        Dim TCHipoOpcion As String
        Dim TCAutoOpcion As String

        If tradicional.Checked = True Then
            TipoConsultaOpcion = "BC"
        Else
            TipoConsultaOpcion = "AU"
        End If

        If refburo = "" Then
            refburo = "********"
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
            'cmd.CommandText = "INSERT INTO registro_clientes (primernombre,segundonombre,apellidopaterno,apellidomaterno,fechanacimiento,referencia,rfc,calle,numexterior,numinterior,manzana,lote,colonia,municipio,ciudad,estado,codpostal,Antdomicilio,salario,tipoempleo,antlaboral,referenciaburo,tipoConsulta,cuentaTarjetaCredito,ultimosCuatroDigitosTarjetaCredito,creditoHipotecario,creditoAutomotriz,Viviendapropia,Puntos,Semaforo) VALUES('" & txtnombre.Text & "','" &  nombre1.Text & "','" &  apellidos.Text & "','" &  apellidos1.Text & "','" &  Mes.SelectedItem.Value & "/" & Dia.SelectedItem.Value & "/" & Anio.SelectedItem.Value & "','""','" &  rfc.Text & "','" &  calle.Text & "','" &  numexterior.Text & "','" &  numinterior.Text & "','" &  manzana.Text & "','" &  lote.Text & "','" &  colonia.Text & "','" &  municipio.Text & "','" &  ciudad.Text & "','" &  estado.Text & "','" &  codpostal.Text & "','" &  Antdomicilio.Text & "','""','" &  tipoempleo.Text & "','""','" &  refburo & "','" &  TipoConsultaOpcion & "','" &  TCreditoOpcion & "','" &  ultimosCuatroDigitosTarjetaCredito.Text & "','" &  TCHipoOpcion & "','" &  TCAutoOpcion & "','" &  Viviendapro & "','" &  puntosdato.Text & "','" &  semaforodato.Text & "')"
            'ErrorMsg.Text = "INSERT INTO registro_clientes (primernombre,segundonombre,apellidopaterno,apellidomaterno,sexo,fechanacimiento,rfc,telefonofijo,telefonocelular,email,calle,numexterior,numinterior,manzana,lote,colonia,municipio,ciudad,estado,codpostal,Antdomicilio,tipovivienda,tipoempleo,fechaingresolaboral,ingresomensual,gastomensual,referenciaburo,tipoConsulta,cuentaTarjetaCredito,ultimosCuatroDigitosTarjetaCredito,creditoHipotecario,creditoAutomotriz,Puntos,Semaforo,KeyUsuario) VALUES('" & txtnombre.Text & "','" &  nombre1.Text & "','" &  apellidos.Text & "','" &  apellidos1.Text & "','" &  sexo.Text & "','" &  Mes.SelectedItem.Value & "/" & Dia.SelectedItem.Value & "/" & Anio.SelectedItem.Value & "','" &  rfc.Text & "','" &  telfijo.Text & "','" &  telcelu.Text & "','" &  email.Text & "','" &  calle.Text & "','" &  numexterior.Text & "','" &  numinterior.Text & "','" &  manzana.Text & "','" &  lote.Text & "','" &  colonia.Text & "','" &  municipio.Text & "','" &  ciudad.Text & "','" &  estado.Text & "','" &  codpostal.Text & "','" &  Antdomicilio.Text & "','" &  tipovivienda.Text & "','" &  tipoempleo.Text & "','" &  Mesempleo.SelectedItem.Value & "/" & Diaempleo.SelectedItem.Value & "/" & Anioempleo.SelectedItem.Value & "','" &  ingmensual.Text & "','" &  gasmensual.Text & "','" &  refburo & "','" &  TipoConsultaOpcion & "','" &  TCreditoOpcion & "','" &  ultimosCuatroDigitosTarjetaCredito.Text & "','" &  TCHipoOpcion & "','" &  TCAutoOpcion & "','" &  puntosdato.Text & "','" &  semaforodato.Text & "','" &  Session("ActiveUser") & "')"
            cmd.CommandText = "INSERT INTO registro_clientes (primernombre,segundonombre,apellidopaterno,apellidomaterno,sexo,fechanacimiento,rfc,telefonofijo,telefonocelular,email,calle,numexterior,numinterior,manzana,lote,colonia,municipio,ciudad,estado,codpostal,Antdomicilio,tipovivienda,tipoempleo,fechaingresolaboral,ingresomensual,gastomensual,referenciaburo,tipoConsulta,cuentaTarjetaCredito,ultimosCuatroDigitosTarjetaCredito,creditoHipotecario,creditoAutomotriz,Puntos,Semaforo,KeyUsuario,nombreref1,nombreref2,nombreref3,nombreref4,relacion1,relacion2,relacion3,relacion4,hora1,hora2,hora3,hora4,cel1,cel2,cel3,cel4,fijo1,fijo2,fijo3,fijo4,errorburo,datosburo) VALUES('" & txtnombre.Text & "','" & nombre1.Text & "','" & apellidos.Text & "','" & apellidos1.Text & "','" & sexo.Text & "','" & Mes.SelectedItem.Value & "/" & Dia.SelectedItem.Value & "/" & Anio.SelectedItem.Value & "','" & rfc.Text & "','" & telfijo.Text & "','" & telcelu.Text & "','" & email.Text & "','" & calle.Text & "','" & numexterior.Text & "','" & numinterior.Text & "','" & manzana.Text & "','" & lote.Text & "','" & colonia.Text & "','" & municipio.Text & "','" & ciudad.Text & "','" & estado.Text & "','" & codpostal.Text & "','" & Antdomicilio.Text & "','" & tipovivienda.Text & "','" & tipoempleo.Text & "','" & Mesempleo.SelectedItem.Value & "/" & Diaempleo.SelectedItem.Value & "/" & Anioempleo.SelectedItem.Value & "','" & ingmensual.Text & "','" & gasmensual.Text & "','" & refburo & "','" & TipoConsultaOpcion & "','" & TCreditoOpcion & "','" & ultimosCuatroDigitosTarjetaCredito.Text & "','" & TCHipoOpcion & "','" & TCAutoOpcion & "','" & puntosdato.Text & "','" & semaforodato.Text & "','" & Session("ActiveUser") & "','" & nombreref1.Text & "','" & nombreref2.Text & "','" & nombreref3.Text & "','" & nombreref4.Text & "','" & relacion1.Text & "','" & relacion2.Text & "','" & relacion3.Text & "','" & relacion4.Text & "','" & hora1.Text & "','" & hora2.Text & "','" & hora3.Text & "','" & hora4.Text & "','" & cel1.Text & "','" & cel2.Text & "','" & cel3.Text & "','" & cel4.Text & "','" & fijo1.Text & "','" & fijo2.Text & "','" & fijo3.Text & "','" & fijo4.Text & "','" & errorburo.Text & "','" & datosburo.Text & "')"
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

        Dim validavacio As String
        validavacio = "0"
        ErrorMsg.Text = ""
        If colonia.Text = "" Then
            validavacio = "1"
            'Response.Write("<script language='JavaScript'>alert('Debe seleccionar una Colonia.');</script>")
            ErrorMsg.Text = "Debe seleccionar una Colonia."
        End If
        If municipio.Text = "" Then
            validavacio = "1"
            'Response.Write("<script language='JavaScript'>alert('Debe seleccionar un Municipio.');</script>")
            ErrorMsg.Text = ErrorMsg.Text & " Debe seleccionar un Municipio."
        End If
        If ciudad.Text = "" Then
            validavacio = "1"
            'Response.Write("<script language='JavaScript'>alert('Debe seleccionar una Ciudad.');</script>")
            ErrorMsg.Text = ErrorMsg.Text & " Debe seleccionar una Ciudad."
        End If
        If estado.Text = "" Then
            validavacio = "1"
            'Response.Write("<script language='JavaScript'>alert('Debe seleccionar un Estado.');</script>")
            ErrorMsg.Text = ErrorMsg.Text & " Debe seleccionar un Estado."
        End If
        If Antdomicilio.Text = "" Then
            validavacio = "1"
            'Response.Write("<script language='JavaScript'>alert('Debe seleccionar una Antiguedad de Domicilio.');</script>")
            ErrorMsg.Text = ErrorMsg.Text & " Debe seleccionar una Antiguedad de Domicilio."
        End If
        If tipovivienda.Text = "" Then
            validavacio = "1"
            'Response.Write("<script language='JavaScript'>alert('Debe seleccionar un Tipo de Vivienda.');</script>")
            ErrorMsg.Text = ErrorMsg.Text & " Debe seleccionar un Tipo de Vivienda."
        End If

        If validavacio = "0" Then
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
            oPuedePesar.referenciaCliente = ""
            oPuedePesar.rfc = rfc.Text
            oPuedePesar.segundoNombre = nombre1.Text
            oPuedePesar.tipoConsulta = TipoConsultaOpcion
            oPuedePesar.ultimosCuatroDigitosTarjetaCredito = ultimosCuatroDigitosTarjetaCredito.Text

            'Si devuelve falso es porque se inserto ese dato
            Dim oPuedePesarResponse As referenciaws.respuestaBuroCredito = jws.consultarBuroCredito(oPuedePesar)
            'If oPuedePesarResponse.error Then
            'ErrorMsg.Text = "ERROR: " & oPuedePesarResponse.mensaje 
            'mensajejava = TipoConsultaOpcion & " - " & ultimosCuatroDigitosTarjetaCredito.Text & " - " & TCreditoOpcion & " - " & TCHipoOpcion & " - " & TCAutoOpcion
            'Response.Write("<script language='JavaScript'>alert('" & mensajejava & "');</script>")
            'Else
            Session("ReferenciaBuro") = oPuedePesarResponse.referenciaBuroCredito
            If Session("ReferenciaBuro") = "" Then
                Session("ReferenciaBuro") = rfc.Text & "" & Format(Now, "hms")
            End If
            errorburo.Text = oPuedePesarResponse.mensaje
            datosburo.Text = "apellidoMaterno: " & oPuedePesar.apellidoMaterno & " - apellidoPaterno: " & oPuedePesar.apellidoPaterno & " - calle: " & oPuedePesar.calle & " - ciudad: " & oPuedePesar.ciudad & " - codigoPostal: " & oPuedePesar.codigoPostal & " - colonia: " & oPuedePesar.colonia & " - creditoAutomotriz: " & oPuedePesar.creditoAutomotriz & " - creditoHipotecario: " & oPuedePesar.creditoHipotecario & " - cuentaTarjetaCredito: " & oPuedePesar.cuentaTarjetaCredito & " - estado: " & oPuedePesar.estado & " - fechaNacimiento: " & oPuedePesar.fechaNacimiento & " - lote: " & oPuedePesar.lote & " - manzana: " & oPuedePesar.manzana & " - municipio: " & oPuedePesar.municipio & " - numeroExterior: " & oPuedePesar.numeroExterior & " - numeroInterior: " & oPuedePesar.numeroInterior & " - primerNombre: " & oPuedePesar.primerNombre & " - referenciaCliente: " & oPuedePesar.referenciaCliente & " - rfc: " & oPuedePesar.rfc & " - segundoNombre: " & oPuedePesar.segundoNombre & " - tipoConsulta: " & oPuedePesar.tipoConsulta & " - ultimosCuatroDigitosTarjetaCredito: " & oPuedePesar.ultimosCuatroDigitosTarjetaCredito
            'Genera los campos Puntos y Semaforo
            SemaforoPuntos()
            'Guardar la información del formulario en la db ClientsisWeb
            GuardarClienteClientsisweb(Session("ReferenciaBuro"))
            'Response.Write("<script language='JavaScript'>alert('El cliente ha sido registrado Correctamente! Referencia No. " & oPuedePesarResponse.referenciaBuroCredito & "');</script>")
            Response.Redirect("capturas.aspx")
            'ErrorMsg.Text = "El cliente ha sido registrado Correctamente! Referencia No. " & oPuedePesarResponse.referenciaBuroCredito
            'ErrorMsg.Text = "- " & oPuedePesarResponse.error & "- " & oPuedePesarResponse.mensaje & "- " & oPuedePesarResponse.errorSpecified & "- " & oPuedePesarResponse.fechaConsulta & "- " & oPuedePesarResponse.nombreCliente & "- " & oPuedePesarResponse.referenciaBuroCredito
            'End If
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
                If (DiaNacimiento = DiaActual And MesNacimiento = MesActual) Then
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
        Dim puntostemp As Integer
        Dim puntosmop As Integer
        Dim nummop As Integer
        Dim scoredvalor As Integer
        Dim edadanio As String
        Dim mopentra As String
        Dim hoy As Date = Now
        Dim fechaingreso As Date
        Dim diasingreso As Integer
        Dim i As Integer
        Dim PTI As Integer
        Dim DTI As Integer
        Dim cadenapuntos As String
        Dim Refburohay As String

        Refburohay = Session("ReferenciaBuro")
        If Refburohay = "" Then
            Refburohay = "111111111111"
        End If

        cadenapuntos = "'" & Session("ReferenciaBuro") & "',"

        'Correr Políticas Básicas Fase I
        puntos = 0
        puntostemp = 0
        semaforo = "Rojo"
        'Edad del cliente
        edadanio = CalcularEdad(Dia.SelectedItem.Value, Mes.SelectedItem.Value, Anio.SelectedItem.Value)
        'edadanio = CalcularEdad(06,05,1950)
        If edadanio < 18 Or edadanio > 64 Then
            semaforo = "Amarillo"
        End If
        If edadanio < 25 And edadanio > 18 Then
            puntos = puntos + 5
            puntostemp = 5
        End If
        If edadanio < 64 And edadanio > 40 Then
            puntos = puntos + 10
            puntostemp = 10
        End If
        If edadanio < 41 And edadanio > 24 Then
            puntos = puntos + 15
            puntostemp = 15
        End If
        cadenapuntos = cadenapuntos & "" & puntostemp & ","
        puntostemp = 0
        'antiguedad domicilio
        If Antdomicilio.SelectedItem.Value = "Menor que 2 Años" Then
            puntos = puntos + 5
            puntostemp = 5
        End If
        If Antdomicilio.SelectedItem.Value = "Entre 2 y 4 Años" Then
            puntos = puntos + 10
            puntostemp = 10
        End If
        If Antdomicilio.SelectedItem.Value = "Mas de 4 Años" Then
            puntos = puntos + 15
            puntostemp = 15
        End If
        cadenapuntos = cadenapuntos & "" & puntostemp & ","
        puntostemp = 0
        'vivienda propia
        If tipovivienda.SelectedItem.Value = "Propia" Then
            puntos = puntos + 10
            puntostemp = 10
        Else
            puntos = puntos + 5
            puntostemp = 5
        End If
        cadenapuntos = cadenapuntos & "" & puntostemp & ","
        puntostemp = 0
        '
        'Correr Políticas Básicas Fase II
        'Tipo de empleo
        If tipoempleo.SelectedItem.Value = "Independiente Informal" Then
            puntos = puntos - 5
            puntostemp = -5
        End If
        If tipoempleo.SelectedItem.Value = "Independiente Formal" Then
            puntos = puntos + 5
            puntostemp = 5
        End If
        If tipoempleo.SelectedItem.Value = "Empleado" Then
            puntos = puntos + 15
            puntostemp = 15
        End If
        cadenapuntos = cadenapuntos & "" & puntostemp & ","
        puntostemp = 0
        'antiguedad laboral

        fechaingreso = Mesempleo.SelectedItem.Value & "/" & Diaempleo.SelectedItem.Value & "/" & Anioempleo.SelectedItem.Value
        diasingreso = DateDiff(DateInterval.Day, fechaingreso, hoy)
        If diasingreso < 360 Then
            puntos = puntos + 0
            puntostemp = 0
        End If
        If diasingreso < 1081 And diasingreso > 359 Then
            puntos = puntos + 10
            puntostemp = 10
        End If
        If diasingreso > 1080 Then
            puntos = puntos + 15
            puntostemp = 15
        End If
        cadenapuntos = cadenapuntos & "" & puntostemp & ","
        puntostemp = 0
        '
        'IV) Proceso Nivel Endeudamiento
        If ingmensual.Text > 0 Then
            DTI = (gasmensual.Text / ingmensual.Text) * 100
            If DTI < 30 Then
                puntos = puntos + 15
                puntostemp = 15
            End If
        End If
        cadenapuntos = cadenapuntos & "" & puntostemp & ","
        puntostemp = 0
        '
        'V)Proceso Histórico de pagos
        'Creamos la cadena de conexion'
        Dim strConexion As String
        strConexion = ConfigurationManager.ConnectionStrings("dbMysql").ConnectionString

        'Creamos el objeto conexion para enlazar con el servidor de datos
        Dim oConnection As OdbcConnection = New OdbcConnection(strConexion)

        'Creamos la sentencia SQL que devuelva los datos deseados
        Dim strSQL As String
        If Refburohay <> "" Then
            strSQL = "SELECT c.mop as mop FROM cuenta_credito c INNER JOIN  consulta con on con.Id = c.id_consulta where con.referencia_buro = '" & Refburohay & "'"
        End If

        'Instanciamos el objeto Command
        Dim oDataAdapter1 As OdbcDataAdapter = New OdbcDataAdapter(strSQL, oConnection)
        Dim oDataSet1 As DataSet = New DataSet()
        oDataAdapter1.Fill(oDataSet1, "mopdato")

        puntosmop = 0
        nummop = 0
        If oDataSet1.Tables("mopdato").Rows.Count <> 0 Then
            For i = 0 To oDataSet1.Tables("mopdato").Rows.Count - 1
                mopentra = oDataSet1.Tables("mopdato").Rows(i).Item("mop")
                If mopentra = "01" Then
                    puntosmop = puntosmop + 10
                    nummop = nummop + 1
                End If
                If ((mopentra = "02") Or (mopentra = "03") Or (mopentra = "04")) Then
                    puntosmop = puntosmop + 5
                    nummop = nummop + 1
                End If
                If ((mopentra = "05") Or (mopentra = "06") Or (mopentra = "07")) Then
                    puntosmop = puntosmop + 0
                    nummop = nummop + 1
                End If
                If mopentra = "96" Then
                    puntosmop = puntosmop - 5
                    nummop = nummop + 1
                End If
                If ((mopentra = "97") Or (mopentra = "99")) Then
                    puntosmop = puntosmop - 10
                    nummop = nummop + 1
                End If
            Next
            If puntosmop > 0 Then
                puntos = puntos + (puntosmop / nummop)
                puntostemp = (puntosmop / nummop)
            End If
        End If
        cadenapuntos = cadenapuntos & "" & puntostemp & ","
        puntostemp = 0
        '
        'VI Proceso BCScore
        'Creamos la sentencia SQL que devuelva los datos deseados
        If Refburohay <> "" Then
            strSQL = "SELECT ifnull(s.valor_score,'') as valor_score FROM consulta c left outer join score s on s.id_consulta = c.id WHERE c.referencia_buro = '" & Refburohay & "' "
        End If

        'Instanciamos el objeto Command
        Dim oDataAdapter As OdbcDataAdapter = New OdbcDataAdapter(strSQL, oConnection)
        Dim oDataSet As DataSet = New DataSet()
        oDataAdapter.Fill(oDataSet, "scoredato")

        If oDataSet.Tables("scoredato").Rows.Count <> 0 Then
            scoredvalor = oDataSet.Tables("scoredato").Rows(0).Item("valor_score")
            If scoredvalor < 550 Then
                puntos = puntos + 0
                puntostemp = 0
            End If
            If scoredvalor >= 550 And scoredvalor <= 650 Then
                puntos = puntos + 10
                puntostemp = 10
            End If
            If scoredvalor > 650 Then
                puntos = puntos + 20
                puntostemp = 20
            End If
        End If
        cadenapuntos = cadenapuntos & "" & puntostemp & ""
        puntostemp = 0
        '
        'En caso que: Puntos 
        If puntos <= 50 Then
            semaforo = "Rojo"
        End If
        If puntos >= 51 And puntos <= 80 Then
            semaforo = "Amarillo"
        End If
        If puntos >= 81 Then
            semaforo = "Verde"
        End If
        If errorburo.Text <> "" Then
            semaforo = "Azul"
        End If
        '
        'ErrorMsg.Text = "PUNTOS: " & puntos & "SEMAFORO: " & semaforo
        puntosdato.Text = puntos
        semaforodato.Text = semaforo

        'Creamos la cadena de conexion'
        Dim strConexionSQLSever1 As String
        strConexionSQLSever1 = ConfigurationManager.ConnectionStrings("dbclientsisweb").ConnectionString
        Using cn1 As New SqlConnection(strConexionSQLSever1)
            cn1.Open()
            Dim cmd1 As New SqlCommand()
            cmd1.CommandText = "INSERT INTO registro_clientes_puntos (Referenciaburo,Edad,Antiguedad_domicilio,Vivienda,Tipo_Empleo,Antiguedad_Laboral,Nivel_Endeudamiento,Creditos_MOP,Score) VALUES(" & cadenapuntos & ")"
            cmd1.Connection = cn1
            cmd1.ExecuteNonQuery()
            cn1.Close()
        End Using
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

    Private Sub ListaRegistroCliente()
        Dim _pys As String
        Dim _pysdatos As DataSet = New DataSet
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        _pys = "SELECT primernombre,segundonombre,apellidopaterno,apellidomaterno,sexo,rfc,telefonofijo,telefonocelular, " & _
               "email,calle,numexterior,numinterior,manzana,lote,colonia,municipio,ciudad,estado,codpostal,Antdomicilio,tipovivienda, " & _
            "tipoempleo,ingresomensual,gastomensual,ultimosCuatroDigitosTarjetaCredito,nombreref1,nombreref2,nombreref3,nombreref4, " & _
            "relacion1,relacion2,relacion3,relacion4,hora1,hora2,hora3,hora4,cel1,cel2,cel3,cel4,fijo1,fijo2,fijo3,fijo4, " & _
            "fechanacimiento,fechaingresolaboral,tipoConsulta " & _
            "FROM registro_clientes WHERE referenciaburo = '" & Request.QueryString("Ref") & "'"
        _pysdatos = objConexion.EjecutarConsultaSQL(_pys)
        objConexion.DesConectar()
        objConexion = Nothing
        If _pysdatos.Tables(0).Rows.Count > 0 Then
            txtnombre.Text = _pysdatos.Tables(0).Rows(0).Item("primernombre")
            nombre1.Text = _pysdatos.Tables(0).Rows(0).Item("segundonombre")
            apellidos.Text = _pysdatos.Tables(0).Rows(0).Item("apellidopaterno")
            apellidos1.Text = _pysdatos.Tables(0).Rows(0).Item("apellidomaterno")
            sexo.Text = _pysdatos.Tables(0).Rows(0).Item("sexo")
            rfc.Text = _pysdatos.Tables(0).Rows(0).Item("rfc")
            telfijo.Text = _pysdatos.Tables(0).Rows(0).Item("telefonofijo")
            telcelu.Text = _pysdatos.Tables(0).Rows(0).Item("telefonocelular")
            email.Text = _pysdatos.Tables(0).Rows(0).Item("email")
            calle.Text = _pysdatos.Tables(0).Rows(0).Item("calle")
            numexterior.Text = _pysdatos.Tables(0).Rows(0).Item("numexterior")
            numinterior.Text = _pysdatos.Tables(0).Rows(0).Item("numinterior")
            manzana.Text = _pysdatos.Tables(0).Rows(0).Item("manzana")
            lote.Text = _pysdatos.Tables(0).Rows(0).Item("lote")
            colonia.Text = _pysdatos.Tables(0).Rows(0).Item("colonia")
            municipio.Text = _pysdatos.Tables(0).Rows(0).Item("municipio")
            ciudad.Text = _pysdatos.Tables(0).Rows(0).Item("ciudad")
            estado.Text = _pysdatos.Tables(0).Rows(0).Item("estado")
            codpostal.Text = _pysdatos.Tables(0).Rows(0).Item("codpostal")
            Antdomicilio.Text = _pysdatos.Tables(0).Rows(0).Item("Antdomicilio")
            tipovivienda.Text = _pysdatos.Tables(0).Rows(0).Item("tipovivienda")
            tipoempleo.Text = _pysdatos.Tables(0).Rows(0).Item("tipoempleo")
            ingmensual.Text = _pysdatos.Tables(0).Rows(0).Item("ingresomensual")
            gasmensual.Text = _pysdatos.Tables(0).Rows(0).Item("gastomensual")
            ultimosCuatroDigitosTarjetaCredito.Text = _pysdatos.Tables(0).Rows(0).Item("ultimosCuatroDigitosTarjetaCredito")
            nombreref1.Text = _pysdatos.Tables(0).Rows(0).Item("nombreref1")
            nombreref2.Text = _pysdatos.Tables(0).Rows(0).Item("nombreref2")
            nombreref3.Text = _pysdatos.Tables(0).Rows(0).Item("nombreref3")
            nombreref4.Text = _pysdatos.Tables(0).Rows(0).Item("nombreref4")
            relacion1.Text = _pysdatos.Tables(0).Rows(0).Item("relacion1")
            relacion2.Text = _pysdatos.Tables(0).Rows(0).Item("relacion2")
            relacion3.Text = _pysdatos.Tables(0).Rows(0).Item("relacion3")
            relacion4.Text = _pysdatos.Tables(0).Rows(0).Item("relacion4")
            hora1.Text = _pysdatos.Tables(0).Rows(0).Item("hora1")
            hora2.Text = _pysdatos.Tables(0).Rows(0).Item("hora2")
            hora3.Text = _pysdatos.Tables(0).Rows(0).Item("hora3")
            hora4.Text = _pysdatos.Tables(0).Rows(0).Item("hora4")
            cel1.Text = _pysdatos.Tables(0).Rows(0).Item("cel1")
            cel2.Text = _pysdatos.Tables(0).Rows(0).Item("cel2")
            cel3.Text = _pysdatos.Tables(0).Rows(0).Item("cel3")
            cel4.Text = _pysdatos.Tables(0).Rows(0).Item("cel4")
            fijo1.Text = _pysdatos.Tables(0).Rows(0).Item("fijo1")
            fijo2.Text = _pysdatos.Tables(0).Rows(0).Item("fijo2")
            fijo3.Text = _pysdatos.Tables(0).Rows(0).Item("fijo3")
            fijo4.Text = _pysdatos.Tables(0).Rows(0).Item("fijo4")

            Dim fchAhora As Date
            fchAhora = _pysdatos.Tables(0).Rows(0).Item("fechanacimiento")
            Anio.Text = Year(fchAhora)
            If Month(fchAhora) < 10 Then
                Mes.Text = "0" & Month(fchAhora)
            Else
                Mes.Text = Month(fchAhora)
            End If
            If Day(fchAhora) < 10 Then
                Dia.Text = "0" & Day(fchAhora)
            Else
                Dia.Text = Day(fchAhora)
            End If

            fchAhora = _pysdatos.Tables(0).Rows(0).Item("fechaingresolaboral")
            Anioempleo.Text = Year(fchAhora)
            If Month(fchAhora) < 10 Then
                Mesempleo.Text = "0" & Month(fchAhora)
            Else
                Mesempleo.Text = Month(fchAhora)
            End If
            If Day(fchAhora) < 10 Then
                Diaempleo.Text = "0" & Day(fchAhora)
            Else
                Diaempleo.Text = Day(fchAhora)
            End If

        End If
    End Sub

End Class


