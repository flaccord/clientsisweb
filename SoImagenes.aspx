<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SoImagenes.aspx.vb" Inherits="So_SoImagenes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistema de Gestión de Peticiones - Documentos Solicitudes -</title>
    <script type="text/javascript">

        function disableContextMenu2() {
            document.oncontextmenu = function () {
                return false;
            }
        }

        function abrir_agregaop() {
            window.open('SoAgregaImagenMO.aspx?IDvar=' + VIDvar + '&IdTipo=' + IdTipo, 'AgregarImagenManual', 'left=0,top=0,width=700,height=380,toolbar=0,location=0,status=1,menubar=0,directories=0,scrollbars=0,resizable=0');
        }
        function document.onkeydown() {
            if (event.keyCode == 123) {
                event.keyCode = 0;
                event.cancelBubble = true;
                return false;
            }
        } 
    </script>
    <link href="../Estilos.css" rel="stylesheet" type="text/css" />
</head>
<body oncontextmenu="disableContextMenu2();">
    <form id="form1" runat="server">
    <div>
        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="6" Font-Names="Arial"
            Font-Size="XX-Small" ForeColor="#333333" GridLines="Vertical" TabIndex="10" Width="450px"
            Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
            Font-Underline="False">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <ItemStyle CssClass="GridRow" />
            <EditItemStyle BackColor="#2461BF" />
            <SelectedItemStyle CssClass="GridRowS" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle CssClass="GridHead" />
            <AlternatingItemStyle CssClass="GridRowA" />
            <Columns>
                <asp:ButtonColumn CommandName="Select" Text="&gt;&gt;">
                    <HeaderStyle Width="30px" />
                </asp:ButtonColumn>
                <asp:BoundColumn DataField="Orden" HeaderText="Orden">
                    <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                        Font-Underline="False" HorizontalAlign="Center" Width="30px" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Documento" HeaderText="Documento">
                    <HeaderStyle Width="230px" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                        Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Lado" HeaderText="Lado" Visible="False">
                    <HeaderStyle Width="70px" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                        Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Digitalizado" HeaderText="Dig." Visible="true">
                    <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                        Font-Underline="False" HorizontalAlign="Center" Width="30px" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Correcto" HeaderText="Correcto (Revisado)" Visible="false">
                    <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                        Font-Underline="False" HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Clave" HeaderText="Clave" Visible="False">
                    <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                        Font-Underline="False" HorizontalAlign="Center" Width="70px" />
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="Ver." HeaderStyle-Width="30px">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td colspan="2" style="font-size:xx-small; color:#1A4274;">
                                    <asp:Label ID="lblVersion" runat="server" Text='<%# Bind("PVersion") %>'>
                                    </asp:Label>
                                    <asp:HiddenField ID="hdfVer" runat="server" Value='<%# Bind("PVersion") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td style="font-size:xx-small; color:#1A4274;">
                                    <asp:LinkButton ID="lnkAtras" Text="&lt;&lt;" Visible='<%# Eval("Visible") %>' runat="server"
                                        CommandArgument='<%# Eval("Clave") + "|" + Eval("Lado") + "|" + Eval("PVersion") + "|" + Eval("Orden") %>'
                                        OnCommand="lnkAtras_Command"></asp:LinkButton>
                                </td>
                                <td style="font-size:xx-small; color:#1A4274;">
                                    <asp:LinkButton ID="lnkAdelante" Text="&gt;&gt;" Visible='<%# Eval("Visible") %>'
                                        runat="server" CommandArgument='<%# Eval("Clave") + "|" + Eval("Lado") + "|" + Eval("PVersion") + "|" + Eval("Orden") %>'
                                        OnCommand="lnkAdelante_Command"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <HeaderStyle Width="30px"></HeaderStyle>
                </asp:TemplateColumn>
                <asp:TemplateColumn>
                    <ItemTemplate>
                        <asp:Panel Visible='<%# Eval("SubirOk") %>' runat="server" ID="pnlSubir">
                            <a href='<%# DataBinder.Eval(Container.DataItem, "AgregaDoc1")  %>' onclick="javascript:window.open('<%# DataBinder.Eval(Container.DataItem, "AgregaDoc")  %>','AgregarImagenManual','left=0,top=0,width=750,height=400,toolbar=0,location=0,status=1,menubar=0,directories=0,scrollbars=0,resizable=0');"
                            style="color: #083984; font-style: normal;" >Agregar...</a>
                        </asp:Panel>
                        <asp:Label Visible='<%# Eval("msjSubir") %>' ID="lblMsjOk" Text="Validado" runat="server" Font-Names="Arial Narrow" ForeColor="#217346" Font-Size="10pt"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
        </asp:DataGrid>
        <asp:Label ID="ErrorMsg" runat="server" Font-Names="Arial Narrow" ForeColor="#C00000"></asp:Label><asp:HyperLink
            ID="HyperLink2" runat="server" Font-Bold="False" Font-Names="Arial" Font-Overline="False"
            Font-Size="XX-Small" Font-Underline="True" ForeColor="#083984" Style="z-index: 100;
            left: 323px; position: relative; top: 5px" Width="105px" NavigateUrl='javascript:abrir_agregaop();'>Agregar Opcionales...</asp:HyperLink><br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Generar Archivo Digital" Enabled="False"
            Width="239px" OnClientClick="botondsb();" />
        <asp:Button ID="Button2" runat="server" Text="Nueva Versión" Visible="False" Width="166px" /><br />
        <br />
        <asp:Label ID="Label1" runat="server" CssClass="textMsj3">Archivo:</asp:Label>
        <asp:Button ID="Buttonexp" runat="server" Text="Consultar Archivo Digital" Width="157px" />
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Width="308px" CssClass="textMsj3"></asp:HyperLink></div>
    </form>
</body>
<script language="javascript" type="text/javascript">
    function botondsb() {
        document.getElementById("Button1").disabled = true;
        __doPostBack('Button1', '');
    }
</script>
</html>
