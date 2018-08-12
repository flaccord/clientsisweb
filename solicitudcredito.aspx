<%@ Page Language="VB" AutoEventWireup="false" CodeFile="solicitudcredito.aspx.vb" Inherits="solicitudcredito" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<title>Solicitud de Credito</title>
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
	
	function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
 
         return true;
      }
	  
	function stringCheck(e, field) {
 
		key = e.keyCode ? e.keyCode : e.which
	 
		//alert(key);
		//backspace
		if(key == 32) return true;
	 
		//numeros 0-9
		if((key >= 48 && key <= 57) || key == 42) return false;
	 
		// Caracteres Raros
		if(	key == 94 || 
			key == 59 || 
			key == 58 || 
			key == 61 || 
			key == 43 || 
			key == 45 || 
			key == 95 || 
			key == 47 || 
			key == 96 || 
			key == 40 || 
			key == 41 || 
			key == 91 || 
			key == 123 || 
			key == 92 || 
			key == 124 || 
			key == 125 || 
			key == 93 || 
			key == 39 || 
			key == 34 || 
			key == 44 || 
			key == 46 || 
			key == 47 || 
			key == 231 || 
			key == 42 || 
			key == 168 || 
			key == 33 || 
			key == 161 || 
			key == 183 || 
			key == 8364 || 
			key == 37 || 
			key == 191 || 
			key == 186 || 
			key == 170 || 
			key == 64 || 
			key == 35 || 
			key == 126 || 
			key == 36 || 
			key == 38 || 
			key == 180 || 
			key == 63) return false;
	 
	} 
</script>	
</head>
<body>
			<iframe id="menu" style="width:100%;height:55px; vertical-align:middle; text-align:left;" scrolling="no" frameborder="0" src="menu.aspx?m=C02wMbiD" runat="server" ></iframe>
