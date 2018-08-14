Imports System.Data

Partial Class CargaListadoDocumentosVer
    Inherits System.Web.UI.Page
    Public IDRef As String = ""
    Public RfcValue As String = ""
    Public ClienteValue As String = ""
    Public FileVersion As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '-- Si no hay usuario logueado, que vaya directamente al loguin
        If Session("ActiveUser") = "" Then
            Response.Write("<script language='JavaScript'>top.location.href='LoginAcceso.aspx';</script>")
        End If
        '--
        IDRef = Request.QueryString("IDRef")
        RfcValue = Request.QueryString("rfc")
        ClienteValue = Request.QueryString("cliente")
        FileVersion = Request.QueryString("FVer")
        rfc.Text = RfcValue
        cliente.Text = ClienteValue

        ListaDatos()

        If Session("PerfilUser") <> "Admin" And Session("PerfilUser") <> "A" And Session("PerfilUser") <> "Vend" Then
            DataGrid1.Columns(4).Visible = False
        Else
            DataGrid1.Columns(4).Visible = True
        End If

        If FileVersion IsNot Nothing Then
            CargarYMostrarImagen(FileVersion)
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
        Dim hdfVer As HiddenField = DirectCast(DataGrid1.SelectedItem.FindControl("hdfVer"), HiddenField)
        CargarYMostrarImagen(hdfVer.Value)
    End Sub

    Private Sub CargarYMostrarImagen(ByVal version As String)
        Dim objConexíon As ConexionBD = New ConexionBD
        Dim ds As DataSet = New DataSet
        Dim _ruta As String = ""
        Dim strScript As String = ""
        Dim value As Integer = CInt(Int((6 * Rnd()) + 1))
        Try
            valoratras.Text = version
            'documentoselect.Text = DataGrid1.SelectedItem.Cells(1).Text & " (Versión: " & version & ")"
            objConexíon.Conectar()
            ds = objConexíon.EjecutarConsultaSQL("Select Ruta From Docs_Digitaliza_Ref Where IDReferencia = '" & Request.QueryString("IDRef") & "' And IDDocumento = '" & Request.QueryString("selDocument") & "' And Version = '" & version & "'")
            objConexíon.DesConectar()

            If ds.Tables(0).Rows.Count > 0 Then
                _ruta = ds.Tables(0).Rows(0).Item("Ruta")

                strScript = "<script language=" & Chr(34) & " javascript" & Chr(34) & ">" & Chr(10) & Chr(13)
                strScript &= " window.document.imgLoadN.src = '" & _ruta & "';" & Chr(10) & Chr(13)
                strScript &= "</script>" & Chr(10) & Chr(13)
                ClientScript.RegisterClientScriptBlock(Me.GetType(), "FileAttach" & value, strScript)
            Else
                strScript = "<script language=" & Chr(34) & " javascript" & Chr(34) & ">" & Chr(10) & Chr(13)
                strScript &= " window.document.imgLoadN.src = 'http://64.182.79.210/clientsiswebprod/images/no-image-available.png';" & Chr(10) & Chr(13)
                strScript &= "</script>" & Chr(10) & Chr(13)
                ClientScript.RegisterClientScriptBlock(Me.GetType(), "FileAttach" & value, strScript)
            End If
        Catch ex As Exception
        End Try
    End Sub

    ' Protected Sub lnkAtras_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
    '     Try
    '         Dim valor As String = e.CommandArgument.ToString()
    '         Dim lblVersion As Label = DirectCast(DataGrid1.Items(DataGrid1.SelectedIndex).FindControl("lblVersion"), Label)
    'If valoratras.Text = "" Then
    '	valoratras.Text = CInt(lblVersion.Text)
    'End if
    'If CInt(valoratras.Text) = 1 Then
    '	lblVersion.Text = CInt(valoratras.Text)
    '             'Exit Sub
    '         ElseIf CInt(valoratras.Text) > 1 Then
    '             lblVersion.Text = (CInt(valoratras.Text) - 1).ToString()
    '	valoratras.Text = (CInt(valoratras.Text) - 1).ToString()
    '         End If

    '         CargarYMostrarImagen(valoratras.Text)
    '     Catch ex As Exception
    '     End Try
    ' End Sub

    ' Protected Sub lnkAdelante_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
    '     Try
    '         Dim valor As String = e.CommandArgument.ToString()
    '         Dim lblVersion As Label = DirectCast(DataGrid1.Items(DataGrid1.SelectedIndex).FindControl("lblVersion"), Label)
    'If valoratras.Text = "" Then
    '	valoratras.Text = CInt(lblVersion.Text)
    'End if
    '         If CInt(valoratras.Text) > valor Then
    '             Exit Sub
    '         ElseIf CInt(valoratras.Text) <valor Then
    '             lblVersion.Text = (CInt(valoratras.Text) + 1).ToString()
    '	valoratras.Text = (CInt(valoratras.Text) + 1).ToString()
    '         Else
    '             lblVersion.Text = (CInt(valoratras.Text)).ToString()
    '	valoratras.Text = (CInt(valoratras.Text)).ToString()
    '         End If
    '         CargarYMostrarImagen(valoratras.Text)
    '     Catch ex As Exception
    '     End Try
    ' End Sub

    'Protected Sub documentoselect_SelectedIndexChanged(sender As Object, e As EventArgs)
    '    Dim hdfVer As HiddenField = DirectCast(DataGrid1.SelectedItem.FindControl("hdfVer"), HiddenField)
    '    CargarYMostrarImagen(hdfVer.Value)
    'End Sub

    Protected Sub SelectedVersion_SelectedIndexChanged(sender As Object, e As EventArgs)


    End Sub
    Protected Sub btnVistaPrevia_ItemCommand(source As Object, e As DataGridCommandEventArgs)
        Dim hdfVer As HiddenField = DirectCast(DataGrid1.SelectedItem.FindControl("hdfVer"), HiddenField)
        CargarYMostrarImagen(hdfVer.Value)
    End Sub
    Public Sub VistaPrevia_ServerClick(ByVal sender As Object, ByVal e As CommandEventArgs)
        'e.CommandArgument  contains email address
        'e.CommandName = "Delete"
        'You can handle other command buttons with other names as well
    End Sub
    Protected Sub DataGrid1_EditCommand(source As Object, e As DataGridCommandEventArgs)
        'e.CommandArgument  contains email address
        'e.CommandName = "Delete"
        'You can handle other command buttons with other names as well
    End Sub
End Class
