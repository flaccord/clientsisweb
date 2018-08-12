<%@ Page Language="VB" AutoEventWireup="false" CodeFile="detalleconsultas.aspx.vb" Inherits="detalleconsultas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<title>Consulta de Clientes Web</title>
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
 
.PagerLabel{display:inline-block; padding:7px 0 0 0;}
 
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
</script>
</head>
<body">
<form id="form1" runat="server">
			<div id="menu" style="width:100%;height:100%; vertical-align:middle; text-align:left;" >
			</div>

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
						<asp:BoundField HeaderText="ID" DataField="id_consulta"></asp:BoundField>
						<asp:BoundField HeaderText="Fecha Actualizacion" DataField="fecha_actualizacion"></asp:BoundField>
						<asp:BoundField HeaderText="Usuario" DataField="nombre_usuario"></asp:BoundField>
						<asp:BoundField HeaderText="Producto" DataField="producto"></asp:BoundField>
						<asp:BoundField HeaderText="Fecha Credito" DataField="fecha_credito"></asp:BoundField>
						<asp:BoundField HeaderText="fecha Cierre" DataField="fecha_cierre"></asp:BoundField>
						<asp:BoundField DataFormatString="{0:C}" HeaderText="Saldo Actual" DataField="saldo_actual"></asp:BoundField>
						<asp:BoundField DataFormatString="{0:C}" HeaderText="Saldo Vencido" DataField="saldo_vencido"></asp:BoundField>
						<asp:TemplateField HeaderText="MOP"> 
							<ItemTemplate> 
								<asp:HyperLink ToolTip=<%# Eval("descripcion", "{0}") %> ID="HyperLink1" runat="server" NavigateUrl="#" ><%# Eval("mop", "{0}") %></asp:HyperLink> 
							</ItemTemplate> 
						</asp:TemplateField>
						<asp:BoundField HeaderText="Historico Pagos" DataField="historico_pagos"></asp:BoundField>
						<asp:TemplateField HeaderText="Clave Observacion"> 
							<ItemTemplate> 
								<asp:HyperLink ToolTip=<%# Eval("nombre", "{0}") %> ID="HyperLink1" runat="server" NavigateUrl="#" ><%# Eval("clave_observacion", "{0}") %></asp:HyperLink> 
							</ItemTemplate> 
						</asp:TemplateField>
						
					</Columns>
	
                </asp:GridView>
 
            </ContentTemplate>
        </asp:UpdatePanel>
 <asp:Label ID="ErrorMsg" runat="server" CssClass="ErrorMsj1"></asp:Label>
    </div><!-- grid -->
</div><!-- divGrid -->
<table id="Table6" border="0" cellpadding="1" cellspacing="1" style="position: absolute;" width="100%">
<tr>
	
</tr>
</table>
</form>
</body>
</html>
