Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc

Public Class DocDigitalizado
    Dim KeyReferenciaValue As Decimal
    Dim KeyDocumentoValue, VersionValue As Integer
    Dim RutaValue As String

#Region "Properties"
    Property KeyReferencia() As Decimal
        Get
            Return KeyReferenciaValue
        End Get
        Set(ByVal value As Decimal)
            KeyReferenciaValue = value
        End Set
    End Property

    Property KeyDocumento() As Integer
        Get
            Return KeyDocumentoValue
        End Get
        Set(ByVal value As Integer)
            KeyDocumentoValue = value
        End Set
    End Property

    Property Ruta() As String
        Get
            Return RutaValue
        End Get
        Set(ByVal value As String)
            RutaValue = value
        End Set
    End Property

    Property Version() As Integer
        Get
            Return VersionValue
        End Get
        Set(ByVal value As Integer)
            VersionValue = value
        End Set
    End Property
#End Region

    Public Sub InsertaDocumentoDigitalizado()
        Dim _cmd As String
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        _cmd = "Insert Into Docs_Digitaliza_Ref (IDReferencia, IDDocumento, Ruta, Version) Values ('" & KeyReferenciaValue & "','" & KeyDocumentoValue & "','" & RutaValue & "','" & VersionValue & "')"
        objConexion.EjecutarComandoSQL(_cmd)
        objConexion.DesConectar()
        objConexion = Nothing
    End Sub

    Public Function GetVersionDocumento() As Integer
        Dim _cmd As String
        Dim _ds As DataSet = New DataSet
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        _cmd = "Select ISNULL(MAX(Version) + 1, 1) From Docs_Digitaliza_Ref Where IDReferencia = '" & KeyReferenciaValue & "' And IDDocumento = '" & KeyDocumentoValue & "'"
        _ds = objConexion.EjecutarConsultaSQL(_cmd)
        objConexion.DesConectar()
        objConexion = Nothing

        Return _ds.Tables(0).Rows(0).Item(0)
    End Function
End Class


