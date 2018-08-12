Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc

Public Class Session
    Dim KeyUsuarioValue As String

#Region "Properties"
    Property KeyUsuario() As String
        Get
            Return KeyUsuarioValue
        End Get
        Set(ByVal value As String)
            KeyUsuarioValue = value
        End Set
    End Property

#End Region

    Public Sub CreaSession()
        Dim _cmd As String
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        _cmd = "Insert Into Session_Usuarios (KeyUsuario, FechaInicio, FechaFin) Values ('" & KeyUsuarioValue & "',GETDATE(),'9999-12-31 23:59:59.000')"
        objConexion.EjecutarComandoSQL(_cmd)
        objConexion.DesConectar()
        objConexion = Nothing
    End Sub

    Public Sub TerminaSession()
        Dim _cmd As String
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        _cmd = "Update Session_Usuarios Set FechaFin = GETDATE() Where KeyUsuario = '" & KeyUsuarioValue & "' And Cast(FechaFin as DATE) = '9999-12-31'"
        objConexion.EjecutarComandoSQL(_cmd)
        objConexion.DesConectar()
        objConexion = Nothing
    End Sub

    Public Function consulta() As String
        Return "Update Session_Usuarios Set FechaFin = GETDATE() Where KeyUsuario = '" & KeyUsuarioValue & "' And Cast(FechaFin as DATE) = '9999-12-31'"
    End Function

    Public Function HaySessionActiva() As Boolean
        Dim _cmd As String
        Dim _ds As DataSet = New DataSet
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        _cmd = "Select count(*) From Session_Usuarios Where KeyUsuario = '" & KeyUsuarioValue & "' And Cast(FechaFin as DATE) = '9999-12-31'"
        _ds = objConexion.EjecutarConsultaSQL(_cmd)
        objConexion.DesConectar()
        objConexion = Nothing

        If CInt(_ds.Tables(0).Rows(0).Item(0)) > 0 Then
            Return True
        Else
            Return False
        End If
    End Function
End Class


