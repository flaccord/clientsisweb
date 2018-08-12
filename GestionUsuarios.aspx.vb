Imports System.Net.NetworkCredential
Imports System.Net
Imports System.IO
Imports referenciaws
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc

Partial Class GestionUsuarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            '-- Si no hay usuario logueado, que vaya directamente al loguin
            If Session("ActiveUser") = "" Then
                Response.Write("<script language='JavaScript'>top.location.href='LoginAcceso.aspx';</script>")
            End If
            '--
			If Session("PerfilUser") <> "Admin" Then
				Response.Write("<script language='JavaScript'>top.location.href='menu.aspx';</script>")
			End If

            If Not IsPostBack Then
                Dim k As Integer
                For k = (CInt(Now().Year) - 100) To CInt(Now().Year) - 18
                    Anio.Items.Add(k)
                Next
                Anio.Items.Insert(0, New ListItem("", ""))
                '-- Emergency Change HN
                For k = 2013 To Now.Year
                    Anio.Items.Insert(Anio.Items.Count, New ListItem(k, k))
                Next

                LLenaPerfilesUsuarios()
                ddlPerfil.Items.Insert(0, New ListItem("--- Seleccione ---", ""))
	
                LLenaComunidadesUsuarios()
                ddlComunidad.Items.Insert(0, New ListItem("--- Seleccione ---", ""))
	
				
            End If

            LLenaListaUsuarios()
			

        Catch ex As Exception

        End Try
    End Sub

    Private Sub LLenaPerfilesUsuarios()
        Dim objPerfil As Perfil
        Dim dsPerfiles As DataSet
        Try
            objPerfil = New Perfil()
            dsPerfiles = objPerfil.ObtieneListadoPerfiles()
            ddlPerfil.DataSource = dsPerfiles.Tables(0).DefaultView
            ddlPerfil.DataValueField = "KeyPerfil"
            ddlPerfil.DataTextField = "DescPerfil"
            ddlPerfil.DataBind()
        Catch ex As Exception

        End Try
    End Sub

	Private Sub LLenaComunidadesUsuarios()
        Dim objComunidad As Comunidad
        Dim dsComunidades As DataSet
        Try
            objComunidad = New Comunidad()
            dsComunidades = objComunidad.ObtieneListadoComunidades()
            ddlComunidad.DataSource = dsComunidades.Tables(0).DefaultView
            ddlComunidad.DataValueField = "IdComunidad"
            ddlComunidad.DataTextField = "Comunidad"
            ddlComunidad.DataBind()
        Catch ex As Exception

        End Try
    End Sub

	
    Private Sub LLenaListaUsuarios()
        Dim objUsuario As Usuario
        Dim dsUsuarios As DataSet = New DataSet
        Try
            objUsuario = New Usuario
            dsUsuarios = objUsuario.ListaUsuarios()
            GridView1.DataSource = dsUsuarios.Tables(0).DefaultView
            GridView1.DataBind()
        Catch ex As Exception
            ErrorMsg.Text = ex.Message & " --> " & ex.StackTrace
        End Try
    End Sub

    Protected Sub btninsertdatos_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btninsertdatos.Click
        Dim _user As Usuario
        Dim message As String
        Dim sb As StringBuilder
        Try
            _user = New Usuario()
            With _user
                .KeyUsuario = txtUsuario.Text.ToUpper
                .PrimerNombre = txtPrimerNombre.Text.ToUpper
                .SegundoNombre = txtSegundoNombre.Text.ToUpper
                .PrimerApellido = txtPrimerApellido.Text.ToUpper
                .SegundoApellido = txtSegundoApellido.Text.ToUpper
                .FechaNacimiento = CDate(Mes.SelectedValue + "/" + Dia.SelectedValue + "/" + Anio.SelectedValue)
                .RFC = rfc.Text.ToUpper
                .Perfil = ddlPerfil.SelectedValue
                .Comunidad = ddlComunidad.SelectedValue
                .Activo = chkActivo.Checked
                .Password = txtPassword.Text
                .NIP = CInt(txtNIP.Text)

                If .ExisteUsuario Then
                    .ActualizarUsuario()
                    message = "Se ha actualizado correctamente el registro."
                Else
                    .InsertaUsuario()
                    message = "Se ha insertado correctamente el registro."
                End If

            End With

            sb = New System.Text.StringBuilder()
            sb.Append("<script type = 'text/javascript'>")
            sb.Append("alert('")
            sb.Append(message)
            sb.Append("');")
            sb.Append("</script>")
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "confirmacion", sb.ToString())

            LimpiarForm()

            LLenaListaUsuarios()

        Catch ex As Exception
            ErrorMsg.Text = ex.Message & " --> " & ex.StackTrace
        End Try
    End Sub

    Private Sub LimpiarForm()
        txtPrimerNombre.Text = ""
        txtSegundoNombre.Text = ""
        txtPrimerApellido.Text = ""
        txtSegundoApellido.Text = ""
        Dia.SelectedIndex = 0
        Mes.SelectedIndex = 0
        Anio.SelectedIndex = 0
        rfc.Text = ""
        txtUsuario.Text = ""
        ddlPerfil.SelectedIndex = 0
        ddlComunidad.SelectedIndex = 0
        txtPassword.Text = ""
        txtNIP.Text = ""
        chkActivo.Checked = False
    End Sub

    Sub GuardarClienteClientsisweb(ByVal refburo As String)

        ''Creamos la cadena de conexion'
        'Dim strConexionSQLSever As String
        'strConexionSQLSever = ConfigurationManager.ConnectionStrings("dbclientsisweb").ConnectionString
        'Using cn As New SqlConnection(strConexionSQLSever)
        '    cn.Open()
        '    Dim cmd As New SqlCommand()

        '    'Dim ejemplo As String
        '    'ejemplo = "INSERT INTO registro_clientes (primernombre,segundonombre,apellidopaterno,apellidomaterno,fechanacimiento,referencia,rfc,calle,numexterior,numinterior,manzana,lote,colonia,municipio,ciudad,estado,codpostal,Antdomicilio,salario,tipoempleo,antlaboral) VALUES('" & txtnombre.Text & "','" &  nombre1.Text & "','" &  apellidos.Text & "','" &  apellidos1.Text & "','" &  Dia.SelectedItem.Value & "/" & Mes.SelectedItem.Value & "/" & Anio.SelectedItem.Value & "','" &  referencia.Text & "','" &  rfc.Text & "','" &  calle.Text & "','" &  numexterior.Text & "','" &  numinterior.Text & "','" &  manzana.Text & "','" &  lote.Text & "','" &  colonia.Text & "','" &  municipio.Text & "','" &  ciudad.Text & "','" &  estado.Text & "','" &  codpostal.Text & "','" &  Antdomicilio.Text & "','" &  salario.Text & "','" &  tipoempleo.Text & "','" &  antlaboral.Text & "')"
        '    'ErrorMsg.Text = ejemplo

        '    cmd.CommandText = "INSERT INTO registro_clientes (primernombre,segundonombre,apellidopaterno,apellidomaterno,fechanacimiento,referencia,rfc,calle,numexterior,numinterior,manzana,lote,colonia,municipio,ciudad,estado,codpostal,Antdomicilio,salario,tipoempleo,antlaboral,referenciaburo) VALUES('" & txtnombre.Text & "','" & nombre1.Text & "','" & apellidos.Text & "','" & apellidos1.Text & "','" & Dia.SelectedItem.Value & "/" & Mes.SelectedItem.Value & "/" & Anio.SelectedItem.Value & "','" & referencia.Text & "','" & rfc.Text & "','" & calle.Text & "','" & numexterior.Text & "','" & numinterior.Text & "','" & manzana.Text & "','" & lote.Text & "','" & colonia.Text & "','" & municipio.Text & "','" & ciudad.Text & "','" & estado.Text & "','" & codpostal.Text & "','" & Antdomicilio.Text & "','" & salario.Text & "','" & tipoempleo.Text & "','" & antlaboral.Text & "','" & refburo & "')"
        '    cmd.Connection = cn
        '    cmd.ExecuteNonQuery()
        '    cn.Close()
        'End Using

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Dim _user As Usuario = New Usuario()
        Dim _userDetail As Usuario = New Usuario()
        Try
            _user.KeyUsuario = GridView1.SelectedRow.Cells(1).Text
            _userDetail = _user.ObtieneDatosUsuario()
            DespliegaDetalle(_userDetail)
        Catch ex As Exception
            ErrorMsg.Text = ex.Message & " --> " & ex.StackTrace
        End Try
    End Sub

    Private Sub DespliegaDetalle(ByVal _obj As Usuario)
        Try
            txtPrimerNombre.Text = _obj.PrimerNombre
            txtSegundoNombre.Text = _obj.SegundoNombre
            txtPrimerApellido.Text = _obj.PrimerApellido
            txtSegundoApellido.Text = _obj.SegundoApellido
            Dia.SelectedValue = IIf(_obj.FechaNacimiento.Day().ToString.Length = 1, "0" & _obj.FechaNacimiento.Day().ToString, _obj.FechaNacimiento.Day().ToString)
            Mes.SelectedValue = IIf(_obj.FechaNacimiento.Month().ToString.Length = 1, "0" & _obj.FechaNacimiento.Month().ToString, _obj.FechaNacimiento.Month().ToString)
            Anio.SelectedValue = _obj.FechaNacimiento.Year()
            rfc.Text = _obj.RFC
            txtUsuario.Text = _obj.KeyUsuario
            ddlPerfil.SelectedValue = _obj.Perfil
            ddlComunidad.SelectedValue = _obj.Comunidad
            chkActivo.Checked = _obj.Activo
            txtPassword.Text = _obj.Password
            txtNIP.Text = _obj.NIP.ToString()
        Catch ex As Exception
            ErrorMsg.Text = ex.Message & " --> " & ex.StackTrace
        End Try
    End Sub
End Class


