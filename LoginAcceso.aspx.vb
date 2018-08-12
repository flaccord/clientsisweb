Imports System.Net.NetworkCredential
Imports System.Net
Imports System.IO
Imports referenciaws
Imports System.Data

Partial Class LoginAcceso
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Session("ActiveUser") = ""
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btninsertdatos_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btninsertdatos.Click
        Dim _user, _user2 As Usuario
        Dim _session As Session
        Dim _val As Boolean = False
        Dim _act As Boolean = False
        Dim UserName As String = ""
        Dim Perfil As String = ""
		Dim Comunidad As String = ""
		Dim NomComunidad As String = ""
		Dim NomPerfil As String = ""
        Try
            _user = New Usuario()
            With _user
                .KeyUsuario = txtUsuario.Value.ToString().ToUpper()
                .Password = txtPassword.Value.ToString()

                _val = .ValidaUserPassword()
                _act = .UsuarioIsActivo()
                UserName = .GetShortUserName()

                _user2 = .ObtieneDatosUsuario()
                Perfil = _user2.Perfil
				Comunidad = _user2.Comunidad
				NomComunidad = _user2.NomComunidad
				NomPerfil = _user2.NomPerfil
            End With
            _user = Nothing

            If Not _val Then
                passwordValidation.Text = "El usuario y password dados no coinciden con registros en el sistema"
                Exit Sub
            End If

            If Not _act Then
                usuarioValidation.Text = "El usuario está Inactivo en el sistema"
                Exit Sub
            End If

            _session = New Session()
            _session.KeyUsuario = txtUsuario.Value.ToString().ToUpper()

            _session.CreaSession()

            Session("ActiveUser") = txtUsuario.Value.ToString().ToUpper()
            Session("NameActiveUser") = UserName
            Session("PerfilUser") = Perfil
			Session("ComunidadUser") = Comunidad
			Session("NomComunidad") = NomComunidad
			Session("NomPerfil") = NomPerfil

            Response.Redirect("menu.aspx")

        Catch ex As Exception
            ErrorMsg.Text = ex.Message & " --> " & ex.StackTrace
        End Try
    End Sub
End Class


