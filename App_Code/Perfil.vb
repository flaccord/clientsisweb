Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc

Public Class Perfil
    Dim KeyValue, DescValue As String

    Property Key() As String
        Get
            Return KeyValue
        End Get
        Set(ByVal value As String)
            KeyValue = value
        End Set
    End Property

    Property Descripcion() As String
        Get
            Return DescValue
        End Get
        Set(ByVal value As String)
            DescValue = value
        End Set
    End Property

    Public Function ObtieneListadoPerfiles(Optional ByVal Order As String = "ASC") As DataSet
        Dim ds As DataSet = New DataSet
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        ds = objConexion.EjecutarConsultaSQL("Select KeyPerfil, DescPerfil From Perfiles_Usuarios Order By DescPerfil")
        objConexion.DesConectar()
        objConexion = Nothing
        Return ds
    End Function
End Class


