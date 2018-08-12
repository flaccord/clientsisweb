Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc

Public Class ConexionBD
    Dim ConexionStr As String = ConfigurationManager.ConnectionStrings("dbclientsisweb").ConnectionString
    Dim cn As SqlConnection

    Public Sub Conectar()
        cn = New SqlConnection(ConexionStr)
        cn.Open()
    End Sub

    Public Sub DesConectar()
        If cn.State = ConnectionState.Open Then
            cn.Close()
        End If
    End Sub

    Public Function EjecutarConsultaSQL(ByVal comando As String) As DataSet
        Dim cmd As New SqlCommand()
        cmd.CommandText = comando
        cmd.Connection = cn

        Dim Adapter As New SqlDataAdapter(cmd)
        Dim ds As DataSet = New DataSet
        Adapter.Fill(ds)

        Return ds
    End Function

    Public Sub EjecutarComandoSQL(ByVal comando As String)
        Dim cmd As New SqlCommand()
        cmd.CommandText = comando
        cmd.Connection = cn
        cmd.ExecuteNonQuery()
    End Sub
End Class


