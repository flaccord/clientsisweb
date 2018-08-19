Imports System.Net.NetworkCredential
Imports System.Net
Imports System.IO
Imports Session

Partial Class menu
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            '-- Si no hay usuario logueado, que vaya directamente al loguin
            If Session("ActiveUser") = "" Then
                Response.Write("<script language='JavaScript'>top.location.href='LoginAcceso.aspx';</script>")
            End If
            '--
            If Session("ComunidadUser") = 1 Then
                lbConsultas.Text = "<i class='fa fa-table fa-fw'></i> Capturas"
            End If

            If Session("PerfilUser") = "Admin" Then
                lbRegistro.Visible = False
                lbConsultas.Visible = False
                lbUsuarios.Visible = True
                lbReporteBC.Visible = True
            End If

            If Session("PerfilUser") = "A" Then
                lbReporteBC.Visible = True
            End If


            If Request.QueryString("m") = "4YfhgcsZ" Then
                lbUsuarios.ForeColor = System.Drawing.Color.White
                lbUsuarios.BackColor = System.Drawing.Color.FromArgb(0.88, 12, 55, 86)
            End If
            If Request.QueryString("m") = "C02wMbiD" Then
                lbRegistro.ForeColor = System.Drawing.Color.White
                lbRegistro.BackColor = System.Drawing.Color.FromArgb(0.88, 12, 55, 86)
            End If
            If Request.QueryString("m") = "6qfo0PQf" Then
                lbConsultas.ForeColor = System.Drawing.Color.White
                lbConsultas.BackColor = System.Drawing.Color.FromArgb(0.88, 12, 55, 86)
            End If
            If Request.QueryString("m") = "IR6FD1sT" Then
                lbReporteBC.ForeColor = System.Drawing.Color.White
                lbReporteBC.BackColor = System.Drawing.Color.FromArgb(0.88, 12, 55, 86)
            End If

            lblBienvenida.Text = " Bienvenido: " & Session("NameActiveUser") & " &mdash; Comunidad: " & Session("NomComunidad") & "( " & Session("NomPerfil") & ")"

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub lbFinSession_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbFinSession.Click
        Dim objSession As Session
        Try
            objSession = New Session()
            objSession.KeyUsuario = Session("ActiveUser")
            objSession.TerminaSession()

            Response.Write("<script language='JavaScript'>top.location.href='LoginAcceso.aspx';</script>")
            'Response.Redirect("LoginAcceso.aspx")
        Catch ex As Exception
            lblBienvenida.Text = ex.Message & " --> " & ex.StackTrace
        End Try
    End Sub

    Protected Sub lbRegistro_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbRegistro.Click
        Dim objSession As Session
        Try
            If Session("ComunidadUser") = 1 Then
                Response.Write("<script language='JavaScript'>top.location.href='solicitudcreditoPrest.aspx';</script>")
            Else
                If Session("ComunidadUser") = 2 Then
                    Response.Write("<script language='JavaScript'>top.location.href='solicitudcredito.aspx';</script>")
                Else
                    Response.Write("<script language='JavaScript'>top.location.href='menu.aspx';</script>")
                End If
            End If
        Catch ex As Exception
            lblBienvenida.Text = ex.Message & " --> " & ex.StackTrace
        End Try
    End Sub

    Protected Sub lbConsultas_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbConsultas.Click
        Dim objSession As Session
        Try
            If Session("ComunidadUser") = 1 Then
                Response.Write("<script language='JavaScript'>top.location.href='capturas.aspx';</script>")
            Else
                If Session("ComunidadUser") = 2 Then
                    Response.Write("<script language='JavaScript'>top.location.href='consultas.aspx';</script>")
                Else
                    Response.Write("<script language='JavaScript'>top.location.href='menu.aspx';</script>")
                End If
            End If
        Catch ex As Exception
            lblBienvenida.Text = ex.Message & " --> " & ex.StackTrace
        End Try
    End Sub

    Protected Sub lbUsuarios_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbUsuarios.Click
        Dim objSession As Session
        Try
            If Session("ComunidadUser") = 1 Then
                Response.Write("<script language='JavaScript'>top.location.href='GestionUsuarios.aspx';</script>")
            Else
                If Session("ComunidadUser") = 2 Then
                    Response.Write("<script language='JavaScript'>top.location.href='GestionUsuarios.aspx';</script>")
                Else
                    Response.Write("<script language='JavaScript'>top.location.href='menu.aspx';</script>")
                End If
            End If
        Catch ex As Exception
            lblBienvenida.Text = ex.Message & " --> " & ex.StackTrace
        End Try
    End Sub

    Protected Sub lbReporteBC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbReporteBC.Click
        Dim objSession As Session
        Try
            If Session("ComunidadUser") = 1 Then
                Response.Write("<script language='JavaScript'>top.location.href='reporteBC.aspx';</script>")
            Else
                If Session("ComunidadUser") = 2 Then
                    Response.Write("<script language='JavaScript'>top.location.href='reporteBC.aspx';</script>")
                Else
                    Response.Write("<script language='JavaScript'>top.location.href='menu.aspx';</script>")
                End If
            End If
        Catch ex As Exception
            lblBienvenida.Text = ex.Message & " --> " & ex.StackTrace
        End Try
    End Sub

End Class
