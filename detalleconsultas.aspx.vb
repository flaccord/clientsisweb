Imports System.Net.NetworkCredential
Imports System.Net
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc

Partial Class detalleconsultas
    Inherits System.Web.UI.Page
	
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Try
		
		'-- Si no hay usuario logueado, que vaya directamente al loguin
		If Session("ActiveUser") = "" Then
			Response.Write("<script language='JavaScript'>top.location.href='LoginAcceso.aspx';</script>")
		End If
		'--
		
		Dim identra As String
		Dim valtipo As Integer
		identra = Request.QueryString("id")
		if identra = "" Then
			identra = Request.QueryString("Ref")
			if identra = "" Then
				identra = "111111111"
				valtipo = 0
			Else
				valtipo = 1
			End If
		Else 
			valtipo = 0
		End If
		
		'Creamos la cadena de conexion'
		Dim strConexion As String
		strConexion = ConfigurationManager.ConnectionStrings("dbMysql").ConnectionString
		
		'Creamos el objeto conexion para enlazar con el servidor de datos
		Dim oConnection As OdbcConnection = New OdbcConnection(strConexion)

		'Creamos la sentencia SQL que devuelva los datos deseados
		Dim strSQL As String
		'strSQL = "SELECT id_consulta,date_format(fecha_actualizacion,'%d/%m/%Y') as fecha_actualizacion,nombre_usuario,p.descripcion as producto, date_format(fecha_apertura_cuenta_credito,'%d/%m/%Y') as fecha_credito, date_format(fecha_cierre,'%d/%m/%Y') as fecha_cierre,saldo_actual,saldo_vencido,c.mop,historico_pagos,clave_observacion,m.descripcion,o.nombre FROM cuenta_credito c left outer join  tipo_contrato_producto p on p.tipo = c.tipo_contrato_producto left outer join  mop m on m.mop = c.mop left outer join  clave_observacion o on o.clave = c.clave_observacion where c.id_consulta = " & identra
		If valtipo = 0 Then
			strSQL = "SELECT id_consulta,date_format(fecha_actualizacion,'%d/%m/%Y') as fecha_actualizacion,nombre_usuario,p.descripcion as producto, date_format(fecha_apertura_cuenta_credito,'%d/%m/%Y') as fecha_credito, date_format(fecha_cierre,'%d/%m/%Y') as fecha_cierre,saldo_actual,saldo_vencido,c.mop,historico_pagos,clave_observacion,m.descripcion,o.nombre FROM cuenta_credito c left outer join  consulta con on con.Id = c.id_consulta left outer join  tipo_contrato_producto p on p.tipo = c.tipo_contrato_producto left outer join  mop m on m.mop = c.mop left outer join  clave_observacion o on o.clave = c.clave_observacion where c.id_consulta = " & identra
		Else
			strSQL = "SELECT id_consulta,date_format(fecha_actualizacion,'%d/%m/%Y') as fecha_actualizacion,nombre_usuario,p.descripcion as producto, date_format(fecha_apertura_cuenta_credito,'%d/%m/%Y') as fecha_credito, date_format(fecha_cierre,'%d/%m/%Y') as fecha_cierre,saldo_actual,saldo_vencido,c.mop,historico_pagos,clave_observacion,m.descripcion,o.nombre FROM cuenta_credito c left outer join  consulta con on con.Id = c.id_consulta left outer join  tipo_contrato_producto p on p.tipo = c.tipo_contrato_producto left outer join  mop m on m.mop = c.mop left outer join  clave_observacion o on o.clave = c.clave_observacion where con.referencia_buro = '" & identra & "'"
		End If

		'Instanciamos el objeto Command
		'recibe la sentencia a ejecutar y la conexión
		Dim oDataAdapter As OdbcDataAdapter = New OdbcDataAdapter(strSQL, oConnection)
		Dim oDataSet As DataSet = New DataSet()
		oDataAdapter.Fill(oDataSet)
		GridView1.DataSource = oDataSet
		GridView1.DataBind()

		If GridView1.Rows.Count > 0 Then
		   'ErrorMsg.Text = ""
		Else
		   ErrorMsg.Text = "No se encontraron registros."
		   'Response.Redirect("rfcconsulta.htm?msj=noreg")
		End If
		

		Catch ex As Exception
			
		End Try
    End Sub
	
End Class
