Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc

Public Class Usuario
    Dim PrimerNombreValue, SegundoNombreValue, PrimerApellidoValue, SegundoApellidoValue, RFCValue, PerfilValue, NomPerfilValue, ComunidadValue, NomComunidadValue, PasswordValue, _
    KeyUsuarioValue As String
    Dim FechaNacimientoValue As Date
    Dim NIPValue As Integer
    Dim ActivoValue As Boolean

#Region "Properties"
    Property PrimerNombre() As String
        Get
            Return PrimerNombreValue
        End Get
        Set(ByVal value As String)
            PrimerNombreValue = value
        End Set
    End Property

    Property SegundoNombre() As String
        Get
            Return SegundoNombreValue
        End Get
        Set(ByVal value As String)
            SegundoNombreValue = value
        End Set
    End Property

    Property PrimerApellido() As String
        Get
            Return PrimerApellidoValue
        End Get
        Set(ByVal value As String)
            PrimerApellidoValue = value
        End Set
    End Property

    Property SegundoApellido() As String
        Get
            Return SegundoApellidoValue
        End Get
        Set(ByVal value As String)
            SegundoApellidoValue = value
        End Set
    End Property

    Property FechaNacimiento() As Date
        Get
            Return FechaNacimientoValue
        End Get
        Set(ByVal value As Date)
            FechaNacimientoValue = value
        End Set
    End Property

    Property RFC() As String
        Get
            Return RFCValue
        End Get
        Set(ByVal value As String)
            RFCValue = value
        End Set
    End Property

    Property Perfil() As String
        Get
            Return PerfilValue
        End Get
        Set(ByVal value As String)
            PerfilValue = value
        End Set
    End Property
	
	Property NomPerfil() As String
        Get
            Return NomPerfilValue
        End Get
        Set(ByVal value As String)
            NomPerfilValue = value
        End Set
    End Property

	Property Comunidad() As String
        Get
            Return ComunidadValue
        End Get
        Set(ByVal value As String)
            ComunidadValue = value
        End Set
    End Property
	
	Property NomComunidad() As String
        Get
            Return NomComunidadValue
        End Get
        Set(ByVal value As String)
            NomComunidadValue = value
        End Set
    End Property

    Property Activo() As Boolean
        Get
            Return ActivoValue
        End Get
        Set(ByVal value As Boolean)
            ActivoValue = value
        End Set
    End Property

    Property Password() As String
        Get
            Return PasswordValue
        End Get
        Set(ByVal value As String)
            PasswordValue = value
        End Set
    End Property

    Property NIP() As Integer
        Get
            Return NIPValue
        End Get
        Set(ByVal value As Integer)
            NIPValue = value
        End Set
    End Property

    Property KeyUsuario() As String
        Get
            Return KeyUsuarioValue
        End Get
        Set(ByVal value As String)
            KeyUsuarioValue = value
        End Set
    End Property
