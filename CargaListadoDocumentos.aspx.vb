Imports System.Data

Partial Class CargaListadoDocumentos
    Inherits System.Web.UI.Page
    Dim IDRef As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'-- Si no hay usuario logueado, que vaya directamente al loguin
		If Session("ActiveUser") = "" Then
			Response.Write("<script language='JavaScript'>top.location.href='LoginAcceso.aspx';</script>")
		End If
		'--
        ListaDatos()

        If Session("PerfilUser") <> "Admin" And Session("PerfilUser") <> "A" Then
            DataGrid1.Columns(5).Visible = False
        Else
            DataGrid1.Columns(5).Visible = True
        End If
    End Sub

    Public Sub ListaDatos()
        Dim objConexion As ConexionBD = New ConexionBD()
        Dim ds As DataSet = New DataSet
        Dim qry As String = ""
        Try
            objConexion.Conectar()
            qry = " Select DescDocumento as 'Documento', " & _
                    " Case When Ruta is null then 'No' else 'Si' end as 'Digitalizado', " & _
                    " ISNULL(MAX(Version),0) as 'Version', KeyDocumento " & _
                    " From Catalogo_Documentos Left Join Docs_Digitaliza_Ref On " & _
                    " Catalogo_Documentos.KeyDocumento = Docs_Digitaliza_Ref.IDDocumento And IDReferencia = '" & Request.QueryString("IDRef") & "' " & _
                    " group by KeyDocumento, DescDocumento, Case When Ruta is null then 'No' else 'Si' end " & _
                    " order by KeyDocumento"
            ds = objConexion.EjecutarConsultaSQL(qry)
            objConexion.DesConectar()

            DataGrid1.DataSource = ds.Tables(0).DefaultView
            DataGrid1.DataBind()
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub DataGrid1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataGrid1.SelectedIndexChanged
        Dim objConexíon As ConexionBD = New ConexionBD
        Dim ds As DataSet = New DataSet
        Dim _ruta As String = ""
        Dim strScript As String = ""
        Dim value As Integer = CInt(Int((6 * Rnd()) + 1))
        Try
            objConexíon.Conectar()
            ds = objConexíon.EjecutarConsultaSQL("Select Ruta From Docs_Digitaliza_Ref Where IDReferencia = '" & Request.QueryString("IDRef") & "' And IDDocumento = '" & DataGrid1.SelectedItem.Cells(4).Text & "' And Version = '" & DataGrid1.SelectedItem.Cells(3).Text & "'")
            objConexíon.DesConectar()

            If ds.Tables(0).Rows.Count > 0 Then
                _ruta = ds.Tables(0).Rows(0).Item("Ruta")

                strScript = "<script language=" & Chr(34) & "javascript" & Chr(34) & ">" & Chr(10) & Chr(13)
                strScript &= " window.parent.document.imgLoadN.src = '" & _ruta & "';" & Chr(10) & Chr(13)
                strScript &= "</script>" & Chr(10) & Chr(13)
                ClientScript.RegisterClientScriptBlock(Me.GetType(), "FileAttach" & value, strScript)
            End If
        Catch ex As Exception
        End Try
    End Sub
End Class
