<%@ Page Language="VB" AutoEventWireup="false" CodeFile="consultas.aspx.vb" Inherits="consultas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>

<style>
div.divGrid{width:98%; margin:1.5% 1%;}
 
.scroll{overflow: scroll; overflow-y: hidden;}
 
.grid{font-size:10pt; font-weight: normal; width:100%;}
 
.grid .datatable{width:100%; border:none; padding:0px; margin:0px; color:#333;}
 
.grid .datatable th
, .grid .datatable td
{
    padding:6px 3px; 
    font-weight:bold; 
    text-align:left; 
    font-size:10pt; 
    border-bottom:solid 1px #BDBDBD;
    vertical-align:middle;
	font-family:Consolas, "Andale Mono", "Lucida Console", "Lucida Sans Typewriter", Monaco, "Courier New", monospace;
}
 
.grid .datatable th a{color:inherit; text-decoration:none;}
 
.grid .datatable th a:hover{color:#0B0B3B;}
 
.grid .datatable td{font-weight:normal; font-size:9pt; }
 
/* FILAS DE LA TABLA */
.grid .datatable tr.even {background-color:#F2F2F2;}
 
/* FILAS ALTERNATIVAS */
.grid .datatable tr.odd {background-color:#FFF;}
 
/* PAGINACION DEL GRIDIVIEW */
.grid .pager{width:100%; overflow:hidden;}
 
.grid .pager input[type=submit]
{
    float:left;
    margin:0px;
    padding:5px 7px;
    border:solid 1px #BDBDBD;
    font-size:8pt;
    font-weight:bold;
    background:none;
    background-color:#FFF;
    border-right:none;
    cursor:pointer;
}
 
.grid .pager input[type=submit]:hover{color:#0080FF;}
 
.grid .pager .ultimo{border:solid 1px #BDBDBD !important;}
 
.Tablapuntos{
    padding:6px 3px; 
    font-weight:bold; 
    text-align:left; 
    font-size:14pt; 
    border-bottom:solid 1px #BDBDBD;
    vertical-align:middle;
	font-family:Consolas, "Andale Mono", "Lucida Console", "Lucida Sans Typewriter", Monaco, "Courier New", monospace;
}
 
.SelectedRow{background-color:#EFFBFB; opacity: 0.8;}
 
/* ORDEN DE COLUMNAS */
th.Ascending
, th.Descending
{
    background-position:left center;
    background-repeat:no-repeat;
    padding-left: 20px !important;
}
</style>
<script type="text/javascript" src='js/BASE64JS.js'></script>
<script language="javascript" type="text/javascript">

	function AJAXCrearObjeto() {
		var xmlhttp = false;
		try {
			xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (E) {
				xmlhttp = false;
			}
		}

		if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
			xmlhttp = new XMLHttpRequest();
		}
		return xmlhttp;
	}

	function loadAspx(url, id) {
		var ajax = AJAXCrearObjeto();
		ajax.open("GET", url, "true");
		ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		ajax.send('null');
		var midiv = document.getElementById(id);

		ajax.onreadystatechange = function() {
			if (ajax.readyState == 4) {
				midiv.innerHTML = ajax.responseText;
			}
		}	
	}
	
	function verCreditos(cred){
        if(cred != ''){
			var w = 1200;
            var h = 500;
            var LeftPosition=(screen.width)?(screen.width-w)/2:100;
            var TopPosition=(screen.height)?(screen.height-h)/2:100;
            var config = "width="+w+", height="+h+", left="+LeftPosition+", top="+TopPosition+", toolbar=0,location=0,status=1,menubar=0,directories=0,scrollbars=1,resizable=0"; 
            var urlace = "detalleconsultas.aspx?id="+ cred;
            window.open(urlace,"Detalle Creditos",config); 
		}
    }
	
	function verDocumentos(cred,rfc,cliente){
        if(cred != ''){
			var w = 1000;
            var h = 680;
            var LeftPosition=(screen.width)?(screen.width-w)/2:100;
            var TopPosition=(screen.height)?(screen.height-h)/2:100;
            var config = "width="+w+", height="+h+", left="+LeftPosition+", top="+TopPosition+", toolbar=0,location=0,status=1,menubar=0,directories=0,scrollbars=1,resizable=0"; 
            var urlace = "ConsultaGestionaDocumentos.aspx?IDRef="+ cred +"&rfc="+ rfc +"&cliente="+ cliente;
            window.open(urlace,"Documentos",config); 
		}
    }
	
	function verMasinformacion(ref){
        if(ref != ''){
			window.location = "consultas.aspx?Ref="+ ref;
		}
    }
</script>
</head>
<body>
<iframe id="menu" style="width:100%;height:55px; vertical-align:middle; text-align:left;" src="menu.aspx?m=6qfo0PQf" scrolling="no" frameborder="0" runat="server" ></iframe>
<form id="form1" runat="server">
			
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<table id="tablepuntosysema" width="400" align="center" class="Tablapuntos" runat="server">
  <!--DWLayoutTable-->
  <tr>
    <td width="75" height="24" valign="top">Puntos:</td>
    <td width="86" valign="top" style="cursor: pointer"><asp:Label ID="puntosdato" runat="server" ></asp:Label></td>
    <td width="98" valign="top">Sem&aacute;foro:</td>
    <td width="116" valign="top" runat="server" id="semaforotd"><asp:Label ID="semaforodato" runat="server" ></asp:Label></td>
  </tr>
</table>
<div class="divGrid">
    <div class="grid">
 
        <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
				<asp:GridView 
                    ID="GridView1"
                    runat="server"
                    CssClass="datatable"
                    CellPadding="0" 
                    CellSpacing="0"
                    GridLines="None"
                    AutoGenerateColumns="False">
 
                    <RowStyle CssClass="even"/>
                    <HeaderStyle CssClass="header" />
                    <AlternatingRowStyle CssClass="odd"/>
					
					<Columns>
						<asp:BoundField HeaderText="Fecha" DataField="fecha_consulta"></asp:BoundField>
						<asp:TemplateField HeaderText="ID"> 
							<ItemTemplate> 
								<asp:HyperLink ToolTip="Detalle de Cuentas" ID="HyperLink2" runat="server" NavigateUrl=<%# "javascript:verCreditos('" & Eval("id", "{0}") & "')" %> ><%# Eval("id", "{0}") %></asp:HyperLink> 
							</ItemTemplate> 
						</asp:TemplateField>
						<asp:BoundField HeaderText="RFC" DataField="rfc"></asp:BoundField>
						<asp:BoundField HeaderText="Cliente" DataField="nombre"></asp:BoundField>
						<asp:BoundField HeaderText="Fecha Nacimiento" DataField="fecha_nacimiento"></asp:BoundField>
						<asp:TemplateField HeaderText="Referencia Buro"> 
							<ItemTemplate> 
								<asp:HyperLink ToolTip="Mas información..." ID="HyperLink3" runat="server" NavigateUrl=<%# "javascript:verMasinformacion('" & Eval("referencia_buro", "{0}") & "')" %> ><%# Eval("referencia_buro", "{0}") %></asp:HyperLink> 
							</ItemTemplate> 
						</asp:TemplateField>
						<asp:BoundField HeaderText="Referencia Cliente" DataField="referencia_cliente"></asp:BoundField>
						<asp:BoundField HeaderText="Cod Score" DataField="codigo_score"></asp:BoundField>
						<asp:BoundField HeaderText="Valor Score" DataField="valor_score"></asp:BoundField>
						
					</Columns>
	
                </asp:GridView>
 
            </ContentTemplate>
        </asp:UpdatePanel>
 <asp:Label ID="ErrorMsg" runat="server" CssClass="ErrorMsj1"></asp:Label>
    </div><!-- grid -->
</div><!-- divGrid -->
<table id="Table6" border="0" cellpadding="1" cellspacing="1" style="position: absolute;" width="100%" runat="server">
<tr>
	<td align="center" style="display:none"><asp:Button ID="Button2" runat="server" CssClass="btn1" Text="Regresar" /></td>
	<td align="center"><asp:Button ID="Buttondoc" runat="server" CssClass="btn1" Text="Documentos" /></td>
</tr>
</table>
</form>
</body>
</html>
