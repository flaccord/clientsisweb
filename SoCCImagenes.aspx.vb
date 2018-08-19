Imports System.Data

Partial Class So_SoCCImagenes
    Inherits System.Web.UI.Page

    Dim DSService As ServiciosWEB.Servicios
    Dim Respuesta As DataSet
    Dim pProgramName As String = "SoAgregaArchivos"
    Dim pTable As String = "SoSolicitudesAttach"
    Dim pFields As String = "IdAttach,IdSolicitud,Ruta,Archivo"
    Dim pAllFields As String = "IdSolicitud,Ruta,Archivo"
    Dim pCondition As String = ""
    Dim pOrderKey As String = "IdAttach"
    Dim pOrderDesc As String = "IdAttach"
    Dim ConnStr, ConnStrB As String
    Dim tCanAdd, tCanEdit, tCanDelete As Boolean
    Dim tQuery As String

    'Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Dim Path1, Path0 As String
    '    Dim tValues, tNewValues As String
    '    Dim tRespuesta As String

    '    'Path0 = Request.PhysicalPath.ToString.Replace("SoAgregaArchivos.aspx", "SoAttach\") & Request.QueryString("IDvar") & Fup1.FileName
    '    'Fup1.SaveAs(Path0)
    '    'Path1 = "./SoAttach/" & Request.QueryString("IDvar") & Fup1.FileName
    '    'tNewValues = "'" & Request.QueryString("IDvar") & "','" & Path1 & "','" & Fup1.FileName & "'"

    '    'tValues = tNewValues
    '    'DSService = New ServiciosWEB.Servicios
    '    'tRespuesta = DSService.AltaDatos(Session("GUsuario"), Session("GNombreUsuario"), pProgramName, pTable, pAllFields, tValues, ConnStr, ConnStrB)
    '    'ErrorMsg.Text = "Archivo Agregado"
    '    'Call ListaDatos()
    'End Sub

    Public Function BuscaDigitalizada(ByVal Doc As String, ByVal Dat As DataSet, ByVal Lado As String) As String
        Dim Resp As String
        Dim i As Integer
        Resp = "No"
        For i = 0 To Dat.Tables(0).Rows.Count - 1
            If Doc = Dat.Tables(0).Rows(i).Item("KeyDocumento") And Lado.ToUpper = Dat.Tables(0).Rows(i).Item("Lado").ToString.ToUpper Then
                Resp = "Si"
                Exit For
            End If
        Next
        Return Resp
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim Ds As New DataSet
        Dim Ds1 As New DataSet
        Dim Ds2 As New DataSet
        Dim i, j, ArrPos As Integer
        Dim Query As String

        ConnStr = ConfigurationManager.ConnectionStrings("Base").ConnectionString
        ConnStrB = ConfigurationManager.ConnectionStrings("BaseB").ConnectionString
        Call ListaDatos()
        DSService = New ServiciosWEB.Servicios
        tQuery = " * From SoSolicitudes Where IdSolicitud = '" & Request.QueryString("IDvar") & "'"
        Respuesta = DSService.ConsultaGeneral(tQuery, ConnStr)
        'tQuery = " * From SegOpcionesScaneo Where KeyRol = '" & Session("GRol") & "'"
        'Ds2 = DSService.ConsultaGeneral(tQuery, ConnStr)
        Response.Write("<Script Language=Javascript>" & vbCrLf)
        Response.Write("IDVar=" & Chr(34) & Request.QueryString("IDvar") & Chr(34) & ";" & vbCrLf)
        Response.Write("IDTipo=" & Chr(34) & Respuesta.Tables(0).Rows(0).Item("KeyTipoSolicitud") & Chr(34) & ";" & vbCrLf)
        Response.Write("VpixelType=2;" & vbCrLf)
        Response.Write("VjpegQuality=90;" & vbCrLf)
        Response.Write("Vresolution=150;" & vbCrLf)
        Response.Write("VshowUI=false;" & vbCrLf)
        Response.Write("var KDocs = new Array();" & vbCrLf)
        Response.Write("var NDocs = new Array();" & vbCrLf)
        Response.Write("var LDocs = new Array();" & vbCrLf)
        Response.Write("var DDocs = new Array();" & vbCrLf)
        Response.Write("var RDocs = new Array();" & vbCrLf)
        Response.Write("var ODocs = new Array();" & vbCrLf)
        Response.Write("var PDocs = new Array();" & vbCrLf)
        Query = "* From SoDocumentosXSolicitud Where IdSolicitud = '" & Request.QueryString("IDvar") & "'"
        Ds1 = DSService.ConsultaGeneral(Query, ConnStr)

        Query = "* From SoDocsXTiposDocumentos Where KeyTipoSolicitud = '" & Respuesta.Tables(0).Rows(0).Item("KeyTipoSolicitud") & "' Order By Orden"

        Ds = DSService.ConsultaGeneral(Query, ConnStr)
        j = 1
        ArrPos = -1
        For i = 0 To Ds.Tables(0).Rows.Count - 1
            ArrPos += 1
            If Ds.Tables(0).Rows(i).Item("AmbosLados") = True Then
                Response.Write("KDocs[" & ArrPos & "]='" & Ds.Tables(0).Rows(i).Item("KeyDocumento") & "';" & vbCrLf)
                Response.Write("NDocs[" & ArrPos & "]='" & Ds.Tables(0).Rows(i).Item("DescDocumento") & "';" & vbCrLf)
                Response.Write("LDocs[" & ArrPos & "]='" & "Frente" & "';" & vbCrLf)
                Response.Write("DDocs[" & ArrPos & "]='" & BuscaDigitalizada(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Frente") & "';" & vbCrLf)
                Response.Write("RDocs[" & ArrPos & "]='';" & vbCrLf)
                Response.Write("ODocs[" & ArrPos & "]=" & Ds.Tables(0).Rows(i).Item("Opcional").ToString.ToLower & ";" & vbCrLf)
                Response.Write("PDocs[" & ArrPos & "]=false;" & vbCrLf)
                ArrPos += 1
                'j += 1
                Response.Write("KDocs[" & ArrPos & "]='" & Ds.Tables(0).Rows(i).Item("KeyDocumento") & "';" & vbCrLf)
                Response.Write("NDocs[" & ArrPos & "]='" & Ds.Tables(0).Rows(i).Item("DescDocumento") & "';" & vbCrLf)
                Response.Write("LDocs[" & ArrPos & "]='" & "Reverso" & "';" & vbCrLf)
                Response.Write("DDocs[" & ArrPos & "]='" & BuscaDigitalizada(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Reverso") & "';" & vbCrLf)
                Response.Write("RDocs[" & ArrPos & "]='';" & vbCrLf)
                Response.Write("ODocs[" & ArrPos & "]=" & Ds.Tables(0).Rows(i).Item("Opcional").ToString.ToLower & ";" & vbCrLf)
                Response.Write("PDocs[" & ArrPos & "]=false;" & vbCrLf)
                'j += 1
            Else
                Response.Write("KDocs[" & ArrPos & "]='" & Ds.Tables(0).Rows(i).Item("KeyDocumento") & "';" & vbCrLf)
                Response.Write("NDocs[" & ArrPos & "]='" & Ds.Tables(0).Rows(i).Item("DescDocumento") & "';" & vbCrLf)
                Response.Write("LDocs[" & ArrPos & "]='" & "Frente" & "';" & vbCrLf)
                Response.Write("DDocs[" & ArrPos & "]='" & BuscaDigitalizada(Ds.Tables(0).Rows(i).Item("KeyDocumento"), Ds1, "Frente") & "';" & vbCrLf)
                Response.Write("RDocs[" & ArrPos & "]='';" & vbCrLf)
                Response.Write("ODocs[" & ArrPos & "]=" & Ds.Tables(0).Rows(i).Item("Opcional").ToString.ToLower & ";" & vbCrLf)
                Response.Write("PDocs[" & ArrPos & "]=false;" & vbCrLf)
                j += 1
            End If
        Next
        Response.Write("Docs=" & ArrPos & ";" & vbCrLf)
        Response.Write("</Script>" & vbCrLf)
    End Sub

    Public Sub Consulta(ByVal tCampos As String)
        DSService = New ServiciosWEB.Servicios
        Respuesta = DSService.ConsultaDatos(pTable, tCampos, pCondition, pOrderKey, ConnStr)
    End Sub

    Public Sub ListaDatos()
        DSService = New ServiciosWEB.Servicios
        tQuery = " SoSolicitudes.IdSolicitud, SoSolicitudes.Transaccion, SoSolicitudes.Folio, " &
                 " SoSolicitudesAttach.Archivo From SoSolicitudesAttach INNER JOIN SoSolicitudes On SoSolicitudes.IdSolicitud = " &
                 " SoSolicitudesAttach.IdSolicitud Where SoSolicitudesAttach.IdSolicitud = '" & Request.QueryString("IDvar") & "'"
        Respuesta = DSService.ConsultaGeneral(tQuery, ConnStr)
        'DataGrid1.DataSource = Respuesta
        'DataGrid1.DataBind()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim strScript As String
        strScript = "<script language=" & Chr(34) & "javascript" & Chr(34) & ">" & Chr(10) & Chr(13)
        strScript = strScript & "window.parent.close();" & Chr(10) & Chr(13)
        strScript = strScript & "</script>" & Chr(10) & Chr(13)
        ClientScript.RegisterClientScriptBlock(Me.GetType(), "Close", strScript)
    End Sub
End Class
