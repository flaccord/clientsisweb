<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CargarArchivos.aspx.vb" Inherits="CargarArchivos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="disenio1/Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
    <!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="disenio1/newdesign/bootstrap.min.css" rel="stylesheet" />
    <link href="disenio1/newdesign/bootstrap-theme.css" rel="stylesheet" />

    <title>Página sin título</title>
    <style type="text/css">
        body {
            margin: 0;
        }

        .modal-body {
            padding: 0px !important;
        }

        .file-upload {
            padding: 30px;
        }

        .footer {
            overflow: auto;
            border-top: 1px solid #e5e5e5;
        }

        .footer-button {
            float: right;
            padding: 20px;
        }
    </style>
    <script language="javascript" type="text/javascript">
        function Clear() {
        }
        function Cierra() {
            window.parent.Aviso0.Close();
        }
        function ClearedFiles(fileNames) {
            alert("El documento no tiene una extensión válida (Solo archivos .jpg):\n\n" + fileNames);
            Agregar.enable();
        }

        function Rejected(fileName, size, maxSize) {
            alert("Documento " + fileName + " es rechazado \nTamaño (" + size + " bytes) excede " + maxSize + " bytes");
            Agregar.enable();
        }
        function clearFileInputs() {
            // get all inputs
            var inp = document.getElementsByTagName("input");
            for (var i = 0; i < inp.length; i++) {
                var el = inp[i];
                // input with type 'file' only and not empty
                if (el.type == "file" && el.value != "") {
                    // clear it
                    if (document.all && !window.opera) {
                        el.parentNode.insertBefore(el.cloneNode(false), el);
                        el.parentNode.removeChild(el);
                    }
                    else {
                        var new_span = document.createElement("SPAN");
                        el.parentNode.insertBefore(new_span, el);
                        new_span.appendChild(el);
                        new_span.innerHTML = new_span.innerHTML;
                        new_span.parentNode.insertBefore(new_span.firstChild, new_span);
                        new_span.parentNode.removeChild(new_span);
                    }
                }
            }
            return true;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <%-- <table id="Table1" border="0" cellpadding="1" cellspacing="1" style="left: 8px; position: absolute; top: 14px" width="800">
            <tr>
                <td colspan="2" style="width: 1200px">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Height="24px"
                        Text="Agregar Archivos" Width="718px"></asp:Label></td>
            </tr>
        </table>--%>
        <asp:HiddenField ID="CloseModal" runat="server" />
        <div class="file-upload">
            <asp:FileUpload ID="Fup1" runat="server" Width="571px" />
            <div class="error-message">
                <asp:Label ID="ErrorMsg" runat="server" Font-Names="Arial Narrow" ForeColor="#C00000"></asp:Label>
            </div>
        </div>
        <div class="footer">
            <div class="footer-button">
                <%--<asp:Button ID="Button1" runat="server" CssClass="btn btn-default" Text="Cerrar" OnClick="Button1_Click" OnClientClick="return clearFileInputs();" />--%>&nbsp;&nbsp;&nbsp;
               <asp:Button ID="Button2" runat="server" Text="Sublr documento" CssClass="btn btn-info" OnClientClick="this.disabled=true;" UseSubmitBehavior="false" />
            </div>
        </div>

        <%--<table id="Table2" border="0" cellpadding="1" cellspacing="1" style="z-index: 123;
            left: 14px; position: absolute; top: 63px" width="350px">
            <tr>
            <td style="height: 160px" valign="top">
                <table style="width: 350px" id="Table3">
                    <tr>
                        <td colspan="3" style="height: 32px">
                            <asp:FileUpload ID="Fup1" runat="server" Width="571px" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="Button2" runat="server" Text="Agregar" OnClientClick="this.disabled=true;" UseSubmitBehavior="false" /></td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Button ID="Button1" runat="server" Text="Cerrar" OnClick="Button1_Click" OnClientClick="return clearFileInputs();" /></td>
                    </tr>
                    <tr>
                        <td style="width: 350px">
                            <asp:Label ID="ErrorMsg" runat="server" Font-Names="Arial Narrow" ForeColor="#C00000"></asp:Label></td>
                        
                    </tr>
                    
                </table>
            </td>
            </tr>
            </table>--%>
    </form>
</body>
<script language="javascript" type="text/javascript">
    function Sube() {
        document.getElementById("Button2").disabled = true;
        __dopo
    }

    //if ($("#CloseModal").value == "true") {
    //    $(document.getElementById('agregarModal')).hide();
    //    $(document.getElementsByClassName('modal-backdrop'))[0].remove();
    //}
    //window.onload = new function () {
    //    debugger;
    //    if ($("#CloseModal").value == "true") {
    //        var agrerarModal = $(document.getElementById('agregarModal'));
    //        agrerarModal.hide();
    //        $(window.parent.document.getElementsByClassName('modal-backdrop'))[0].remove();
    //    }
    //}

</script>
</html>
