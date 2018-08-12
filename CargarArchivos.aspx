<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CargarArchivos.aspx.vb" Inherits="CargarArchivos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Página sin título</title>
    <script language="javascript" type="text/javascript">
    function Clear()
        {        
        }
    function Cierra()
        {
        window.parent.Aviso0.Close();
        }
    function ClearedFiles(fileNames)
        {
          alert("El documento no tiene una extensión válida (Solo archivos .jpg):\n\n"+fileNames);
          Agregar.enable();
        }

        function Rejected(fileName, size, maxSize)
        {
          alert("Documento "+fileName+" es rechazado \nTamaño ("+size+" bytes) excede "+maxSize+" bytes");
          Agregar.enable();
        }       
function clearFileInputs() 
    {
    // get all inputs
    var inp = document.getElementsByTagName("input");
    for (var i = 0; i < inp.length; i++) 
        {
        var el = inp[i];
        // input with type 'file' only and not empty
        if (el.type == "file" && el.value != "") 
            {
            // clear it
            if (document.all && !window.opera) 
                {
                el.parentNode.insertBefore(el.cloneNode(false), el);
                el.parentNode.removeChild(el);
                }
            else 
                {
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
    <table id="Table1" border="0" cellpadding="1" cellspacing="1" style="left: 8px; position: absolute; top: 14px" width="800">
            <tr>
                <td colspan="2" style="width: 1200px">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Height="24px"
                        Text="Agregar Archivos" Width="718px"></asp:Label></td>
            </tr>
        </table>
        <table id="Table2" border="0" cellpadding="1" cellspacing="1" style="z-index: 123;
            left: 14px; position: absolute; top: 63px" width="800">
            <tr>
            <td style="height: 160px" valign="top">
                <table style="width: 449px" id="Table3">
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="Label1" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 32px">
                            <asp:FileUpload ID="Fup1" runat="server" Width="571px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 1816px"></td>
                        <td style="width: 372px">
                        </td>
                        <td>
                            <asp:Button ID="Button2" runat="server" Text="Agregar" OnClientClick="this.disabled=true;" UseSubmitBehavior="false" /></td>
                    </tr>
                    <tr>
                        <td style="width: 1816px">
                                       

                    </td>
                        <td style="width: 372px">
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 1816px"></td>
                        <td style="width: 372px">
                        </td>
                        <td align="right">
                            <asp:Button ID="Button1" runat="server" Text="Cerrar" OnClick="Button1_Click" OnClientClick="return clearFileInputs();" /></td>
                    </tr>
                    <tr>
                        <td style="width: 1816px">
                            <asp:Label ID="ErrorMsg" runat="server" Font-Names="Arial Narrow" ForeColor="#C00000"></asp:Label></td>
                        <td style="width: 372px">
                        </td>
                        <td align="right">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            </td>
                    </tr>
                </table>
            </td>
            </tr>
            </table>
    </form>
</body>
<script language="javascript" type="text/javascript">
function Sube()
    {
        document.getElementById("Button2").disabled = true;
        __dopo
    }
</script>
</html>
