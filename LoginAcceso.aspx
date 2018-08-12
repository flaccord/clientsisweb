<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LoginAcceso.aspx.vb" Inherits="LoginAcceso" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login de Acceso</title>
    <link href="disenio1/newdesign/Login.css" rel="stylesheet" />
    <link href="disenio1/newdesign/bootstrap.min.css" rel="stylesheet" />
    <link href="disenio1/newdesign/Site.css" rel="stylesheet" />

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
            debugger;
		var usuario = document.getElementById("txtUsuario").value		
		var password = document.getElementById("txtPassword").value;
		
		var numeros="0123456789";
		var band = 0;

		if (usuario == '') {
			band = 1;
			document.getElementById("usuarioValidation").text = 'El campo Usuario se encuentra vacío';
			document.getElementById("txtUsuario").css ='border','solid #EF4040 1px';
		}
		
		if (band == 0 & password == '') {
			band = 1;
			document.getElementById("passwordValidation").text = 'El campo Password se encuentra vacío';
			document.getElementById("txtPassword").css ='border','solid #EF4040 1px';
		}
		
		if (band == 0) {
			//$('#contentSolicitud').load('solicitud2.php?' + $('#form_registro').serialize());
			//$('#contentSolicitud').fadeOut();
			//$('#contentMensaje').fadeIn(1000);
		}
	}
</script>

</head>
<body>
    <form action="#" id="form_registro" runat="server">
        <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 logo-image">
                <asp:Image ImageUrl="~/disenio1/newdesign/Images/nemesis-logo.jpg" runat="server"/>
            </div>
            <div class="login-mainform form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
                <div class="title">
                    <span>Inicia Sesión</span>
                </div>
                <div class="login-section">
                    <div class="email-section mgb-10">
                        <input type="text" id="txtUsuario" placeholder="Usuario" runat="server" class="form-control" required="required" autocomplete="off"/>
                        <asp:Label  ID="usuarioValidation" runat="server" CssClass="field-validation-error"></asp:Label>
                    </div>
                    <div class="password-section mgb-10">
                        <input type="password" id="txtPassword" placeholder="Password" runat="server" class="form-control" required="required" autocomplete="off"/>
                        <asp:Label  ID="passwordValidation" runat="server" CssClass="field-validation-error"></asp:Label>
                    </div>
                    <div class="submit">
                        <asp:Button ID="btninsertdatos" runat="server" Text="Enviar" CssClass="btn btn-primary" OnClientClick="validadatos()"/>
                    </div>
                </div>
                <asp:Label ID="ErrorMsg" runat="server" CssClass="field-validation-error" ></asp:Label>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
