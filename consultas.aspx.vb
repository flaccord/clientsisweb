Imports System.Net.NetworkCredential
Imports System.Net
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.Odbc

Partial Class consultas
    Inherits System.Web.UI.Page
	Dim RefBuro As String
	
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Try
		
		'-- Si no hay usuario logueado, que vaya directamente al loguin
		If Session("ActiveUser") = "" Then
			Response.Write("<script language='JavaScript'>top.location.href='LoginAcceso.aspx';</script>")
		End If
		'--
		
		RefBuro = Session("ReferenciaBuro")
		if RefBuro <> "" Then
			'Response.Write("<script language='JavaScript'>alert('El cliente ha sido registrado Correctamente! Referencia No. " & RefBuro & "');</script>")
		Else
			RefBuro = Request.QueryString("Ref")
		End If
		
		'llena los campos de Puntos y Semaforo
		if RefBuro <> "" Then
			ListaPuntosySemaforo()
		Else
			tablepuntosysema.Visible = False
			Table6.Visible = False
		End If
		
		
		'Creamos la cadena de conexion'
		Dim strConexion As String
		strConexion = ConfigurationManager.ConnectionStrings("dbMysql").ConnectionString
		
		'Creamos el objeto conexion para enlazar con el servidor de datos
		Dim oConnection As OdbcConnection = New OdbcConnection(strConexion)

		'Creamos la sentencia SQL que devuelva los datos deseados
		Dim strSQL As String
		if RefBuro = "" Then
			strSQL = "SELECT fecha_consulta,id,rfc,concat(primer_nombre,' ',segundo_nombre,' ',apellido_paterno,' ',apellido_materno) as nombre,date_format(fecha_nacimiento,'%d/%m/%Y') as fecha_nacimiento,referencia_buro,referencia_cliente,ifnull(s.codigo_score,'') as codigo_score,ifnull(s.valor_score,'') as valor_score FROM consulta c left outer join score s on s.id_consulta = c.id order by fecha_consulta; "
		Else
			strSQL = "SELECT fecha_consulta,id,rfc,concat(primer_nombre,' ',segundo_nombre,' ',apellido_paterno,' ',apellido_materno) as nombre,date_format(fecha_nacimiento,'%d/%m/%Y') as fecha_nacimiento,referencia_buro,referencia_cliente,ifnull(s.codigo_score,'') as codigo_score,ifnull(s.valor_score,'') as valor_score FROM consulta c left outer join score s on s.id_consulta = c.id WHERE referencia_buro = '" & RefBuro & "' order by fecha_consulta; "
		End If

		'Instanciamos el objeto Command
		'recibe la sentencia a ejecutar y la conexión
		Dim oDataAdapter As OdbcDataAdapter = New OdbcDataAdapter(strSQL, oConnection)
		Dim oDataSet As DataSet = New DataSet()
		oDataAdapter.Fill(oDataSet)
		GridView1.DataSource = oDataSet
		GridView1.DataBind()
		
		Session("ReferenciaBuro") = ""

		If GridView1.Rows.Count > 0 Then
		   'ErrorMsg.Text = ""
		Else
		   'ErrorMsg.Text = "No se encontraron registros."
		   'Response.Redirect("rfcconsulta.htm?msj=noreg")
		End If
		

		Catch ex As Exception
			
		End Try
    End Sub
	
	Public Function validarcaptcha() As String
		
		'start building recaptch api call
		Dim sb = new StringBuilder()
		sb.Append("https://www.google.com/recaptcha/api/siteverify?secret=")
		
		'our secret key
        sb.Append("6LebmB8TAAAAAKT6PyA07Uh29JnBuVkgoXBIk6b5")
		
		'response from recaptch control
        sb.Append("&")
        sb.Append("response=")
        sb.Append(Request.QueryString("g-recaptcha-response"))
		
		'client ip address
		sb.Append("&")
        sb.Append("remoteip=")
		sb.Append("")
		
		Dim WhatIsMyIPUrl As String = sb.ToString()
		Dim req As HttpWebRequest
		Dim res As HttpWebResponse
		Dim Stream As IO.Stream
		Dim status As String = String.Empty
		Dim sr As StreamReader
	 
		Try
			req = WebRequest.Create(WhatIsMyIPUrl)
			res = req.GetResponse()
			Stream = res.GetResponseStream()
			sr = New StreamReader(Stream)
			status = sr.ReadToEnd()
			sr.Dispose()
		Catch ex As Exception
	
		End Try
		Return status
	End Function
	
	Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Redirect("index.html")
    End Sub
	
	Public Function ListaPuntosySemaforo() 
        Dim _pys As String
        Dim _pysdatos As DataSet = New DataSet
        Dim objConexion As New ConexionBD()
        objConexion.Conectar()
        _pys = "SELECT Id,Puntos,Semaforo,rfc,primernombre + ' ' + segundonombre + ' ' + apellidopaterno + ' ' + apellidomaterno as nombre " & _
                "FROM registro_clientes WHERE referenciaburo = " & RefBuro & ""
        _pysdatos = objConexion.EjecutarConsultaSQL(_pys)
        objConexion.DesConectar()
        objConexion = Nothing
		puntosdato.ToolTip = "Antiguedad domicilio: " + Environment.NewLine + "Vivienda Propia: " + Environment.NewLine + "Tipo de Empleo: " + Environment.NewLine + "Antiguedad Laboral: " + Environment.NewLine + "Score: "
		puntosdato.BorderStyle = BorderStyle.Ridge
		puntosdato.Text = _pysdatos.Tables(0).Rows(0).Item("Puntos") 
		semaforodato.Text = _pysdatos.Tables(0).Rows(0).Item("Semaforo")
		If semaforodato.Text = "Rojo" Then
            semaforodato.ForeColor = Drawing.Color.White
            semaforodato.BackColor = Drawing.Color.Red
        End If
        If semaforodato.Text = "Amarillo" Then
            semaforodato.ForeColor = Drawing.Color.White
            semaforodato.BackColor = Drawing.Color.Yellow
        End If
        If semaforodato.Text = "Verde" Then
            semaforodato.ForeColor = Drawing.Color.White
            semaforodato.BackColor = Drawing.Color.Green
        End If
		Buttondoc.Attributes.Add("OnClick", "javascript:return verDocumentos('"& _pysdatos.Tables(0).Rows(0).Item("Id") &"','"& _pysdatos.Tables(0).Rows(0).Item("rfc") &"','"& _pysdatos.Tables(0).Rows(0).Item("nombre") &"');")
    End Function

End Class