<div class="container registro" style="background-image:url(images/background/registro-1460132785-1-opaca.jpg);opacity:1">
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
							<tr><td colspan="4">
							<fieldset align="center" id="opcionDomicilio">	
							<legend class="mini"><strong>Datos Generales</strong></legend>	
								<table>
									<tr><td width=150px><p>Primer Nombre *</p></td><td colspan="3"><asp:TextBox ID="txtnombre" onkeypress="return stringCheck(event, this);" placeholder="primer nombre *" required="" runat="server" width=150px /></td>
										<td width=150px><p>Segundo Nombre</p></td><td><asp:TextBox ID="nombre1" onkeypress="return stringCheck(event, this);" placeholder="segundo nombre" runat="server" width=150px /></td>
									</tr>
									<tr><td><p>Apellido Paterno *</p></td><td colspan="3"><asp:TextBox ID="apellidos" onkeypress="return stringCheck(event, this);" placeholder="Apellido Paterno *" required="" runat="server" width=150px /></td>
										<td><p>Apellido Materno</p></td><td><asp:TextBox ID="apellidos1" onkeypress="return stringCheck(event, this);" placeholder="Apellido Materno" runat="server" width=150px /></td>
									</tr>
									<tr><td><p>Fecha de Nacimiento *</p></td><td colspan="3"><p><asp:DropDownList ID="Dia"  placeholder="Dia *" required="" runat="server" width="50px">
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
                                            <asp:DropDownList ID="Mes" placeholder="Mes *"  required="" runat="server" width="110px">
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
                                            <asp:DropDownList ID="Anio" placeholder="Año *"  required="" runat="server" width="70px">
                                            </asp:DropDownList></p></td>
										<td><p>RFC *</p></td><td colspan="3"><asp:TextBox ID="rfc" placeholder="rfc *" required="" MaxLength="13" runat="server" width=150px /></td>
									</tr>
									<tr><td><p>referencia del cliente</p></td><td colspan="3"><asp:TextBox ID="referencia" placeholder="referencia del cliente" runat="server" width=200px /></td>
									<td><p>Salario *</p></td><td><asp:TextBox ID="salario" placeholder="salario *" onkeypress="return isNumberKey(event)" required="" runat="server" width=150px /></td>
									</tr>
									</table>
							</fieldset>
							</td></tr>
							
							<tr><td colspan="4">
							<fieldset align="center" id="opcionDomicilio">	
							<legend class="mini"><strong>Direcci&oacute;n</strong></legend>	
								<table>
									<tr><td width=150px><p>Calle *</p></td><td colspan="3"><asp:TextBox ID="calle" placeholder="Calle *" required="" runat="server" width=450px /></td></tr>
									<tr><td width=150px><p>Numero Exterior</p></td><td><asp:TextBox ID="numexterior" placeholder="Numero Exterior" runat="server" width=150px /></td>
										<td width=150px><p>Numero Interior</p></td><td><asp:TextBox ID="numinterior" placeholder="Numero Interior" runat="server" width=150px /></td>
									</tr>
									<tr><td><p>Manzana</p></td><td><asp:TextBox ID="manzana" placeholder="Manzana" runat="server" width=200px /></td>
										<td><p>Lote</p></td><td><asp:TextBox ID="lote" placeholder="Lote" runat="server" width=200px /></td>
									</tr>
									<tr><td><p>Colonia *</p></td><td><asp:TextBox ID="colonia" placeholder="Colonia *" runat="server" required="" width=200px /></td>
										<td><p>Municipio *</p></td><td><asp:TextBox ID="municipio" placeholder="Municipio *" runat="server" required="" width=200px /></td>
									</tr>
									<tr><td><p>Ciudad *</p></td><td><asp:TextBox ID="ciudad" placeholder="Ciudad *" runat="server" required="" width=200px /></td>
										<td><p>Estado *</p></td><td><p>
										<asp:DropDownList ID="estado" placeholder="Estado *"  required="" runat="server" width="200px">
											<asp:ListItem></asp:ListItem>
											<asp:ListItem Value="AGS">Aguascalientes</asp:ListItem>
											<asp:ListItem Value="BCN">Baja California Norte</asp:ListItem>
											<asp:ListItem Value="BCS">Baja California Sur</asp:ListItem>
											<asp:ListItem Value="CAM">Campeche</asp:ListItem>
											<asp:ListItem Value="CHI">Chihuahua</asp:ListItem>
											<asp:ListItem Value="CHS">Chiapas</asp:ListItem>
											<asp:ListItem Value="COA">Coahuila</asp:ListItem>
											<asp:ListItem Value="COL">Colima</asp:ListItem>
											<asp:ListItem Value="DF">Distrito Federal</asp:ListItem>
											<asp:ListItem Value="DGO">Durango</asp:ListItem>
											<asp:ListItem Value="EM">Estado de México</asp:ListItem>
											<asp:ListItem Value="GRO">Guerrero</asp:ListItem>
											<asp:ListItem Value="GTO">Guanajuato</asp:ListItem>
											<asp:ListItem Value="HGO">Hidalgo</asp:ListItem>
											<asp:ListItem Value="JAL">Jalisco</asp:ListItem>
											<asp:ListItem Value="MICH">Michoacán</asp:ListItem>
											<asp:ListItem Value="MOR">Morelos</asp:ListItem>
											<asp:ListItem Value="NAY">Nayarit</asp:ListItem>
											<asp:ListItem Value="NL">Nuevo León</asp:ListItem>
											<asp:ListItem Value="OAX">Oaxaca</asp:ListItem>
											<asp:ListItem Value="PUE">Puebla</asp:ListItem>
											<asp:ListItem Value="QR">Quintana Roo</asp:ListItem>
											<asp:ListItem Value="QRO">Querétaro</asp:ListItem>
											<asp:ListItem Value="SIN">Sinaloa</asp:ListItem>
											<asp:ListItem Value="SLP">San Luis Potosí</asp:ListItem>
											<asp:ListItem Value="SON">Sonora</asp:ListItem>
											<asp:ListItem Value="TAB">Tabasco</asp:ListItem>
											<asp:ListItem Value="TAM">Tamaulipas</asp:ListItem>
											<asp:ListItem Value="TLA">Tlaxcala</asp:ListItem>
											<asp:ListItem Value="VER">Veracruz</asp:ListItem>
											<asp:ListItem Value="YUC">Yucatán</asp:ListItem>
											<asp:ListItem Value="ZAC">Zacatecas</asp:ListItem>
										</asp:DropDownList></p></td>
									</tr>
									<tr><td><p>Codigo Postal *</p></td><td><asp:TextBox ID="codpostal" placeholder="Codigo Postal *" onkeypress="return isNumberKey(event)" MaxLength="5" runat="server" required="" width=150px /></td>
										<td><p></p></td><td colspan="3"></td>
									</tr>
									<tr><td><p>Antigüedad domicilio *</p></td><td>
										<p>
										<asp:DropDownList ID="Antdomicilio" placeholder="Ant domicilio *"  required="" runat="server" width="200px">
											<asp:ListItem></asp:ListItem>
											<asp:ListItem Value="Menor que 1 Año">Menor que 1 Año</asp:ListItem>
											<asp:ListItem Value="Entre 1 y 3 Años">Entre 1 y 3 Años</asp:ListItem>
											<asp:ListItem Value="Mas de 3 Años">Mas de 3 Años</asp:ListItem>
										</asp:DropDownList></p>
									</td>
										<td><p>Vivienda Propia *</p></td><td colspan="3"><p>
										<asp:RadioButton ID="propiasi" placeholder="Si *" Text="Si"  GroupName="viviendapropia" runat="server"></asp:RadioButton>
										<asp:RadioButton ID="propiano" placeholder="No *" Text="No" Checked="True"  GroupName="viviendapropia" runat="server"></asp:RadioButton>
										</p></td>
									</tr>
								</table>
							</fieldset>
							</td></tr>
							
							<tr><td colspan="4">
							<fieldset align="center" id="opcionTipoConsulta">	
							<legend class="mini"><strong>Opciones de Consulta Buro de Cr&eacute;dito</strong></legend>	
								<table>
									<tr><td width=300px><p>Tipo de Consulta *</p></td><td colspan="3"><p>
									<asp:RadioButton ID="tradicional" AutoPostBack="true" placeholder="Consulta Tradicional *" Text="Consulta Tradicional" Checked="True" GroupName="tipoConsulta" runat="server"></asp:RadioButton>
									<asp:RadioButton ID="autenticacion" AutoPostBack="true" placeholder="Consulta con Autenticación *" Text="Consulta con Autenticación"  GroupName="tipoConsulta" runat="server"></asp:RadioButton>
									</p></td></tr>
									<tr id="TCredito" runat="server"><td width=300px><p>¿Cúenta con Tarjeta de Crédito? *</p></td><td width=100px><p>
									<asp:RadioButton ID="tcreditosi" placeholder="Si *" Text="Si"  GroupName="cuentaTarjetaCredito" runat="server"></asp:RadioButton>
									<asp:RadioButton ID="tcreditono" placeholder="No *" Text="No" Checked="True"  GroupName="cuentaTarjetaCredito" runat="server"></asp:RadioButton>
									</p></td>
									<td width=450px><p>Últimos 4 digitos de la Tarjeta</p></td><td width=80px><asp:TextBox ID="ultimosCuatroDigitosTarjetaCredito" onkeypress="return isNumberKey(event)" MaxLength="4" placeholder="4 digitos" runat="server" width=80px /></td>
									</tr>
									<tr id="TPrestamos" runat="server"><td width=300px><p>¿Ha ejercido un crédito Hipotecario? *</p></td><td width=100px><p>
									<asp:RadioButton ID="hipotecariosi" placeholder="Si *" Text="Si" GroupName="creditoHipotecario" runat="server"></asp:RadioButton>
									<asp:RadioButton ID="hipotecariono" placeholder="No *" Text="No" Checked="True" GroupName="creditoHipotecario" runat="server"></asp:RadioButton>
									</p></td>
									<td width=450px><p>¿Ha ejercido un crédito Automotriz en los ultimos 24 meses? *</p></td><td width=80px><p>
									<asp:RadioButton ID="automotrizsi" placeholder="Si *" Text="Si" GroupName="creditoAutomotriz" runat="server"></asp:RadioButton>
									<asp:RadioButton ID="automotrizmo" placeholder="No *" Text="No" Checked="True" GroupName="creditoAutomotriz" runat="server"></asp:RadioButton>
									</p></td>
									</tr>
								</table>
							</fieldset>
							</td></tr>
							
							<tr><td width=150px><p>Tipo empleo</p></td><td>
								<p>
										<asp:DropDownList ID="tipoempleo" placeholder="Tipo empleo *"  required="" runat="server" width="200px">
											<asp:ListItem></asp:ListItem>
											<asp:ListItem Value="Independiente">Independiente</asp:ListItem>
											<asp:ListItem Value="Empleado">Empleado</asp:ListItem>
										</asp:DropDownList></p>
							</td>
							    <td width=150px><p>Antigüedad laboral *</p></td><td>
									<p>
										<asp:DropDownList ID="antlaboral" placeholder="Antigüedad laboral *"  required="" runat="server" width="200px">
											<asp:ListItem></asp:ListItem>
											<asp:ListItem Value="Menor que 1 Año">Menor que 1 Año</asp:ListItem>
											<asp:ListItem Value="Entre 1 y 3 Años">Entre 1 y 3 Años</asp:ListItem>
											<asp:ListItem Value="Mas de 3 Años">Mas de 3 Años</asp:ListItem>
										</asp:DropDownList></p>
								</td></tr>
							
                            <!--<input name="email" placeholder="email *" required="" type="email">
                            <input name="telefono" placeholder="teléfono" type="text">
							<tr><td colspan=4><p>*Campos obligatorios</p></td></tr>
                            <tr><td colspan=4><p id="msgValidacion" style="color: #EF4040;"></p></td></tr>!-->				
							<tr><td colspan="4" align="center">
								<asp:Button ID="btninsertdatos" runat="server" Text="Enviar" />
							</td></tr>
							<tr><td colspan="4" align="center"><p>
								<asp:Label ID="ErrorMsg" runat="server" Text="*CAMPOS OBLIGATORIOS" CssClass="ErrorMsj1" style="color: #fff" ></asp:Label>
								<asp:Label ID="puntosdato" runat="server" Text="" ></asp:Label>
								<asp:Label ID="semaforodato" runat="server" Text="" ></asp:Label>
							</p></td></tr>
							</table>
						</div>
                    </form>                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>