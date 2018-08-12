Imports System.Data

Partial Class ConsultaGestionaDocumentos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '-- Si no hay usuario logueado, que vaya directamente al loguin
        If Session("ActiveUser") = "" Then
            Response.Write("<script language='JavaScript'>top.location.href='LoginAcceso.aspx';</script>")
        End If
        '--
    End Sub

End Class
