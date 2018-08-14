<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ConsultaGestionaDocumentos.aspx.vb" Inherits="ConsultaGestionaDocumentos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>Consulta y Gestión de Documentos</title>
    <link rel="stylesheet" href="disenio1/c16e9a3d.css">
    <link rel="stylesheet" href="disenio1/style.css">
    <link rel="stylesheet" href="disenio1/slider.css">
    <link href="disenio1/newdesign/bootstrap.min.css" rel="stylesheet" />
    <%--<link href="disenio1/newdesign/sb-admin-2.css" rel="stylesheet" />--%>
    <script src="disenio1/Scripts/bootstrap.min.js" type="text/javascript"></script>
    <link href="disenio1/newdesign/bootstrap-theme.css" rel="stylesheet" />
    <link href="disenio1/newdesign/Site.css" rel="stylesheet" />
    <style type="text/css">
        .grid .datatable {
            width: 100%;
            border: none;
            padding: 0px;
            margin: 0px;
            color: #333;
        }

        .registro .overlay {
            background: none;
        }

        #selected-document {
            padding: 20px 40px 40px;
            border: 1px solid #e3e3e3;
            border-radius: 5px;
        }

        #selected-title {
            border-bottom: 2px solid #e3e3e3;
            padding-bottom: 5px;
        }

        #selectedDocument-Header {
            margin-bottom: 35px;
            margin-top: 35px;
        }

        .mgtop10 {
            margin-top: 10px;
        }

        select.doc-version {
            width: 65%;
        }

        .documentos-Tbody tr td {
            padding: 10px 0px;
        }

            .documentos-Tbody tr td span {
                color: black;
                font-size: 15px;
            }

        .documentos-Tbody tr {
            border-bottom: 1px solid #e3e3e3;
        }

        .documentos-Thead tr {
            border-bottom: 2px solid #e3e3e3;
        }

        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            opacity: 1;
            background-color: transparent;
        }

        
        @media (min-width: 1200px){
            .container {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container registro" style="">
        <form runat="server">
            <div>
                <iframe id="ifDocumentos" src="CargaListadoDocumentosVer.aspx" style="width: 100%;height: 100vh;" frameborder="0"></iframe>
            </div>
        </form>
    </div>
</body>
<script type="text/javascript">
    (function () {
        var frameBaseSRC = document.getElementById("ifDocumentos").src;
        var frameQueryString = document.location.href.split("IDRef=")[1];
        if (frameQueryString != undefined) {
            document.getElementById("ifDocumentos").src = frameBaseSRC + "?IDRef=" + frameQueryString;
        }
    })();
</script>
</html>
