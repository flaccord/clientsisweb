<%@ Page Language="VB" AutoEventWireup="false" CodeFile="capturas.aspx.vb" Inherits="capturas" %>

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
    
    font-size:10pt; 
    border-bottom:solid 1px #BDBDBD;
    vertical-align:middle;
	font-family:Consolas, "Andale Mono", "Lucida Console", "Lucida Sans Typewriter", Monaco, "Courier New", monospace;
}
 
.grid .datatable th a{color:inherit; text-decoration:none; }
 
.grid .datatable th a:hover{color:#0B0B3B; }
 
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
    font-size:10pt; 
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
            var urlace = "detalleconsultas.aspx?Ref="+ cred;
            window.open(urlace,"Detalle Creditos",config); 
		}
    }
	
	function verDatosCli(cred){
        if(cred != ''){
			var w = 1200;
            var h = 500;
            var LeftPosition=(screen.width)?(screen.width-w)/2:100;
            var TopPosition=(screen.height)?(screen.height-h)/2:100;
            var config = "width="+w+", height="+h+", left="+LeftPosition+", top="+TopPosition+", toolbar=0,location=0,status=1,menubar=0,directories=0,scrollbars=1,resizable=0"; 
            var urlace = "datoscliente.aspx?Ref="+ cred;
            window.open(urlace,"Datos Cliente",config); 
		}
    }
	
	function verCapDatosCli(ref){
        if(ref != ''){
			window.location = "solicitudcreditoPrest.aspx?Ref="+ ref;
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
			window.location = "capturas.aspx?Ref="+ ref;
		}
    }
</script>
</head>
<body>
<iframe id="menu" style="width: 100%; height: 1000px; vertical-align: middle; text-align: left;" src="menu.aspx?m=6qfo0PQf" scrolling="no" frameborder="0" runat="server"></iframe>
<form id="form1" runat="server">
			
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<table id="tablepuntosysema" width="600" align="center" class="Tablapuntos" runat="server">
  <!--DWLayoutTable-->
  <tr>
    <td width="75" height="12" valign="top"><b>Puntos:</b></td>
    <td width="250">Edad: <asp:Label ID="puntosedad" runat="server" ></asp:Label></td>
    <td width="250">Antiguedad Domicilio: <asp:Label ID="puntosantdomi" runat="server" ></asp:Label></td>
  </tr>
  <tr>
    <td width="75" height="12" valign="top"></td>
    <td>Vivienda: <asp:Label ID="puntosvivienda" runat="server" ></asp:Label></td>
    <td>Tipo de Empleo: <asp:Label ID="puntostipoempleo" runat="server" ></asp:Label></td>
  </tr>
  <tr>
    <td width="75" height="12" valign="top"></td>
    <td>Antiguedad Laboral: <asp:Label ID="puntosantlaboral" runat="server" ></asp:Label></td>
    <td>Nivel Endeudamiento: <asp:Label ID="puntosnivelendeuda" runat="server" ></asp:Label></td>
  </tr>
  <tr>
    <td width="75" height="12" valign="top"></td>
    <td>Creditos MOP: <asp:Label ID="puntosmop" runat="server" ></asp:Label></td>
    <td>Score: <asp:Label ID="puntosscore" runat="server" ></asp:Label> ( Buro: <asp:Label ID="scoreburo" runat="server" ></asp:Label> )</td>
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
						<asp:BoundField HeaderText="Fecha" DataField="fecha"></asp:BoundField>						
						
						<asp:TemplateField HeaderText="RFC"> 
							<ItemTemplate> 
								<asp:HyperLink ToolTip="Datos Cliente..." ID="HyperLink7" runat="server" NavigateUrl=<%# "javascript:verCapDatosCli('" & Eval("referenciaburo", "{0}") & "')" %> ><%# Eval("rfc", "{0}") %></asp:HyperLink> 
							</ItemTemplate> 
						</asp:TemplateField> 
						
						<asp:BoundField HeaderText="Cliente" DataField="nombre"></asp:BoundField>
						<asp:TemplateField HeaderText="Referencia Buro"> 
							<ItemTemplate> 
								<asp:HyperLink ToolTip="Mas información..." ID="HyperLink3" runat="server" NavigateUrl=<%# "javascript:verCreditos('" & Eval("referenciaburo", "{0}") & "')" %> ><%# Eval("referenciaburo", "{0}") %></asp:HyperLink> 
								<br><font color="FF0000"><%# Eval("errorburo", "{0}") %></font>
							</ItemTemplate> 
						</asp:TemplateField> 
						<asp:TemplateField HeaderText="Puntos"> 
							<ItemTemplate> 
								<asp:HyperLink ToolTip="Mas información..." ID="HyperLink6" runat="server" ForeColor="Red" NavigateUrl=<%# "javascript:verMasinformacion('" & Eval("referenciaburo", "{0}") & "')" %> ><%# Eval("Puntos", "{0}") %></asp:HyperLink> 
							</ItemTemplate> 
						</asp:TemplateField>
						<asp:BoundField HeaderText="Semáforo" DataField="Semaforo"></asp:BoundField>
						
						<asp:TemplateField ItemStyle-HorizontalAlign="center"> 
							<ItemTemplate> 
								<asp:HyperLink ToolTip="Agregar Documentos" ID="HyperLink4" runat="server" ForeColor="Black" NavigateUrl=<%# "javascript:verDocumentos('" & Eval("Id", "{0}") & "','" & Eval("rfc", "{0}") & "','" & Eval("nombre", "{0}") & "')" %> ><img src="images/buttons_docs1.jpg" title="Subir Documentos" alt="Subir Documentos" width="70px" height="18px"  style="border-width:0px;" /></asp:HyperLink> 
							</ItemTemplate> 
						</asp:TemplateField> 
						
						<asp:TemplateField ItemStyle-HorizontalAlign="center"> 
							<ItemTemplate> 
								<asp:HyperLink ToolTip="Generar PDF" ID="HyperLink5" runat="server" NavigateUrl=<%# "javascript:verMasinformacion('" & Eval("referenciaburo", "{0}") & "')" %> ><img src="images/pdf-icon.png" title="Generar PDF" alt="Generar PDF" width="18px" height="18px"  style="border-width:0px;" /></asp:HyperLink> 
							</ItemTemplate> 
						</asp:TemplateField>
						
					</Columns>
	
                </asp:GridView>
 
            </ContentTemplate>
        </asp:UpdatePanel>
 <asp:Label ID="ErrorMsg" runat="server" CssClass="ErrorMsj1"></asp:Label>
    </div><!-- grid -->
</div><!-- divGrid -->
<table id="Table6" border="0" cellpadding="1" cellspacing="1" style="position: absolute;" width="100%" runat="server">
<tr>
	<td align="center"><asp:Button ID="Buttondoc" runat="server" CssClass="btn1" Text="Generar PDF" /></td>
</tr>
</table>
</form>
</body>
</html>
