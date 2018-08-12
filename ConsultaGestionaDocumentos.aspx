<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ConsultaGestionaDocumentos.aspx.vb" Inherits="ConsultaGestionaDocumentos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Consulta y Gestión de Documentos</title>
	<link rel="stylesheet" href="disenio1/c16e9a3d.css">
	<link rel="stylesheet" href="disenio1/style.css">
	<link rel="stylesheet" href="disenio1/slider.css">
    <style type="text/css">
        .grid .datatable{width:100%; border:none; padding:0px; margin:0px; color:#333;}
    </style>
</head>
<body>
<div class="container registro" style="background-image:url(images/background/fondologin2.jpg);opacity:1">
        <div class="overlay"></div>
    <form action="#" runat="server">
        <table style="left: 13px; position: absolute; top: 12px" width="950">
            <tr>
                <asp:Label ID="ErrorMsg" runat="server" style="color: red" ></asp:Label>
            </tr>
            <tr>
                <td colspan="2" style="width: 447px; height: 580px;" valign="top">
                    <br />
                    <img src="images\no-image-available.png" alt="Imagen" name="imgLoadN" id="imgLoad" width="488" style="height: 555px" />
                    </td>
                    <td style="width: 300px; height: 580px;" valign="top">
                        <br />
                            <iframe id="ifDocumentos" src="CargaListadoDocumentosVer.aspx" style="width: 450px; height: 499px" frameborder="0"></iframe>
                            <script>
                                (function() {
                                var frameBaseSRC = document.getElementById("ifDocumentos").src;
                                    var frameQueryString = document.location.href.split("IDRef=")[1];
									if (frameQueryString != undefined) {
                                        document.getElementById("ifDocumentos").src = frameBaseSRC + "?IDRef=" + frameQueryString;
                                    }
                                })();
                            </script>
                    </td>
                </tr>
            </table>
        </form>
</div>
</body>
</html>
