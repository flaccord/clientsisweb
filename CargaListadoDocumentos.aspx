<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CargaListadoDocumentos.aspx.vb" Inherits="CargaListadoDocumentos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Consulta y Gestión de Documentos</title>
    <style type="text/css">
        .grid .datatable{width:100%; border:none; padding:0px; margin:0px; color:#333;}
    </style>
</head>
<body>
    <form action="#" runat="server">
    <div>
        <asp:DataGrid ID="DataGrid1" runat="server" CssClass="datatable"
            Font-Name="Verdana" Font-Size="10pt" Cellpadding="4" HeaderStyle-BackColor="#444444"
            HeaderStyle-ForeColor="White" AlternatingRowStyle-BackColor="#dddddd"
            AutoGenerateColumns = "false">
            <Columns>
                <asp:ButtonColumn CommandName="Select" Text="&gt;&gt;">
                    <HeaderStyle Width="30px" />
                </asp:ButtonColumn>
                <asp:BoundColumn DataField="Documento" HeaderText="Documento">
                    <HeaderStyle Width="230px" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                        Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Digitalizado" HeaderText="Dig." Visible="true">
                    <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                        Font-Underline="False" HorizontalAlign="Center" Width="30px" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Version" HeaderText="Ver" Visible="true">
                    <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                        Font-Underline="False" HorizontalAlign="Center" Width="30px" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="KeyDocumento" HeaderText="KeyDocumento" Visible="False">
                </asp:BoundColumn>
                <asp:TemplateColumn>
                    <ItemTemplate>
                        <asp:Panel Visible="true" runat="server" ID="pnlSubir">
                            <a href='' onclick="javascript:window.open('CargarArchivos.aspx?IDDoc=<%# DataBinder.Eval(Container.DataItem,"KeyDocumento") %>'+GetParamsValue(),'AgregarImagenManual','left=0,top=0,width=750,height=400,toolbar=0,location=0,status=1,menubar=0,directories=0,scrollbars=0,resizable=0');"
                            style="color: #083984; font-style: normal;" >Agregar...</a>
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
