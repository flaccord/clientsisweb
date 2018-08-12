<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CargaListadoDocumentosVer.aspx.vb" Inherits="CargaListadoDocumentosVer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Consulta y Gestión de Documentos</title>
    <style type="text/css">
        .grid .datatable{width:100%; border:#ffffff; padding:0px; margin:0px; color:#ffffff;}
		.TablaCliente{
			padding:6px 3px; 
			font-weight:bold; 
			text-align:left; 
			font-size:11pt; 
			vertical-align:middle;
			font-family:Consolas, "Andale Mono", "Lucida Console", "Lucida Sans Typewriter", Monaco, "Courier New", monospace;
		}
    </style>
</head>
<body>
	<table id="tablecliente" class="TablaCliente" width="400" align="center" runat="server">
  <!--DWLayoutTable-->
  <tr>
    <td valign="top">RFC:</td>
    <td valign="top" style="cursor: pointer"><asp:Label ID="rfc" runat="server" ></asp:Label><asp:Label ID="valoratras" runat="server" Visible="False" ></asp:Label></td>
  </tr>
  <tr>
    <td valign="top">Cliente:</td>
    <td valign="top" runat="server" id="semaforotd"><asp:Label ID="cliente" runat="server" ></asp:Label></td>
  </tr>
  <tr>
    <td valign="top">Documento:</td>
    <td valign="top" runat="server" id="documentotd"><asp:Label ID="documentoselect" runat="server" ></asp:Label></td>
  </tr>
</table>
    <form action="#" runat="server">
    <div>
        <asp:DataGrid ID="DataGrid1" runat="server" CssClass="datatable"
            Font-Name="Verdana" Font-Size="10pt" Cellpadding="4" 
            HeaderStyle-ForeColor="White" AlternatingRowStyle-BackColor="#dddddd"
            AutoGenerateColumns = "false">
            <Columns>
                <asp:ButtonColumn CommandName="Select" Text="&gt;&gt;" ItemStyle-ForeColor="White" >
                    <HeaderStyle Width="30px"  />
                </asp:ButtonColumn>
                <asp:BoundColumn DataField="Documento" HeaderText="Documento" ItemStyle-ForeColor="White">
                    <HeaderStyle Width="230px" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                        Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" ForeColor="White" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Digitalizado" HeaderText="Dig." Visible="true" ItemStyle-ForeColor="White">
                    <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                        Font-Underline="False" HorizontalAlign="Center" Width="30px" ForeColor="White" />
                </asp:BoundColumn>
                <asp:TemplateColumn HeaderText="Ver." HeaderStyle-Width="30px" ItemStyle-ForeColor="White">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td colspan="2" style="font-size:xx-small; color:#ffffff;">
                                    <asp:Label ID="lblVersion" runat="server" Text='<%# Bind("Version") %>'>
                                    </asp:Label>
                                    <asp:HiddenField ID="hdfVer" runat="server" Value='<%# Bind("Version") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td style="font-size:xx-small; color:#ffffff;">
                                    <asp:LinkButton ID="lnkAtras" Text="&lt;&lt;" runat="server"
                                        CommandArgument='<%# Eval("Version") %>' ForeColor="White" 
                                        OnCommand="lnkAtras_Command"></asp:LinkButton>
                                </td>
                                <td style="font-size:xx-small; color:#ffffff;">
                                    <asp:LinkButton ID="lnkAdelante" Text="&gt;&gt;"
                                        runat="server" CommandArgument='<%# Eval("Version") %>' ForeColor="White" 
                                        OnCommand="lnkAdelante_Command"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <HeaderStyle Width="30px"></HeaderStyle>
                </asp:TemplateColumn>
                <asp:BoundColumn DataField="KeyDocumento" HeaderText="KeyDocumento" Visible="False">
                </asp:BoundColumn>
                <asp:TemplateColumn ItemStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Panel Visible="true" runat="server" ID="pnlSubir">
                            <a href='' onclick="javascript:window.open('CargarArchivos.aspx?IDDoc=<%# DataBinder.Eval(Container.DataItem,"KeyDocumento") %>'+GetParamsValue(),'AgregarImagenManual','left=0,top=0,width=750,height=400,toolbar=0,location=0,status=1,menubar=0,directories=0,scrollbars=0,resizable=0');"
                            style="color: #ffffff; font-style: normal;" >Agregar...</a>
                            <script type="text/javascript">
                                function GetParamsValue() {
                                    var hf_value = '&IDRef=' + document.location.href.split("IDRef=")[1];
                                    return hf_value;
                                }
                            </script>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
        </asp:DataGrid> </div>
        </form>
    </body>
</html>
