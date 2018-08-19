Imports System.Net.NetworkCredential
Imports System.Net
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc
Imports System
Imports System.Collections
Imports System.ComponentModel
Imports System.Drawing
Imports System.Text
Imports iTextSharp
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.xml

Partial Class capturas
    Inherits System.Web.UI.Page
    Dim RefBuro As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            PageHeading.InnerText = "Capturas"
            '-- Si no hay usuario logueado, que vaya directamente al loguin
            If Session("ActiveUser") = "" Then
                Response.Write("<script language='JavaScript'>top.location.href='LoginAcceso.aspx';</script>")
            End If
            If Session("PerfilUser") = "Admin" Then
                Response.Write("<script language='JavaScript'>top.location.href='menu.aspx';</script>")
            End If
            '--

            RefBuro = Session("ReferenciaBuro")
            If RefBuro <> "" Then
                'Response.Write("<script language='JavaScript'>alert('El cliente ha sido registrado Correctamente! Referencia No. " & RefBuro & "');</script>")
            Else
                RefBuro = Request.QueryString("Ref")
            End If

            'llena los campos de Puntos y Semaforo
            If RefBuro <> "" Then
                ListaPuntosySemaforo()
                PageHeading.InnerText = "Detalle de Puntos"
            Else
                tablepuntosysema.Visible = False
                'Table6.Visible = False
            End If
            'tablepuntosysema.Visible = False


            'Creamos la cadena de conexion'
            Dim strConexion As String
            strConexion = ConfigurationManager.ConnectionStrings("dbMysql").ConnectionString

            'Creamos el objeto conexion para enlazar con el servidor de datos
            Dim oConnection As OdbcConnection = New OdbcConnection(strConexion)

            'Creamos la sentencia SQL que devuelva los datos deseados
            Dim strSQL As String
            If RefBuro <> "" Then
                strSQL = "SELECT fecha_consulta,id,rfc,concat(primer_nombre,' ',segundo_nombre,' ',apellido_paterno,' ',apellido_materno) as nombre,date_format(fecha_nacimiento,'%d/%m/%Y') as fecha_nacimiento,referencia_buro,referencia_cliente,ifnull(s.codigo_score,'') as codigo_score,ifnull(s.valor_score,'') as valor_score FROM consulta c left outer join score s on s.id_consulta = c.id WHERE referencia_buro = '" & RefBuro & "' order by fecha_consulta; "
                'Instanciamos el objeto Command
                'recibe la sentencia a ejecutar y la conexión
                Dim oDataAdapter As OdbcDataAdapter = New OdbcDataAdapter(strSQL, oConnection)
                Dim oDataSet As DataSet = New DataSet()
                oDataAdapter.Fill(oDataSet)
                GridView1.DataSource = oDataSet
                If oDataSet.Tables(0).Rows.Count > 0 Then
                    scoreburo.Text = oDataSet.Tables(0).Rows(0).Item("valor_score")
                End If
            End If

            Dim _pys1 As String
            Dim _pysdatos1 As DataSet = New DataSet
            Dim objConexion1 As New ConexionBD()
            objConexion1.Conectar()
            If RefBuro = "" Then
                If Session("PerfilUser") = "A" Then
                    _pys1 = "SELECT (convert(varchar, r.fecha, 103) + ' ' + convert(varchar, r.fecha, 108)) as fecha,r.rfc,r.primernombre + ' ' + r.segundonombre + ' ' + r.apellidopaterno + ' ' + r.apellidomaterno as nombre, " &
                        "r.referenciaburo,r.Puntos,r.Semaforo,r.Id,r.errorburo " &
                        "FROM registro_clientes r, Usuarios_Sistema u " &
                        "WHERE r.KeyUsuario = u.KeyUsuario AND u.IdComunidad = " & Session("ComunidadUser") & " " &
                        "order by r.Id"
                Else
                    _pys1 = "SELECT (convert(varchar, r.fecha, 103) + ' ' + convert(varchar, r.fecha, 108)) as fecha,r.rfc,r.primernombre + ' ' + r.segundonombre + ' ' + r.apellidopaterno + ' ' + r.apellidomaterno as nombre, " &
                        "r.referenciaburo,r.Puntos,r.Semaforo,r.Id,r.errorburo " &
                        "FROM registro_clientes r " &
                        "WHERE r.KeyUsuario = '" & Session("ActiveUser") & "' " &
                        "order by r.Id"
                End If
            Else
                If Session("PerfilUser") = "A" Then
                    _pys1 = "SELECT (convert(varchar, r.fecha, 103) + ' ' + convert(varchar, r.fecha, 108)) as fecha,r.rfc,r.primernombre + ' ' + r.segundonombre + ' ' + r.apellidopaterno + ' ' + r.apellidomaterno as nombre, " &
                        "r.referenciaburo,r.Puntos,r.Semaforo,r.Id,r.errorburo " &
                        "FROM registro_clientes r, Usuarios_Sistema u " &
                        "WHERE r.KeyUsuario = u.KeyUsuario AND u.IdComunidad = " & Session("ComunidadUser") & " AND r.referenciaburo = '" & RefBuro & "'" &
                        "order by r.Id"
                Else
                    _pys1 = "SELECT (convert(varchar, r.fecha, 103) + ' ' + convert(varchar, r.fecha, 108)) as fecha,r.rfc,r.primernombre + ' ' + r.segundonombre + ' ' + r.apellidopaterno + ' ' + r.apellidomaterno as nombre, " &
                        "r.referenciaburo,r.Puntos,r.Semaforo,r.Id,r.errorburo " &
                        "FROM registro_clientes r " &
                        "WHERE r.KeyUsuario = '" & Session("ActiveUser") & "' AND r.referenciaburo = '" & RefBuro & "'" &
                        "order by r.Id"
                End If
            End If
            _pysdatos1 = objConexion1.EjecutarConsultaSQL(_pys1)
            objConexion1.DesConectar()
            objConexion1 = Nothing

            GridView1.DataSource = _pysdatos1
            GridView1.DataBind()

            Session("ReferenciaBuro") = ""

            If GridView1.Rows.Count > 0 Then
                ErrorMsg.Text = ""
            Else
                ErrorMsg.Text = "No se encontraron registros."
                Response.Redirect("rfcconsulta.htm?msj=noreg")
            End If


        Catch ex As Exception

        End Try

        Me.RegisterPostBackControl()
    End Sub
	
    Private Sub ListaPuntosySemaforo()
        Dim _pys As String
        Dim _pysdatos As DataSet = New DataSet
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        _pys = "SELECT Edad,Antiguedad_domicilio,Vivienda,Tipo_Empleo,Antiguedad_Laboral,Nivel_Endeudamiento,Creditos_MOP,Score " & _
                "FROM registro_clientes_puntos WHERE Referenciaburo = '" & RefBuro & "'"
        _pysdatos = objConexion.EjecutarConsultaSQL(_pys)
        objConexion.DesConectar()
        objConexion = Nothing
        If _pysdatos.Tables(0).Rows.Count > 0 Then
            puntosedad.Text = _pysdatos.Tables(0).Rows(0).Item("Edad")
            puntosedad.ForeColor = Color.Red
            puntosantdomi.Text = _pysdatos.Tables(0).Rows(0).Item("Antiguedad_domicilio")
            puntosantdomi.ForeColor = Color.Red
            puntosvivienda.Text = _pysdatos.Tables(0).Rows(0).Item("Vivienda")
            puntosvivienda.ForeColor = Color.Red
            puntostipoempleo.Text = _pysdatos.Tables(0).Rows(0).Item("Tipo_Empleo")
            puntostipoempleo.ForeColor = Color.Red
            puntosantlaboral.Text = _pysdatos.Tables(0).Rows(0).Item("Antiguedad_Laboral")
            puntosantlaboral.ForeColor = Color.Red
            puntosnivelendeuda.Text = _pysdatos.Tables(0).Rows(0).Item("Nivel_Endeudamiento")
            puntosnivelendeuda.ForeColor = Color.Red
            puntosmop.Text = _pysdatos.Tables(0).Rows(0).Item("Creditos_MOP")
            puntosmop.ForeColor = Color.Red
            puntosscore.Text = _pysdatos.Tables(0).Rows(0).Item("Score")
            puntosscore.ForeColor = Color.Red
        End If
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
			
            For Each cell As TableCell In e.Row.Cells
                GridView1.Columns(0).ItemStyle.HorizontalAlign = HorizontalAlign.Center
                GridView1.Columns(1).ItemStyle.HorizontalAlign = HorizontalAlign.Center
                GridView1.Columns(3).ItemStyle.HorizontalAlign = HorizontalAlign.Center
                GridView1.Columns(4).ItemStyle.HorizontalAlign = HorizontalAlign.Center
                GridView1.Columns(5).ItemStyle.HorizontalAlign = HorizontalAlign.Center
                e.Row.Cells(4).ForeColor = Drawing.Color.Red
                e.Row.Cells(5).ForeColor = Drawing.Color.Black
				'e.Row.Cells(4).ToolTip =  "Edad: " + Environment.NewLine + "Antiguedad Domicilio: " + Environment.NewLine + "Vivienda: " + Environment.NewLine + "Tipo de Empleo: " + Environment.NewLine + "Antiguedad Laboral: " + Environment.NewLine + "Nivel Endeudamiento: " + Environment.NewLine + "Creditos MOP: " + Environment.NewLine + "Score: "
                'e.Row.Cells(4).BorderStyle = BorderStyle.Double
                e.Row.Cells(4).Attributes.Add("onmouseover", "this.style.cursor='pointer';this.style.textDecoration='underline';")
                e.Row.Cells(4).Attributes.Add("onmouseout", "this.style.textDecoration='none';")
                If e.Row.Cells(5).Text = "Rojo" Then
                    e.Row.Cells(5).BackColor = Drawing.Color.Red
                    e.Row.Cells(7).Text = ""
                    'Table6.Visible = False
                End If
                If e.Row.Cells(5).Text = "Amarillo" Then
                    e.Row.Cells(5).BackColor = Drawing.Color.FromArgb(255, 241, 195, 64)
                End If
                If e.Row.Cells(5).Text = "Verde" Then
                    e.Row.Cells(5).BackColor = Drawing.Color.FromArgb(255, 14, 132, 79)
                End If
				If e.Row.Cells(5).Text = "Azul" Then
                    e.Row.Cells(5).BackColor = Drawing.Color.FromArgb(255, 29, 98, 138)
                    e.Row.Cells(7).Text = ""
                    'Table6.Visible = False
                End If
            Next
        End If
    End Sub

    'Protected Sub Buttondoc_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Buttondoc.Click
    '    Try
    '        CreaPDF()
    '    Catch ex As Exception

    '    End Try
    'End Sub

    Private Sub CreaPDF(ByVal RfcValue As String)
        Dim _pys2 As String
        Dim fechareg As String
        Dim nombrereg As String
        Dim idreg As String
        Dim nompdfreg As String
        Dim Name1 As String
        Dim _pysdatos2 As DataSet = New DataSet
        Dim objConexion2 As New ConexionBD()
        objConexion2.Conectar()
        _pys2 = "SELECT convert(varchar, fecha, 103) as fecha,primernombre + ' ' + segundonombre + ' ' + apellidopaterno + ' ' + apellidomaterno as nombre, Id " &
                "FROM registro_clientes WHERE referenciaburo = '" & RfcValue & "'"
        _pysdatos2 = objConexion2.EjecutarConsultaSQL(_pys2)
        objConexion2.DesConectar()
        objConexion2 = Nothing
        fechareg = _pysdatos2.Tables(0).Rows(0).Item("fecha")
        nombrereg = _pysdatos2.Tables(0).Rows(0).Item("nombre")
        idreg = _pysdatos2.Tables(0).Rows(0).Item("Id")
        nompdfreg = "NOMPVAL_6_Clausulas_GLC_Medios_Electronicos_" & idreg & "_" & RfcValue

        Dim pdfTemplate As String = Server.MapPath("SolicitudesPDF\NOMPVAL_6_Clausulas_GLC_Medios_Electronicos_Formv1.pdf")
        Dim newFile As String = "C:\clientsiswebprod\ArchivosPDF\" & nompdfreg & ".pdf"
        Dim pdfReader As New PdfReader(pdfTemplate)
        Dim pdfStamper As New PdfStamper(pdfReader, New FileStream(newFile, FileMode.Create))
        Dim pdfFormFields As AcroFields = pdfStamper.AcroFields
        pdfFormFields.SetField("Nombre y firma", nombrereg)
        pdfFormFields.SetField("Nombre y firma_2", nombrereg)
        pdfFormFields.SetField("Nombre y firma_3", nombrereg)
        pdfFormFields.SetField("Fecha de firma de contrato", fechareg)
        pdfStamper.FormFlattening = True
        pdfStamper.Close()

        Name1 = "C:\clientsiswebprod\ArchivosPDF\" & nompdfreg & ".pdf"
        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType() = "application/pdf"
        Response.WriteFile(Name1)
        Response.AddHeader("content-disposition", "attachment; filename=" & nompdfreg & ".pdf")
        Response.Flush()
        Response.End()
    End Sub

    Private Sub GenerarPDF()
        Dim oDoc As New iTextSharp.text.Document(PageSize.A4, 0, 0, 0, 0)
        Dim pdfw As iTextSharp.text.pdf.PdfWriter
        Dim cb As PdfContentByte
        Dim fuente As iTextSharp.text.pdf.BaseFont
        Dim NombreArchivo As String = "C:\clientsiswebprod\ArchivosPDF\ejemplo.pdf"
        Try
            pdfw = PdfWriter.GetInstance(oDoc, New FileStream(NombreArchivo, FileMode.Create, FileAccess.Write, FileShare.None))
            'Apertura del documento.
            oDoc.Open()
            cb = pdfw.DirectContent
            'Agregamos una pagina.
            oDoc.NewPage()
            'Iniciamos el flujo de bytes.
            cb.BeginText()
            'Instanciamos el objeto para la tipo de letra.
            fuente = FontFactory.GetFont(FontFactory.HELVETICA, iTextSharp.text.Font.DEFAULTSIZE, iTextSharp.text.Font.NORMAL).BaseFont
            'Seteamos el tipo de letra y el tamaño.
            cb.SetFontAndSize(fuente, 12)
            'Seteamos el color del texto a escribir.
            'cb.SetColorFill(iTextSharp.text.Color.BLACK)
            'Aqui es donde se escribe el texto.
            'Aclaracion: Por alguna razon la coordenada vertical siempre es tomada desde el borde inferior (de ahi que se calcule como "PageSize.A4.Height - 50")
            cb.ShowTextAligned(PdfContentByte.ALIGN_LEFT, "Ejemplo basico con iTextSharp", 200, PageSize.A4.Height - 50, 0)
            'Fin del flujo de bytes.
            cb.EndText()
            'Forzamos vaciamiento del buffer.
            pdfw.Flush()
            'Cerramos el documento.
            oDoc.Close()
        Catch ex As Exception
            'Si hubo una excepcion y el archivo existe ...
            If File.Exists(NombreArchivo) Then
                'Cerramos el documento si esta abierto.
                'Y asi desbloqueamos el archivo para su eliminacion.
                If oDoc.IsOpen Then oDoc.Close()
                '... lo eliminamos de disco.
                File.Delete(NombreArchivo)
            End If
            Throw New Exception("Error al generar archivo PDF (" & ex.Message & ")")
        Finally
            cb = Nothing
            pdfw = Nothing
            oDoc = Nothing
        End Try
    End Sub

    Protected Sub Buttondoc_Click(sender As Object, e As EventArgs)
        Try
            Dim RfcValue As String
            RfcValue = sender.name
            If RfcValue IsNot Nothing Then
                CreaPDF(RfcValue)
            End If
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Private Sub RegisterPostBackControl()
        For Each row As GridViewRow In GridView1.Rows
            Dim lnkFull As LinkButton = TryCast(row.FindControl("Buttondoc"), LinkButton)
            If lnkFull IsNot Nothing Then
                ScriptManager.GetCurrent(Me).RegisterPostBackControl(lnkFull)
            End If
        Next
    End Sub
End Class
