Imports System.Data
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.IO

Partial Class CargarArchivos
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ErrorMsg.Text = ""
        '-- Si no hay usuario logueado, que vaya directamente al loguin
        If Session("ActiveUser") = "" Then
            Response.Write("<script language='JavaScript'>top.location.href='LoginAcceso.aspx';</script>")
        End If
        CloseModal.Value = "false"
        '--
        If Request.QueryString("IDRef") = "" Or Request.QueryString("IDDoc") = "" Then
            ErrorMsg.Text = "No se cargaron correctamente los parámetros para la página"
            Button2.Visible = False
        End If
    End Sub

    'Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
    '    Dim strScript As String
    '    strScript = "<script language=" & Chr(34) & "javascript" & Chr(34) & ">" & Chr(10) & Chr(13)
    '    strScript = strScript & "$(document.getElementById('agregarModal')).modal('hide');" & Chr(10) & Chr(13)
    '    strScript = strScript & "</script>" & Chr(10) & Chr(13)
    '    ClientScript.RegisterClientScriptBlock(Me.GetType(), "Close", strScript)
    'End Sub

    Private Function GetEncoderInfo(ByVal mimeType As String) As ImageCodecInfo
        Dim encoders As ImageCodecInfo()
        encoders = ImageCodecInfo.GetImageEncoders()
        For j As Integer = 0 To encoders.Length
            If encoders(j).MimeType = mimeType Then
                Return encoders(j)
            End If
        Next
        Return Nothing
    End Function


    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim ImgNa, Ruta As String
        Dim imageJpeg As Image
        Dim _objDocDigitalizado As DocDigitalizado
        Dim _newVersion As Integer
        Try
			'-- Si no hay usuario logueado, que vaya directamente al loguin
			If Session("ActiveUser") = "" Then
				ErrorMsg.Text = "No hay un Usuario Activo en sesion, vuelva a entrar."
                Exit Sub
			End If
			'--
            If Request.Files.Count = 0 Then
                ErrorMsg.Text = "Debe ingresar el nombre y ruta del archivo."
                Exit Sub
            End If
            If Fup1.PostedFile.ContentLength > 1024000 Then
                ErrorMsg.Text = "El Archivo es demasiado grande para agregarlo."
                Exit Sub
            End If
            If Fup1.FileName.ToUpper.IndexOf(".JPG") < 0 Then
                ErrorMsg.Text = "El archivo debe ser formato JPG."
                Exit Sub
            End If

            Dim ici As ImageCodecInfo
            Dim eps As EncoderParameters
            ici = GetEncoderInfo("image/jpeg")
            eps = New EncoderParameters(1)
            eps.Param(0) = New EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 90)

            imageJpeg = New Bitmap(Request.Files(0).InputStream)

            Dim fileName As String
            ImgNa = Request.QueryString("IDRef") & "Img" & Request.QueryString("IDDoc") & "-"

            '-- Insertamos el registro en la BD para consulta
            _objDocDigitalizado = New DocDigitalizado

            With _objDocDigitalizado
                .KeyReferencia = Request.QueryString("IDRef")
                .KeyDocumento = Request.QueryString("IDDoc")

                _newVersion = .GetVersionDocumento()
                .Version = _newVersion

                ImgNa &= _newVersion & ".jpg"
                .Ruta = "http://64.182.79.210/clientsiswebprod/Repositorio/" & ImgNa

                fileName = "C:\clientsiswebprod\Repositorio\" & ImgNa
                imageJpeg.Save(fileName, ici, eps)

                .InsertaDocumentoDigitalizado()
            End With
            '--

            ErrorMsg.Text = "Archivo Agregado"

            Dim strScript As String
            strScript = "<script language=" & Chr(34) & "javascript" & Chr(34) & ">" & Chr(10) & Chr(13)
            strScript = strScript & "window.parent.document.location.href='CargaListadoDocumentosVer.aspx?IDRef=" & Request.QueryString("IDRef") & "&rfc=" & Request.QueryString("rfc") & "&cliente=" & Request.QueryString("cliente") & "';" & Chr(10) & Chr(13)
            strScript = strScript & "</script>" & Chr(10) & Chr(13)
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "ActualizaP" & Fup1.FileName, strScript)

        Catch ex As Exception
            If (imageJpeg Is Nothing) = False Then
                imageJpeg.Dispose()
            End If
            ErrorMsg.Text = "El archivo tiene extensión jpg pero no es una imagen..." & ex.Message & "--->" & ex.StackTrace
            Exit Sub
        End Try
    End Sub
End Class