#End Region

    ''' <summary>
    ''' Inserta un usuario en la BD
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub InsertaUsuario()
        Dim _cmd, fields As String
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        fields = "KeyUsuario, PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, FechaNacimiento, RFC, KeyPerfil, IdComunidad, Activo, Password, NIP"
        _cmd = "Insert Into Usuarios_Sistema (" & fields & ") Values ('" & KeyUsuarioValue & "','" & PrimerNombreValue & "','" & SegundoNombreValue & "','" & PrimerApellidoValue & "'," & _
                "'" & SegundoApellidoValue & "','" & FechaNacimientoValue & "','" & RFCValue & "','" & PerfilValue & "','" & ComunidadValue & "','" & ActivoValue & "'," & _
                "'" & PasswordValue & "','" & NIPValue & "')"
        objConexion.EjecutarComandoSQL(_cmd)
        objConexion.DesConectar()
        objConexion = Nothing
    End Sub

    ''' <summary>
    ''' Lista todos los usuarios del sistema sin ninguna restricción
    ''' </summary>
    ''' <returns>DataSet con los principales campos a mostrar en el datagrid</returns>
    ''' <remarks></remarks>
    Public Function ListaUsuarios() As DataSet
        Dim _cmd As String
        Dim _ds As DataSet = New DataSet
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        _cmd = "Select KeyUsuario, PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido, RFC, DescPerfil as 'Perfil', Activo, Comunidad_Usuarios.Comunidad " & _
                "From Usuarios_Sistema Inner Join Perfiles_Usuarios On Usuarios_Sistema.KeyPerfil = Perfiles_Usuarios.KeyPerfil Inner Join Comunidad_Usuarios On Usuarios_Sistema.IdComunidad = Comunidad_Usuarios.IdComunidad"
        _ds = objConexion.EjecutarConsultaSQL(_cmd)
        objConexion.DesConectar()
        objConexion = Nothing
        Return _ds
    End Function

    ''' <summary>
    ''' Activa o Inactiva un usuario en el sistema dependiendo del valor de la propiedad "Activo" en la instancia de la clase
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub ActivaUsuario()
        Dim _cmd As String
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        _cmd = "Update Usuarios_Sistema Set Activo = '" & ActivoValue & "' Where KeyUsuario = '" & KeyUsuarioValue & "'"
        objConexion.EjecutarComandoSQL(_cmd)
        objConexion.DesConectar()
        objConexion = Nothing
    End Sub

    ''' <summary>
    ''' Valida si la combinación Usuario/Password es correcta con los registros del sistema
    ''' </summary>
    ''' <returns>True/False</returns>
    ''' <remarks></remarks>
    Public Function ValidaUserPassword() As Boolean
        Dim _cmd As String
        Dim _ds As DataSet = New DataSet
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        _cmd = "Select count(*) From Usuarios_Sistema Where KeyUsuario = '" & KeyUsuarioValue & "' And Password = '" & PasswordValue & "'"
        _ds = objConexion.EjecutarConsultaSQL(_cmd)
        objConexion.DesConectar()
        objConexion = Nothing

        If CInt(_ds.Tables(0).Rows(0).Item(0)) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function

    ''' <summary>
    ''' Devuelve si el usuario está Activo o no en Sistema
    ''' </summary>
    ''' <returns>True/False</returns>
    ''' <remarks></remarks>
    Public Function UsuarioIsActivo() As Boolean
        Dim _cmd As String
        Dim _ds As DataSet = New DataSet
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        _cmd = "Select Activo From Usuarios_Sistema Where KeyUsuario = '" & KeyUsuarioValue & "'"
        _ds = objConexion.EjecutarConsultaSQL(_cmd)
        objConexion.DesConectar()
        objConexion = Nothing

        If CInt(_ds.Tables(0).Rows.Count) > 0 Then
            If CBool(_ds.Tables(0).Rows(0).Item(0)) Then
                Return True
            Else
                Return False
            End If
        Else
            Return False
        End If
    End Function

    ''' <summary>
    ''' Retorna el nombre corto de un usuario en sistema dado su KeyUsuario
    ''' </summary>
    ''' <returns>String: Primer Nombre Primer Apellido</returns>
    ''' <remarks></remarks>
    Public Function GetShortUserName() As String
        Dim _cmd As String
        Dim _ds As DataSet = New DataSet
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        _cmd = "Select PrimerNombre, PrimerApellido From Usuarios_Sistema Where KeyUsuario = '" & KeyUsuarioValue & "'"
        _ds = objConexion.EjecutarConsultaSQL(_cmd)
        objConexion.DesConectar()
        objConexion = Nothing

        If _ds.Tables(0).Rows.Count > 0 Then
            Return _ds.Tables(0).Rows(0).Item("PrimerNombre") & " " & _ds.Tables(0).Rows(0).Item("PrimerApellido")
        Else
            Return ""
        End If
    End Function

    ''' <summary>
    ''' Obtiene toda la información de un usuario dado un KeyUsuario
    ''' </summary>
    ''' <returns>Objeto de la clase Usuario con todos los datos del registro</returns>
    ''' <remarks></remarks>
    Public Function ObtieneDatosUsuario() As Usuario
        Dim _cmd As String
        Dim _ds As DataSet = New DataSet
		Dim _ds1 As DataSet = New DataSet
		Dim _ds2 As DataSet = New DataSet
        Dim _user As Usuario = New Usuario()
        Dim objConexion As New ConexionBD()
		Dim objConexion1 As New ConexionBD()
		Dim objConexion2 As New ConexionBD()
        objConexion.Conectar()
        _cmd = "Select * From Usuarios_Sistema Where KeyUsuario = '" & KeyUsuarioValue & "' "
        _ds = objConexion.EjecutarConsultaSQL(_cmd)
        objConexion.DesConectar()
        objConexion = Nothing

        If _ds.Tables(0).Rows.Count > 0 Then
            With _user
                .PrimerNombre = _ds.Tables(0).Rows(0).Item("PrimerNombre")
                .SegundoNombre = _ds.Tables(0).Rows(0).Item("SegundoNombre")
                .PrimerApellido = _ds.Tables(0).Rows(0).Item("PrimerApellido")
                .SegundoApellido = _ds.Tables(0).Rows(0).Item("SegundoApellido")
                .FechaNacimiento = _ds.Tables(0).Rows(0).Item("FechaNacimiento")
                .RFC = _ds.Tables(0).Rows(0).Item("RFC")
                .Perfil = _ds.Tables(0).Rows(0).Item("KeyPerfil")
                .Comunidad = _ds.Tables(0).Rows(0).Item("IdComunidad")
                .Activo = CBool(_ds.Tables(0).Rows(0).Item("Activo"))
                .Password = _ds.Tables(0).Rows(0).Item("Password")
                .NIP = _ds.Tables(0).Rows(0).Item("NIP")
                .KeyUsuario = _ds.Tables(0).Rows(0).Item("KeyUsuario")
				objConexion1.Conectar()
				_cmd = "Select * From Comunidad_Usuarios Where IdComunidad = '" & _ds.Tables(0).Rows(0).Item("IdComunidad") & "' "
				_ds1 = objConexion1.EjecutarConsultaSQL(_cmd)
				objConexion1.DesConectar()
				objConexion1 = Nothing
				.NomComunidad = _ds1.Tables(0).Rows(0).Item("Comunidad")
				objConexion2.Conectar()
				_cmd = "Select * From Perfiles_Usuarios Where KeyPerfil = '" & _ds.Tables(0).Rows(0).Item("KeyPerfil") & "' "
				_ds2 = objConexion2.EjecutarConsultaSQL(_cmd)
				objConexion2.DesConectar()
				objConexion2 = Nothing
				.NomPerfil = _ds2.Tables(0).Rows(0).Item("DescPerfil")
            End With
        End If

        Return _user
    End Function

    ''' <summary>
    ''' Actualiza los datos de un usuario dado su KeyUsuario
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub ActualizarUsuario()
        Dim _cmd As String
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        _cmd = "Update Usuarios_Sistema Set PrimerNombre = '" & PrimerNombreValue & "', SegundoNombre = '" & SegundoNombreValue & "', " & _
            "PrimerApellido = '" & PrimerApellidoValue & "', SegundoApellido = '" & SegundoApellidoValue & "', RFC = '" & RFCValue & "', " & _
            "FechaNacimiento = '" & FechaNacimientoValue & "', Activo = '" & ActivoValue & "', KeyPerfil = '" & PerfilValue & "',  IdComunidad = '" & ComunidadValue & "', " & _
            "Password = '" & PasswordValue & "', NIP = '" & NIPValue & "' Where KeyUsuario = '" & KeyUsuarioValue & "'"
        objConexion.EjecutarComandoSQL(_cmd)
        objConexion.DesConectar()
        objConexion = Nothing
    End Sub

    ''' <summary>
    ''' Devuelve si el usuario existe o no en Sistema
    ''' </summary>
    ''' <returns>True/False</returns>
    ''' <remarks></remarks>
    Public Function ExisteUsuario() As Boolean
        Dim _cmd As String
        Dim _ds As DataSet = New DataSet
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        _cmd = "Select count(*) From Usuarios_Sistema Where KeyUsuario = '" & KeyUsuarioValue & "'"
        _ds = objConexion.EjecutarConsultaSQL(_cmd)
        objConexion.DesConectar()
        objConexion = Nothing

        If CInt(_ds.Tables(0).Rows(0).Item(0)) > 0 Then
            Return True
        Else
            Return False
        End If

    End Function
End Class


