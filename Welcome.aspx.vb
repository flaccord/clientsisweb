
Partial Class Welcome
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim _Lab As New Label
        Dim _Lab2 As New Label
        Dim StrSc As String
        _Lab2 = CType(sp1.LeftPanel.Header.FindControl("Label2"), Label)
        _Lab2.Text = Session("DesClas")
        If Session("GUsuario") = "" Then
            StrSc = "window.parent.finsession();" & vbCrLf
            ClientScript.RegisterClientScriptBlock(Me.GetType, "a1", StrSc, True)
            Exit Sub
        End If
        If Session("GRol") = "GMC" Or Session("GRol") = "007" Then
            sp1.RightPanel.Content.Url = "http://50.57.200.160/Crediamigo/Indicadores/Default_GMC.aspx"
        End If
        _Lab = CType(sp1.RightPanel.Header.FindControl("Label1"), Label)
        _Lab.Text = "Bienvenid@: " & Session("GNombreUsuario")
        'If Me.IsPostBack = False Then
        '    If Session("Defa") <> "" Then
        '        sp1.RightPanel.Content.Url = "CambiarPassword.aspx"
        '    End If
        'End If
        StrSc = "var IDVar = " & Chr(34) & Session.SessionID & Chr(34) & ";" & vbCrLf
        StrSc &= "var IDUsu = " & Chr(34) & Session("GUsuario") & Chr(34) & ";" & vbCrLf
        StrSc &= "var NUsu = " & Chr(34) & Session("GNombreUsuario") & Chr(34) & ";" & vbCrLf
        StrSc &= "var RUsu = " & Chr(34) & Session("GRol") & Chr(34) & ";" & vbCrLf
        StrSc &= "var RTip = " & Chr(34) & Session("GTipoSol") & Chr(34) & ";" & vbCrLf
        ClientScript.RegisterClientScriptBlock(Me.GetType, "", StrSc, True)
    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        'Dim DSService = New ServiciosWEB.Servicios
        'Dim ConnStr As String = ConfigurationManager.ConnectionStrings("Base").ConnectionString
        'Dim ConnStrB As String = ConfigurationManager.ConnectionStrings("BaseB").ConnectionString
        'DSService.CloseSession(Session.SessionID, Session("GUsuario"), Session("GNombreUsuario"), "CerrarSession", ConnStr, ConnStrB)
        'Session.Abandon()
        '        Response.Redirect("Default.aspx")
    End Sub

End Class
