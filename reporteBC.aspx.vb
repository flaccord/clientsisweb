Imports System.Net.NetworkCredential
Imports System.Net
Imports System.IO
Imports Session

Partial Class reporteBC
    Inherits System.Web.UI.Page
	
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Try
		
		'-- Si no hay usuario logueado, que vaya directamente al loguin
		If Session("ActiveUser") = "" Then
			Response.Write("<script language='JavaScript'>top.location.href='LoginAcceso.aspx';</script>")
		End If
		'--
		If (Session("PerfilUser") <> "Admin" and Session("PerfilUser") <> "A") Then
			Response.Write("<script language='JavaScript'>top.location.href='menu.aspx';</script>")
		End If

		Catch ex As Exception
			
		End Try
    End Sub
	
End Class
