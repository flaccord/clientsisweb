Imports System
Imports System.Collections
Imports System.ComponentModel
Imports System.Data
Imports System.Drawing
Imports System.Text
Imports System.IO
Imports iTextSharp
Imports iTextSharp.text
Imports iTextSharp.text.pdf
Imports iTextSharp.text.xml

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'ListFieldNames()
        'FillForm()
        Dim s As String = "78500.00"
        TextBox1.Text = Num2Text(s, True)
    End Sub

    Private Sub ListFieldNames()
        Dim pdfTemplate As String = Server.MapPath("Solicitud de Crédito v2 Crediamigo LLENO.pdf")
        Dim pdfReader As New PdfReader(pdfTemplate)
        Dim sb As New StringBuilder()
        Dim de As New Generic.KeyValuePair(Of String, iTextSharp.text.pdf.AcroFields.Item)
        For Each de In pdfReader.AcroFields.Fields
            sb.Append(de.Key.ToString() & vbCrLf)
        Next
        TextBox1.Text = sb.ToString
    End Sub

    Private Sub FillForm()
        Dim sTmp As String = ""
        Dim pdfTemplate As String = Server.MapPath("Solicitud de Crédito v2 Crediamigo LLENO.pdf")
        Dim newFile As String = "D:\ArchivoDigital\completed_fw4.pdf"
        Dim pdfReader As New PdfReader(pdfTemplate)
        Dim pdfStamper As New PdfStamper(pdfReader, New FileStream(newFile, FileMode.Create))
        Dim pdfFormFields As AcroFields = pdfStamper.AcroFields
        pdfFormFields.SetField("apellido1", "PEREZ")
        pdfFormFields.SetField("apellido2", "GONZALEZ")
        pdfFormFields.SetField("Nombres", "MARIA DEL CARMEN")
        pdfFormFields.SetField("nacionalidad", "VENEZOLANA")
        pdfFormFields.SetField("lnacimiento", "CARACAS")
        pdfFormFields.SetField("dianac", "05")
        pdfFormFields.SetField("mesnac", "02")
        pdfFormFields.SetField("agnonac", "1963")
        pdfFormFields.SetField("dircalle", "Palo Santo")
        pdfFormFields.SetField("dirnroext", "20")
        pdfFormFields.SetField("dirnroint", "")
        pdfFormFields.SetField("dircolonia", "Lomas Altas")
        pdfFormFields.SetField("delmun", "Miguel Hidalgo")
        pdfFormFields.SetField("cp", "11250")
        pdfFormFields.SetField("ciudad", "Ciudad de México")
        pdfFormFields.SetField("estado", "Distrito Federal")
        pdfFormFields.SetField("casapropia", "yes")
        pdfFormFields.SetField("casarenta", "")
        pdfFormFields.SetField("montorenta", "")
        pdfFormFields.SetField("familiares", "")
        pdfFormFields.SetField("otro", "yes")
        pdfFormFields.SetField("tiemporesidencia", "20 años")
        pdfFormFields.SetField("nrofamiliares", "3")
        pdfFormFields.SetField("telcasa", "6429393")
        pdfFormFields.SetField("horariocontact", "")
        pdfFormFields.SetField("celular", "5538484285")
        pdfFormFields.SetField("email", "hanino@crediamigo.com.mx")
        pdfFormFields.SetField("soltero", "")
        pdfFormFields.SetField("casado", "")
        pdfFormFields.SetField("unionlibre", "yes")
        pdfFormFields.SetField("viudo", "no")
        pdfFormFields.SetField("otro2", "")
        pdfFormFields.SetField("nrodependendientes", "2")
        pdfFormFields.SetField("rfc", "123456789")
        pdfFormFields.SetField("montosol", "50000")
        pdfFormFields.SetField("importeletra", "Cincuenta mil pesos MXP")
        pdfFormFields.SetField("destrefinanciamiento", "yes")
        pdfFormFields.SetField("destvivienda", "")
        pdfFormFields.SetField("destpersonal", "yes")
        pdfFormFields.SetField("destmedico", "")
        pdfFormFields.SetField("desteducacion", "yes")
        pdfFormFields.SetField("destauto", "yes")
        pdfFormFields.SetField("destvacaciones", "")
        pdfFormFields.SetField("destnegocio", "")
        pdfFormFields.SetField("destservicios", "")
        pdfFormFields.SetField("destmuebles", "")
        pdfFormFields.SetField("destimprevisto", "")
        pdfFormFields.SetField("destfamilia", "")
        pdfFormFields.SetField("destliquidez", "")
        pdfFormFields.SetField("destotros", "yes")
        pdfFormFields.SetField("otros3", "ahorro")

        pdfFormFields.SetField("dependencia", "Ayuntamiento de la Patagonia")
        pdfFormFields.SetField("profesion", "Secretaria contable")
        pdfFormFields.SetField("dirtrabajo", "Avenida Vasco de Quiroga 160 Of. 305")
        pdfFormFields.SetField("coltrabajo", "Santa Fe")
        pdfFormFields.SetField("ciudadtrabajo", "Ciudad de México")
        pdfFormFields.SetField("cptrabajo", "11471")
        pdfFormFields.SetField("estadotrabajo", "Distrito Federal")
        pdfFormFields.SetField("administrativo", "Sí")
        pdfFormFields.SetField("operativo", "")
        pdfFormFields.SetField("maestro", "")
        pdfFormFields.SetField("policia", "Si")
        pdfFormFields.SetField("pensionado", "")
        pdfFormFields.SetField("base", "")
        pdfFormFields.SetField("sindicalizado", "")
        pdfFormFields.SetField("basesindi", "yes")
        pdfFormFields.SetField("confianza", "")
        pdfFormFields.SetField("jubilado", "")
        pdfFormFields.SetField("antiguedad", "10 años")
        pdfFormFields.SetField("tellada", "018002245632")
        pdfFormFields.SetField("telladaext", "250")
        pdfFormFields.SetField("hordesdelada", "08:00")
        pdfFormFields.SetField("horhastalada", "18:00")
        pdfFormFields.SetField("ingreso", "09/2002")
        pdfFormFields.SetField("ingresomensual", "10500")

        pdfFormFields.SetField("referencia1", "ANITA DE LA MACORRA")
        pdfFormFields.SetField("tellada1", "656262632")
        pdfFormFields.SetField("horcontact1", "10:00 a 13:00")
        pdfFormFields.SetField("referencia2", "JUAN DEL POZO")
        pdfFormFields.SetField("tellada2", "98629292")
        pdfFormFields.SetField("horcontact2", "09:00 a 16:00")
        pdfFormFields.SetField("referencia3", "FELIPE DE LAS CASAS")
        pdfFormFields.SetField("tellada3", "313131313131")
        pdfFormFields.SetField("horcontact3", "18:00 a 20:00")
        pdfFormFields.SetField("referencia4", "MARCO POLO")
        pdfFormFields.SetField("tellada4", "6161616161")
        pdfFormFields.SetField("horcontact4", "21:00 a 22:00")

        pdfFormFields.SetField("sucursal", "FRAY SERVANDO")
        pdfFormFields.SetField("nroempleado", "582")
        pdfFormFields.SetField("folio", "639")

        pdfStamper.FormFlattening = True
        pdfStamper.Close()
    End Sub

    Public Function Num2Text(ByVal value As Double, ByVal first As Boolean) As String
        Dim valores() As String
        Dim valor As String = value
        Dim entero As Decimal = 0
        Dim fraccion As Decimal = 0
        If valor.Contains(".") OrElse valor.Contains(",") Then
            valores = Split(valor, ".")
            value = CDec(valores(0))
            If valores.Length > 1 Then
                fraccion = CDec(valores(1))
            End If
        End If
        Select Case value
            Case 0 : Num2Text = "CERO"
            Case 1 : Num2Text = "UN"
            Case 2 : Num2Text = "DOS"
            Case 3 : Num2Text = "TRES"
            Case 4 : Num2Text = "CUATRO"
            Case 5 : Num2Text = "CINCO"
            Case 6 : Num2Text = "SEIS"
            Case 7 : Num2Text = "SIETE"
            Case 8 : Num2Text = "OCHO"
            Case 9 : Num2Text = "NUEVE"
            Case 10 : Num2Text = "DIEZ"
            Case 11 : Num2Text = "ONCE"
            Case 12 : Num2Text = "DOCE"
            Case 13 : Num2Text = "TRECE"
            Case 14 : Num2Text = "CATORCE"
            Case 15 : Num2Text = "QUINCE"
            Case Is < 20 : Num2Text = "DIECI" & Num2Text(value - 10, False)
            Case 20 : Num2Text = "VEINTE"
            Case Is < 30 : Num2Text = "VEINTI" & Num2Text(value - 20, False)
            Case 30 : Num2Text = "TREINTA"
            Case 40 : Num2Text = "CUARENTA"
            Case 50 : Num2Text = "CINCUENTA"
            Case 60 : Num2Text = "SESENTA"
            Case 70 : Num2Text = "SETENTA"
            Case 80 : Num2Text = "OCHENTA"
            Case 90 : Num2Text = "NOVENTA"
            Case Is < 100 : Num2Text = Num2Text(Int(value \ 10) * 10, False) & " Y " & Num2Text(value Mod 10, False)
            Case 100 : Num2Text = "CIEN"
            Case Is < 200 : Num2Text = "CIENTO " & Num2Text(value - 100, False)
            Case 200, 300, 400, 600, 800 : Num2Text = Num2Text(Int(value \ 100), False) & "CIENTOS"
            Case 500 : Num2Text = "QUINIENTOS"
            Case 700 : Num2Text = "SETECIENTOS"
            Case 900 : Num2Text = "NOVECIENTOS"
            Case Is < 1000 : Num2Text = Num2Text(Int(value \ 100) * 100, False) & " " & Num2Text(value Mod 100, False)
            Case 1000 : Num2Text = "MIL"
            Case Is < 2000 : Num2Text = "MIL " & Num2Text(value Mod 1000, False)
            Case Is < 1000000 : Num2Text = Num2Text(Int(value \ 1000), False) & " MIL"
                If value Mod 1000 Then Num2Text = Num2Text & " " & Num2Text(value Mod 1000, False)
            Case 1000000 : Num2Text = "UN MILLON"
            Case Is < 2000000 : Num2Text = "UN MILLON " & Num2Text(value Mod 1000000, False)
            Case Is < 1000000000000.0# : Num2Text = Num2Text(Int(value / 1000000), False) & " MILLONES "
                If (value - Int(value / 1000000) * 1000000) Then Num2Text = Num2Text & " " & Num2Text(value - Int(value / 1000000) * 1000000, False)
            Case 1000000000000.0# : Num2Text = "UN BILLON"
            Case Is < 2000000000000.0# : Num2Text = "UN BILLON " & Num2Text(value - Int(value / 1000000000000.0#) * 1000000000000.0#, False)
            Case Else : Num2Text = Num2Text(Int(value / 1000000000000.0#), False) & " BILLONES"
                If (value - Int(value / 1000000000000.0#) * 1000000000000.0#) Then Num2Text = Num2Text & " " & Num2Text(value - Int(value / 1000000000000.0#) * 1000000000000.0#, False)
        End Select
        If fraccion <> 0 Then
            Num2Text = Num2Text & " PESOS " & fraccion & "/100 M.N"
        ElseIf first Then
            Num2Text = Num2Text & " PESOS 00/100 M.N"
        End If
    End Function
End Class
