Imports System.Net.NetworkCredential
Imports System.Net
Imports System.IO
Imports referenciaws

Partial Class solicitudcliente
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'GuardarCliente()

        Catch ex As Exception

            MsgBox("Ha ocurrido un error para Conectarse al WebService!", MsgBoxStyle.Critical, "Advertencia")

        End Try
    End Sub

    Sub GuardarCliente()
        'Crea la referencia al web service de java
        Dim jws As New referenciaws.ConsultaBuroCreditoWebServiceImplService
        Dim oPuedePesar As New referenciaws.datosBuroCredito
        oPuedePesar.apellidoMaterno = "BELLO"
        oPuedePesar.apellidoPaterno = "QUALITYSIX"
        oPuedePesar.calle = "16 DE SEPTIEMBRE 504 1"
        oPuedePesar.ciudad = ""
        oPuedePesar.codigoPostal = "42080"
        oPuedePesar.colonia = "VENTA PRIETA"
        oPuedePesar.creditoAutomotriz = ""
        oPuedePesar.creditoHipotecario = ""
        oPuedePesar.cuentaTarjetaCredito = ""
        oPuedePesar.estado = "HGO"
        oPuedePesar.fechaNacimiento = "05121968"
        oPuedePesar.lote = ""
        oPuedePesar.manzana = ""
        oPuedePesar.municipio = "PACHUCA DE SOTO"
        oPuedePesar.numeroExterior = ""
        oPuedePesar.numeroInterior = ""
        oPuedePesar.primerNombre = "TESTFOUR"
        oPuedePesar.referenciaCliente = ""
        oPuedePesar.rfc = "MEBC681205CH2"
        oPuedePesar.segundoNombre = "ALONSO"
        oPuedePesar.tipoConsulta = "BC"
        oPuedePesar.ultimosCuatroDigitosTarjetaCredito = ""

        'Si devuelve falso es porque se inserto ese dato
        Dim oPuedePesarResponse As referenciaws.respuestaBuroCredito = jws.consultarBuroCredito(oPuedePesar)
        If oPuedePesarResponse.error Then
            'MsgBox("El cliente ha sido registrado Correctamente!", MsgBoxStyle.Information, "Notificacion")
            Mensjburo.Text = "- " & oPuedePesarResponse.error & "- " & oPuedePesarResponse.mensaje & "- " & oPuedePesarResponse.errorSpecified & "- " & oPuedePesarResponse.fechaConsulta & "- " & oPuedePesarResponse.nombreCliente & "- " & oPuedePesarResponse.referenciaBuroCredito
        Else
            'MsgBox("El cliente No ha sido registrado, Verifique!", MsgBoxStyle.Exclamation, "Notificacion")
            ErrorMsg.Text = "El cliente ha sido registrado Correctamente!"
            Mensjburo.Text = "- " & oPuedePesarResponse.error & "- " & oPuedePesarResponse.mensaje & "- " & oPuedePesarResponse.errorSpecified & "- " & oPuedePesarResponse.fechaConsulta & "- " & oPuedePesarResponse.nombreCliente & "- " & oPuedePesarResponse.referenciaBuroCredito
        End If

    End Sub

End Class


