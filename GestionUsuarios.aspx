<%@ Page Language="VB" AutoEventWireup="false" CodeFile="GestionUsuarios.aspx.vb" Inherits="GestionUsuarios" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<title>Gestión de Usuarios</title>
<head>
<link rel="stylesheet" href="disenio1/c16e9a3d.css">
<link rel="stylesheet" href="disenio1/style.css">
<link rel="stylesheet" href="disenio1/slider.css">
<style class="firebugResetStyles" type="text/css" charset="utf-8">
.mini {
    color: #fff;
    font: bold ultra-condensed 12px/18px Raleway,sans-serif;
    padding-left: 2px;
    padding-right: 2px;
}
</style>
<style>
.grid .datatable{width:100%; border:none; padding:0px; margin:0px; color:#333;}
</style>
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
	
	function validadatos() {
		var nombre = document.getElementById("txtPrimerNombre").value;
		var apellidos = document.getElementById("txtPrimerApellido").value;
		var password = document.getElementById("txtPassword").value;

		var patron = /(?=^.{8,}$)(?=.*\d)(?=.*\W+)(?![.\n])(?=.*[A-Z]).*$/;
		
		var numeros="0123456789";
		var band = 0;

		if (nombre == '') {
			band = 1;
			document.getElementById("msgValidacion").innerHTML = 'El campo Primer Nombre se encuentra vacío';
			document.getElementById("txtPrimerNombre").css ='border','solid #EF4040 1px';
		}
		else{
			for(i=0; i<nombre.length; i++){
				if (numeros.indexOf(nombre.charAt(i),0)!=-1){
				    document.getElementById("msgValidacion").innerHTML = 'El campo Primer Nombre no debe contener caracteres numéricos';
					document.getElementById("txtPrimerNombre").css ='border','solid #EF4040 1px';
					band = 1;
				}
			}
		}
		if (band == 0 & apellidos == '') {
			band = 1;
			document.getElementById("msgValidacion").innerHTML = 'El campo Primer Apellido se encuentra vacío';
			document.getElementById("txtPrimerApellido").css ='border','solid #EF4040 1px';
		}
		else{
			for(i=0; i<apellidos.length; i++){
				if (numeros.indexOf(apellidos.charAt(i),0)!=-1){
				    document.getElementById("msgValidacion").innerHTML = 'El campo Primer Apellido no debe contener caracteres numéricos';
					document.getElementById("txtPrimerApellido").css ='border','solid #EF4040 1px';
					band = 1;
				}
			}
		}

		if (band == 0) {
		    if (!(password.match(patron))) {
		        document.getElementById("msgValidacion").innerHTML = 'El Password no es lo suficientemente seguro';
		        document.getElementById("txtPassword").css = 'border', 'solid #EF4040 1px';
		        band = 1;		        
		    }
		}
		
		if (band == 0) {
		    if (!(IdComunidad.match(patron))) {
		        document.getElementById("msgValidacion").innerHTML = 'Debe seleccionar la comunidad a la que pertenece el Usuario';
		        document.getElementById("ddlComunidad").css = 'border', 'solid #EF4040 1px';
		        band = 1;		        
		    }
		}

		if (band == 0) {
		    return true;
		    //$('#contentSolicitud').load('solicitud2.php?' + $('#form_registro').serialize());
		    //$('#contentSolicitud').fadeOut();
		    //$('#contentMensaje').fadeIn(1000);
		}
		else {
		    return false;
		}
	}
</script>	
</head>
<body>
			<iframe id="menu" style="width:100%;height:55px; vertical-align:middle; text-align:left;" scrolling="no" frameborder="0" src="menu.aspx?m=4YfhgcsZ" runat="server" ></iframe>
<div class="container registro" style="background-image:url(images/background/fondologin2.jpg);opacity:1">
        <div class="overlay"></div>

        <div class="form_solicitud">
            <!--<h3>
                SOLICITUD DE CREDITO
            </h3>!-->
            <div class="content_form">
                <div class="column" id="contentSolicitud">
                    <form action="#" id="form_registro" runat="server">
                        <div class="column_form inputs">
                            <table>
							<tr><td colspan="2">
							<fieldset align="center" id="opcionDomicilio">	
							<legend class="mini"><strong>Datos Generales</strong></legend>	
								<table>
									<tr><td width=150px><p>Primer Nombre *</p></td><td><asp:TextBox ID="txtPrimerNombre" placeholder="primer nombre *" required="" runat="server" width=150px /></td>
										<td width=150px><p>Segundo Nombre</p></td><td><asp:TextBox ID="txtSegundoNombre" placeholder="segundo nombre" runat="server" width=150px /></td>
									</tr>
									<tr><td><p>Apellido Paterno *</p></td><td><asp:TextBox ID="txtPrimerApellido" placeholder="Apellido Paterno *" required="" runat="server" width=150px /></td>
										<td><p>Apellido Materno</p></td><td><asp:TextBox ID="txtSegundoApellido" placeholder="Apellido Materno" runat="server" width=150px /></td>
									</tr>
									<tr><td><p>Fecha de Nacimiento *</p></td><td> <asp:DropDownList ID="Dia"  placeholder="Dia *" required="" runat="server" width="60px">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem>01</asp:ListItem>
                                                <asp:ListItem>02</asp:ListItem>
                                                <asp:ListItem>03</asp:ListItem>
                                                <asp:ListItem>04</asp:ListItem>
                                                <asp:ListItem>05</asp:ListItem>
                                                <asp:ListItem>06</asp:ListItem>
                                                <asp:ListItem>07</asp:ListItem>
                                                <asp:ListItem>08</asp:ListItem>
                                                <asp:ListItem>09</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                                <asp:ListItem>13</asp:ListItem>
                                                <asp:ListItem>14</asp:ListItem>
                                                <asp:ListItem>15</asp:ListItem>
                                                <asp:ListItem>16</asp:ListItem>
                                                <asp:ListItem>17</asp:ListItem>
                                                <asp:ListItem>18</asp:ListItem>
                                                <asp:ListItem>19</asp:ListItem>
                                                <asp:ListItem>20</asp:ListItem>
                                                <asp:ListItem>21</asp:ListItem>
                                                <asp:ListItem>22</asp:ListItem>
                                                <asp:ListItem>23</asp:ListItem>
                                                <asp:ListItem>24</asp:ListItem>
                                                <asp:ListItem>25</asp:ListItem>
                                                <asp:ListItem>26</asp:ListItem>
                                                <asp:ListItem>27</asp:ListItem>
                                                <asp:ListItem>28</asp:ListItem>
                                                <asp:ListItem>29</asp:ListItem>
                                                <asp:ListItem>30</asp:ListItem>
                                                <asp:ListItem>31</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="Mes" placeholder="Mes *"  required="" runat="server" width="120px">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="01">Enero</asp:ListItem>
                                                <asp:ListItem Value="02">Febrero</asp:ListItem>
                                                <asp:ListItem Value="03">Marzo</asp:ListItem>
                                                <asp:ListItem Value="04">Abril</asp:ListItem>
                                                <asp:ListItem Value="05">Mayo</asp:ListItem>
                                                <asp:ListItem Value="06">Junio</asp:ListItem>
                                                <asp:ListItem Value="07">Julio</asp:ListItem>
                                                <asp:ListItem Value="08">Agosto</asp:ListItem>
                                                <asp:ListItem Value="09">Septiembre</asp:ListItem>
                                                <asp:ListItem Value="10">Octubre</asp:ListItem>
                                                <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                                <asp:ListItem Value="12">Diciembre</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="Anio" placeholder="Año *"  required="" runat="server" width="90px">
                                            </asp:DropDownList></td>
										<td><p>RFC *</p></td><td colspan="3"><asp:TextBox ID="rfc" placeholder="rfc *" required="" runat="server" width=150px /></td>
									</tr>
									</table>
							</fieldset>
							</td></tr>
							
							<tr><td colspan="2">
							<fieldset align="center" id="opcionAcceso">	
							<legend class="mini"><strong>Datos de Acceso</strong></legend>	
								<table>
								    <tr>
								        <td width="150px"><p>Usuario *</p></td>
								        <td><asp:TextBox ID="txtUsuario" placeholder="Usuario" runat="server" width="150px" /></td>
								        <td width="90px"></td><td></td>
								    </tr>
									<tr><td width="150px"><p>Perfil *</p></td>
									    <td><asp:DropDownList ID="ddlPerfil" placeholder="Perfil *"  required="" runat="server" width="220px" /></td>
									    <td width="90px"><p>Activo</p></td><td align="left"><asp:CheckBox ID="chkActivo" runat="server" /></td>
									    </tr>
									<tr><td width="150px"><p>Comunidad *</p></td>
									    <td><asp:DropDownList ID="ddlComunidad" placeholder="Comunidad *"  required="" runat="server" width="220px" /></td>
									    <td></td><td></td>
									    </tr>	
									<tr><td width="150px"><p>Password</p></td><td><asp:TextBox ID="txtPassword" placeholder="Password" runat="server" width=150px /></td></td>
										<td width="90px"><p>NIP</p></td><td><asp:TextBox ID="txtNIP" placeholder="NIP" runat="server" width=150px /></td>
									</tr>
								</table>
							</fieldset>
							</td></tr>							
                            <!--<input name="email" placeholder="email *" required="" type="email">
                            <input name="telefono" placeholder="teléfono" type="text">!-->
							<tr><td colspan=2><p>*Campos obligatorios</p></td></tr>
                            <tr><td colspan=2><p id="msgValidacion" style="color: #EF4040;" ></p></td></tr>							
							<br>
							<tr><td colspan="2" align="center">
								<asp:Button ID="btninsertdatos" runat="server" Text="Enviar" onClientClick="return validadatos();"/>
							</td></tr>
							<tr><td colspan="2" align="center">
								<asp:Label ID="ErrorMsg" runat="server" CssClass="ErrorMsj1" style="color: #fff" ></asp:Label>
							</td></tr>
							<tr>
							    <td colspan="2">
							        <br />
							    	<fieldset align="center" id="Fieldset1">	
							            <legend class="mini"><strong>Grid de Consulta</strong></legend>	
							            <table>
							                <tr>
							                    <td>
                                                    <asp:GridView ID="GridView1" runat="server" CssClass="datatable"
                                                                    Font-Name="Verdana" Font-Size="10pt" Cellpadding="4" HeaderStyle-BackColor="#444444"
                                                                    HeaderStyle-ForeColor="White" AlternatingRowStyle-BackColor="#dddddd"
                                                                    AutoGenerateColumns = "false" >
                                                        <Columns>
                                                            <asp:ButtonField CommandName="Select" Text="&gt;&gt;" ItemStyle-ForeColor="Black" ItemStyle-Font-Bold="true">
                                                                <HeaderStyle Width="20px" />
                                                            </asp:ButtonField>
                                                            <asp:BoundField DataField="KeyUsuario" HeaderText="Usuario" />
							                                <asp:BoundField DataField="PrimerNombre" HeaderText="P. Nombre" />
							                                <asp:BoundField DataField="SegundoNombre" HeaderText="S. Nombre" />
                                                            <asp:BoundField DataField="PrimerApellido" HeaderText="P. Apellido" />
							                                <asp:BoundField DataField="SegundoApellido" HeaderText="S. Apellido" />
							                                <asp:BoundField DataField="RFC" HeaderText="RFC" />
							                                <asp:BoundField DataField="Perfil" HeaderText="Perfil" />
							                                <asp:BoundField DataField="Activo" HeaderText="Activo"  />
							                                <asp:BoundField DataField="Comunidad" HeaderText="Comunidad"  />
                                                        </Columns>
							                        </asp:GridView>
							                    </td>
                                            </tr>
							            </table>
							        </fieldset>
							    </td>
							</tr>
							</table>
						</div>
                    </form>                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>