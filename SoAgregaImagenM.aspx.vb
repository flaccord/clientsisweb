Imports System.Data
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.IO
Imports System.Runtime.InteropServices


Partial Class So_SoAgregaImagenM
    Inherits System.Web.UI.Page

    Class Win32API

        <DllImport("KERNEL32.DLL", EntryPoint:="RtlMoveMemory", _
           SetLastError:=True, CharSet:=CharSet.Auto, _
           ExactSpelling:=True, _
           CallingConvention:=CallingConvention.StdCall)> _
        Public Shared Sub CopyArrayTo(<[In](), MarshalAs(UnmanagedType.I4)> ByVal hpvDest As Int32, <[In](), Out()> ByVal hpvSource() As Byte, ByVal cbCopy As Integer)
            ' Leave function empty - DLLImport attribute forwards calls to CopyArrayTo to
            ' RtlMoveMemory in KERNEL32.DLL.
        End Sub


    End Class


    Dim DSService As ServiciosWEB.Servicios
    Dim Respuesta As DataSet
    Dim pProgramName As String = "SoImagenes"
    Dim pTable As String = "SoDocumentosXSolicitud"
    Dim pFields As String = "KeyDocumento,IdSolicitud,PVersion,Lado,Ruta,Correcta,DescDocumento,Fecha"
    Dim pAllFields As String = "KeyDocumento,IdSolicitud,PVersion,Lado,Ruta,Correcta,DescDocumento,Fecha"
    Dim pCondition As String = ""
    Dim pOrderKey As String = "KeyDocumento"
    Dim pOrderDesc As String = "KeyDocumento"
    Dim ConnStr, ConnStrB, EstatusSol As String
    Dim tCanAdd, tCanEdit, tCanDelete As Boolean
    Dim tQuery As String

    Public Sub Consulta(ByVal tCampos As String)
        DSService = New ServiciosWEB.Servicios
        Respuesta = DSService.ConsultaDatos(pTable, tCampos, pCondition, pOrderKey, ConnStr)
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ErrorMsg.Text = ""
        Label1.Text = Request.QueryString("Nom")
        ConnStr = ConfigurationManager.ConnectionStrings("Base").ConnectionString
        ConnStrB = ConfigurationManager.ConnectionStrings("BaseB").ConnectionString
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim strScript As String
        strScript = "<script language=" & Chr(34) & "javascript" & Chr(34) & ">" & Chr(10) & Chr(13)
        'strScript = strScript & "window.opener.parent.document.location.href='SoAgregaImagenes.aspx?IDvar=" & Request.QueryString("IDvar") & "&IDtipo=" & Request.QueryString("IdTipo") & "&IDtemp=" & Request.QueryString("IDtemp") & "';" & Chr(10) & Chr(13)
        'strScript = strScript & "window.opener.parent.document.location.href='SoAgregaImagenes.aspx?IDvar=" & Request.QueryString("IDvar") & "';" & Chr(10) & Chr(13)
        strScript = strScript & "window.close();" & Chr(10) & Chr(13)
        strScript = strScript & "</script>" & Chr(10) & Chr(13)
        ClientScript.RegisterClientScriptBlock(Me.GetType(), "Close", strScript)
    End Sub

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
        Dim ImgNa, KDoc, Lado, Ruta, Nombre, Sol, Query, ImgNaT, Ruta1 As String
        Dim tValues, tNewValues As String
        Dim tRespuesta As String
        Dim pVers As Integer
        Dim imageJpeg As Image
        Try
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
            DSService = New ServiciosWEB.Servicios
            tRespuesta = " IdSolicitud = '" & Request.QueryString("IdVar") & "'"
            tRespuesta = DSService.BajaDatos(Session("GUsuario"), Session("GNombreUsuario"), pProgramName, "SoSolicitudesAttach", tRespuesta, ConnStr, ConnStrB)
            KDoc = Request.QueryString("IDoc")
            Lado = Request.QueryString("Lado")
            Nombre = Request.QueryString("Nom")
            Sol = Request.QueryString("IDvar")
            Query = "KeyDocumento, IdSolicitud, MAX(PVersion) AS PVersion, Lado, Ruta, Correcta, DescDocumento From SoDocumentosXSolicitud Where KeyDocumento = '" & KDoc & "' And IdSolicitud = '" & Sol & "'  GROUP BY KeyDocumento, IdSolicitud, Lado, Ruta, Correcta, DescDocumento ORDER BY PVersion DESC"
            Respuesta = DSService.ConsultaGeneral(Query, ConnStr)
            If Respuesta.Tables(0).Rows.Count = 0 Then
                pVers = 1
            Else
                pVers = CInt(Respuesta.Tables(0).Rows(0).Item("PVersion")) + 1
            End If
            ImgNa = Sol & "img" & KDoc & Lado & "_" & pVers & ".jpg"
            ImgNaT = Sol & "img" & KDoc & Lado & "_" & pVers & "Temp.jpg"
            Ruta = "D:\\ArchivoDigital\\Imgs\\" & ImgNa
            Ruta1 = "D:\\ArchivoDigital\\Imgs\\" & ImgNaT
            pCondition = " Where KeyDocumento = '" & KDoc & "' And IdSolicitud = '" & Sol & "' And PVersion = '" & pVers & "'"
            'ErrorMsg.Text = KDoc & "-" & Lado & "-" & Nombre & "-" & Sol & "-" & ImgNa & "-" & Ruta & "-" & pCondition
            'Exit Sub
            Call Consulta(pAllFields)
            If Respuesta.Tables(0).Rows.Count > 0 Then
                ErrorMsg.Text = "El documento ya existe en la solicitud, borralo e intentalo de nuevo."
                Exit Sub
            End If

            Dim ici As ImageCodecInfo
            Dim eps As EncoderParameters
            ici = GetEncoderInfo("image/jpeg")
            eps = New EncoderParameters(1)
            eps.Param(0) = New EncoderParameter(System.Drawing.Imaging.Encoder.Quality, 90)

            imageJpeg = New Bitmap(Request.Files(0).InputStream)

            Dim fileName As String
            fileName = "D:\ArchivoDigital\Imgs\" & ImgNa
            imageJpeg.Save(fileName, ici, eps)
            RedimensionarIMG(fileName) 'RQ425
            Ruta = "http://50.57.200.160/ArchivoDigital/Imgs/" & ImgNa
            tNewValues = "'" & KDoc & "','" & Sol & "','" & pVers & "','" & Lado & "','" & Ruta & "','False','" & Nombre & "',GetDate()"
            tValues = tNewValues
            tRespuesta = DSService.AltaDatos(Session("GUsuario"), Session("GNombreUsuario"), pProgramName, pTable, pFields, tValues, ConnStr, ConnStrB)

            ErrorMsg.Text = "Archivo Agregado"
            Dim strScript As String
            strScript = "<script language=" & Chr(34) & "javascript" & Chr(34) & ">" & Chr(10) & Chr(13)
            strScript = strScript & "window.opener.parent.document.location.href='SoAgregaImagenes2.aspx?IDvar=" & Sol & "&IDtipo=" & Request.QueryString("IdTipo") & "&IDtemp=" & Request.QueryString("IDtemp") & "';" & Chr(10) & Chr(13)
            strScript = strScript & "</script>" & Chr(10) & Chr(13)
            ClientScript.RegisterClientScriptBlock(Me.GetType(), "ActualizaP" & Fup1.FileName, strScript)
        Catch ex As Exception
            If (imageJpeg Is Nothing) = False Then
                imageJpeg.Dispose()
            End If
            ErrorMsg.Text = "El archivo tiene extensión jpg pero no es una imagen..." & ex.Message & "--->" & ex.StackTrace
            Exit Sub
        End Try
        'Dim Img1 As Image
        'Dim Img2 As Image
        'Ruta = ""
        'Ruta1 = ""
        'Try
        '    If Fup1.FileName = "" Then
        '        ErrorMsg.Text = "Debe ingresar el nombre y ruta del archivo."
        '        Exit Sub
        '    End If
        '    'If Fup1.PostedFile.ContentLength > 800000 Then
        '    '    ErrorMsg.Text = "El Archivo es demasiado grande para agregarlo."
        '    '    Exit Sub
        '    'End If
        '    'If Fup1.FileName.ToUpper.IndexOf(".JPG") < 0 Then
        '    '    ErrorMsg.Text = "El archivo debe ser formato JPG."
        '    '    Exit Sub
        '    'End If

        '    DSService = New ServiciosWEB.Servicios
        '    tRespuesta = " IdSolicitud = '" & Request.QueryString("IdVar") & "'"
        '    tRespuesta = DSService.BajaDatos(Session("GUsuario"), Session("GNombreUsuario"), pProgramName, "SoSolicitudesAttach", tRespuesta, ConnStr, ConnStrB)
        '    KDoc = Request.QueryString("IDoc")
        '    Lado = Request.QueryString("Lado")
        '    Nombre = Request.QueryString("Nom")
        '    Sol = Request.QueryString("IDvar")
        '    Query = "KeyDocumento, IdSolicitud, MAX(PVersion) AS PVersion, Lado, Ruta, Correcta, DescDocumento From SoDocumentosXSolicitud Where KeyDocumento = '" & KDoc & "' And IdSolicitud = '" & Sol & "'  GROUP BY KeyDocumento, IdSolicitud, Lado, Ruta, Correcta, DescDocumento ORDER BY PVersion DESC"
        '    Respuesta = DSService.ConsultaGeneral(Query, ConnStr)
        '    If Respuesta.Tables(0).Rows.Count = 0 Then
        '        pVers = 1
        '    Else
        '        pVers = CInt(Respuesta.Tables(0).Rows(0).Item("PVersion")) + 1
        '    End If
        '    ImgNa = Sol & "img" & KDoc & Lado & "_" & pVers & ".jpg"
        '    ImgNaT = Sol & "img" & KDoc & Lado & "_" & pVers & "Temp.jpg"
        '    Ruta = "C:\\HTTP\\ArchivoDigital\\C15\\Imgs\\" & ImgNa
        '    Ruta1 = "C:\\HTTP\\ArchivoDigital\\C15\\Imgs\\" & ImgNaT
        '    pCondition = " Where KeyDocumento = '" & KDoc & "' And IdSolicitud = '" & Sol & "' And PVersion = '" & pVers & "'"
        '    'ErrorMsg.Text = KDoc & "-" & Lado & "-" & Nombre & "-" & Sol & "-" & ImgNa & "-" & Ruta & "-" & pCondition
        '    'Exit Sub
        '    Call Consulta(pAllFields)
        '    If Respuesta.Tables(0).Rows.Count > 0 Then
        '        ErrorMsg.Text = "El documento ya existe en la solicitud, borralo e intentalo de nuevo."
        '        Exit Sub
        '    End If
        '    Fup1.SaveAs(Ruta1)
        '    Fup1.Dispose()
        '    'Img2 = Image.FromFile("C:\\HTTP\\ArchivoDigital\\C15\\Imgs\\Demo.jpg", True)
        '    Img1 = Image.FromFile(Ruta1)

        '    Dim Width As Integer = Img1.Width
        '    Dim Height As Integer = Img1.Height
        '    Dim bitmap As Bitmap = New Bitmap(Width, Height, PixelFormat.Format8bppIndexed)
        '    Dim pal As ColorPalette = GetColorPalette(256)
        '    Dim i As Integer
        '    For i = 0 To 255
        '        Dim Alpha As Integer = 255
        '        Dim Intensity As Double = CDbl(i) * 255 / (256 - 1)
        '        pal.Entries(i) = Color.FromArgb(Alpha, Intensity, Intensity, Intensity)
        '    Next i
        '    bitmap.Palette = pal
        '    'bitmap.Palette = CType(Img2.Palette, System.Drawing.Bitmap.Palette)
        '    Dim BmpCopy As Bitmap = New Bitmap(Width, Height, PixelFormat.Format32bppArgb)
        '    Dim g As Graphics
        '    g = Graphics.FromImage(BmpCopy)
        '    g.PageUnit = GraphicsUnit.Pixel
        '    g.DrawImage(Img1, 0, 0, Width, Height)
        '    g.Dispose()
        '    Dim bitmapData As BitmapData
        '    Dim rect As Rectangle = New Rectangle(0, 0, Width, Height)
        '    bitmapData = bitmap.LockBits(rect, ImageLockMode.WriteOnly, PixelFormat.Format8bppIndexed)
        '    Dim pixels As IntPtr = bitmapData.Scan0
        '    Dim bits As Byte()
        '    Dim pBits As Int32
        '    If (bitmapData.Stride > 0) Then
        '        pBits = pixels.ToInt32()
        '    Else
        '        pBits = pixels.ToInt32() + bitmapData.Stride * (Height - 1)
        '    End If
        '    Dim stride As Integer = Math.Abs(bitmapData.Stride)
        '    ReDim bits(Height * stride) ' Allocate the working buffer.
        '    Dim row As Integer
        '    Dim col As Integer
        '    For row = 0 To Height - 1
        '        For col = 0 To Width - 1
        '            Dim pixel As Color
        '            Dim i8BppPixel As Integer = row * stride + col
        '            pixel = BmpCopy.GetPixel(col, row)
        '            Dim luminance As Double = (pixel.R * 0.299) + _
        '                                (pixel.G * 0.587) + _
        '                                (pixel.B * 0.114)
        '            Dim colorIndex As Double = Math.Round((luminance * (256 - 1) / 255))
        '            bits(i8BppPixel) = CByte(colorIndex)
        '        Next col
        '    Next row
        '    Win32API.CopyArrayTo(pBits, bits, Height * stride)
        '    bitmap.UnlockBits(bitmapData)
        '    bitmap.Save(Ruta, ImageFormat.Jpeg)
        '    BmpCopy.Dispose()
        '    bitmap.Dispose()

        '    Img1.Dispose()



        '    'Img1.Save(Ruta, FindEncoder(System.Drawing.Imaging.ImageFormat.Jpeg), New System.Drawing.Imaging.EncoderParameters())
        '    'Img1.Save(Ruta, System.Drawing.Imaging.ImageFormat.Gif)
        '    Ruta = "http://66.135.61.41/ArchivoDigital/C15/Imgs/" & ImgNa
        '    tNewValues = "'" & KDoc & "','" & Sol & "','" & pVers & "','" & Lado & "','" & Ruta & "','False','" & Nombre & "',GetDate()"
        '    tValues = tNewValues
        '    tRespuesta = DSService.AltaDatos(Session("GUsuario"), Session("GNombreUsuario"), pProgramName, pTable, pFields, tValues, ConnStr, ConnStrB)

        '    ErrorMsg.Text = "Archivo Agregado"
        '    Dim strScript As String
        '    strScript = "<script language=" & Chr(34) & "javascript" & Chr(34) & ">" & Chr(10) & Chr(13)
        '    strScript = strScript & "window.opener.parent.document.location.href='SoAgregaImagenes.aspx?IDvar=" & Sol & "&IDtipo=" & Request.QueryString("IdTipo") & "&IDtemp=" & Request.QueryString("IDtemp") & "';" & Chr(10) & Chr(13)
        '    strScript = strScript & "</script>" & Chr(10) & Chr(13)
        '    ClientScript.RegisterClientScriptBlock(Me.GetType(), "ActualizaP" & Fup1.FileName, strScript)
        'Catch ex As Exception
        '    If (Img1 Is Nothing) = False Then
        '        Img1.Dispose()
        '    End If
        '    If Ruta <> "" Then
        '        If File.Exists(Ruta) Then
        '            File.Delete(Ruta)
        '        End If
        '    End If
        '    ErrorMsg.Text = "El archivo tiene extensión jpg pero no es una imagen..." & ex.Message & "--->" & ex.StackTrace
        '    Exit Sub
        'Finally
        '    If Ruta1 <> "" Then
        '        If File.Exists(Ruta1) Then
        '            File.Delete(Ruta1)
        '        End If
        '    End If
        'End Try

        'DSService = New ServiciosWEB.Servicios
        'tRespuesta = " IdSolicitud = '" & Request.QueryString("IdVar") & "'"
        'tRespuesta = DSService.BajaDatos(Session("GUsuario"), Session("GNombreUsuario"), pProgramName, "SoSolicitudesAttach", tRespuesta, ConnStr, ConnStrB)
        'KDoc = Request.QueryString("IDoc")
        'Lado = Request.QueryString("Lado")
        'Nombre = Request.QueryString("Nom")
        'Sol = Request.QueryString("IDvar")
        'Query = "KeyDocumento, IdSolicitud, MAX(PVersion) AS PVersion, Lado, Ruta, Correcta, DescDocumento From SoDocumentosXSolicitud Where KeyDocumento = '" & KDoc & "' And IdSolicitud = '" & Sol & "'  GROUP BY KeyDocumento, IdSolicitud, Lado, Ruta, Correcta, DescDocumento ORDER BY PVersion DESC"
        'Respuesta = DSService.ConsultaGeneral(Query, ConnStr)
        'If Respuesta.Tables(0).Rows.Count = 0 Then
        '    pVers = 1
        'Else
        '    pVers = CInt(Respuesta.Tables(0).Rows(0).Item("PVersion")) + 1
        'End If
        'ImgNa = Sol & "img" & KDoc & Lado & "_" & pVers & ".jpg"
        'Ruta = "C:\\HTTP\\ArchivoDigital\\C15\\Imgs\\" & ImgNa
        'pCondition = " Where KeyDocumento = '" & KDoc & "' And IdSolicitud = '" & Sol & "' And PVersion = '" & pVers & "'"
        ''ErrorMsg.Text = KDoc & "-" & Lado & "-" & Nombre & "-" & Sol & "-" & ImgNa & "-" & Ruta & "-" & pCondition
        ''Exit Sub
        'Call Consulta(pAllFields)
        'If Respuesta.Tables(0).Rows.Count > 0 Then
        '    ErrorMsg.Text = "El documento ya existe en la solicitud, borralo e intentalo de nuevo."
        '    Exit Sub
        'End If
        'Fup1.SaveAs(Ruta)
        'Ruta = "http://www.c15.mx/ArchivoDigital/C15/Imgs/" & ImgNa
        'tNewValues = "'" & KDoc & "','" & Sol & "','" & pVers & "','" & Lado & "','" & Ruta & "','False','" & Nombre & "',GetDate()"
        'tValues = tNewValues
        'tRespuesta = DSService.AltaDatos(Session("GUsuario"), Session("GNombreUsuario"), pProgramName, pTable, pFields, tValues, ConnStr, ConnStrB)

        'ErrorMsg.Text = "Archivo Agregado"
        'Dim strScript As String
        'strScript = "<script language=" & Chr(34) & "javascript" & Chr(34) & ">" & Chr(10) & Chr(13)
        'strScript = strScript & "window.opener.parent.document.location.href='SoAgregaImagenes.aspx?IDvar=" & Sol & "&IDtipo=" & Request.QueryString("IdTipo") & "&IDtemp=" & Request.QueryString("IDtemp") & "';" & Chr(10) & Chr(13)
        'strScript = strScript & "</script>" & Chr(10) & Chr(13)
        'ClientScript.RegisterClientScriptBlock(Me.GetType(), "ActualizaP" & Fup1.FileName, strScript)
    End Sub

    Private Function GetColorPalette(ByVal nColors As Integer) As ColorPalette
        ' Assume monochrome image.
        Dim bitscolordepth As PixelFormat = System.Drawing.Imaging.PixelFormat.Format1bppIndexed
        Dim palette As System.Drawing.Imaging.ColorPalette 'The Palette we are stealing
        Dim bitmap As Bitmap        'The source of the stolen palette

        ' Determine number of colors.
        If nColors > 2 Then
            bitscolordepth = PixelFormat.Format4BppIndexed
        End If
        If (nColors > 16) Then
            bitscolordepth = PixelFormat.Format8BppIndexed
        End If

        ' Make a new Bitmap object to get its Palette.
        bitmap = New Bitmap(1, 1, bitscolordepth)

        palette = bitmap.Palette    ' Grab the palette

        bitmap.Dispose()            ' cleanup the source Bitmap

        Return palette              ' Send the palette back
    End Function


    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged

    End Sub
End Class
