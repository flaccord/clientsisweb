<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CargaListadoDocumentosVer.aspx.vb" Inherits="CargaListadoDocumentosVer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Consulta y Gestión de Documentos</title>
    <script src="disenio1/Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
    <link href="disenio1/newdesign/bootstrap.min.css" rel="stylesheet" />
    <%--<link href="disenio1/newdesign/sb-admin-2.css" rel="stylesheet" />--%>
    <script src="disenio1/Scripts/bootstrap.min.js" type="text/javascript"></script>
    <link href="disenio1/newdesign/bootstrap-theme.css" rel="stylesheet" />
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="disenio1/newdesign/Site.css" rel="stylesheet" />

    <style type="text/css">
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

        label {
            font-weight: 700;
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

        td, tr {
            border: none;
        }

        #DataGrid1 {
            border: none;
            width: 100%;
        }

            #DataGrid1 tbody tr:nth-child(1) {
                border-bottom: 2px solid #e3e3e3;
            }

            #DataGrid1 tbody tr td {
                padding: 10px 0;
            }

                #DataGrid1 tbody tr td:nth-child(1) {
                    padding: 15px 0 10px !important;
                }

        .btn-default {
            background-image: unset !important;
        }

        .comp-vista {
            /*margin: 10px 0 !important;*/
            padding: 6px 10px !important;
            color: black;
            border: 1px solid #ccc;
        }

        .panel .grid {
            overflow: hidden;
        }

        .comp-vista a {
            color: black;
        }

        .modal-body {
            padding: 0px !important;
        }

        #agreraCancel {
            position: absolute;
            bottom: 13px;
            right: 167px;
        }
    </style>
</head>
<body>
    <!-- Modal Start-->
    <div id="agregarModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Agregar Document</h4>
                </div>
                <div class="modal-body">
                    <iframe id="agrerarDocument" style="width: 100%; height: auto; vertical-align: middle; text-align: left;" src="" scrolling="no" frameborder="0" runat="server"></iframe>
                    <%--<input type="file" class="btn btn-file" />--%>
                </div>
                <button type="button" id="agreraCancel" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <%--<div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                </div>--%>
            </div>
            <script type="text/javascript">

                window.onload = new function () {
                    debugger;
                    if ($("#CloseModal").value == "true") {
                        $(document.getElementById('agregarModal')).modal('hide');
                    }
                }
            </script>
        </div>
    </div>
    <!-- Modal End-->

    <form action="/" method="post" runat="server">
        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
            <div class="col-lg-12 col-md-12 col-sm-12 nopadding" id="selectedDocument-Header">
                <div class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-12" id="selected-document">
                    <div class="col-lg-12 col-md-12 col-sm-12 nopadding" id="selected-title">
                        <div class="col-lg-4 col-md-4 col-sm-4 nopadding">
                            <label>RFC</label>
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <label>Nombre del Cliente</label>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 nopadding mgtop10" id="selected-values">
                        <div class="col-lg-4 col-md-4 col-sm-4 nopadding">
                            <asp:Label ID="rfc" runat="server"></asp:Label>
                            <asp:Label ID="valoratras" runat="server" Visible="False"></asp:Label>
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <asp:Label ID="cliente" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="col-lg-4 col-md-4 col-sm-12">
                        <div id="vista-section">
                            <div class="panel panel-default">
                                <div class="panel-heading"><span>Vista Previa</span></div>
                                <div class="panel-body panel-collapse collapse in" id="vista-previa">
                                    <div class="grid nopadding">
                                        <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
                                            <img src="images\Imagen_no_disponible.png" alt="Imagen" name="imgLoadN" id="imgLoad" width="300" style="height: 300px" />
                                        </div>
                                    </div>
                                </div>
                                <asp:Panel CssClass="panel-heading" runat="server" ID="lowerPanelHeading">
                                    <asp:Label ID="SelectedDoc" runat="server"></asp:Label>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-8 col-md-8 col-sm-12">
                        <div id="documentos-section">
                            <div class="panel panel-default">
                                <input type="hidden" id="SelectedFileSource" value="" runat="server" />
                                <div class="panel-heading"><span>Documentos</span></div>
                                <div class="panel-body panel-collapse collapse in" id="documentos">
                                    <div class="grid nopadding">
                                        <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
                                            <asp:DataGrid ID="DataGrid1" runat="server" CssClass="datatable"
                                                Font-Name="Verdana" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:BoundColumn DataField="Documento" HeaderText="Documento">
                                                        <HeaderStyle Width="245px" Font-Bold="true" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Digitalizado" HeaderText="Digital" Visible="true">
                                                        <HeaderStyle Width="80px" Font-Bold="true" />
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn HeaderText="Versión" HeaderStyle-Font-Bold="true" HeaderStyle-Width="110px">
                                                        <ItemTemplate>
                                                            <asp:DropDownList SelectedValue='<%# Bind("Version") %>' ID="SelectedVersion" runat="server" CssClass="form-control doc-version">
                                                                <asp:ListItem Value="0" Text="0"></asp:ListItem>
                                                                <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                                                <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                                                <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                                                <asp:ListItem Value="5" Text="5"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:HiddenField ID="hdfVer" runat="server" Value='<%# Bind("Version") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle></HeaderStyle>
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="KeyDocumento" HeaderText="KeyDocumento" Visible="False"></asp:BoundColumn>
                                                    <asp:TemplateColumn HeaderText="Agregar" HeaderStyle-Font-Bold="true" HeaderStyle-Width="110px">
                                                        <ItemTemplate>
                                                            <asp:Panel Visible="true" runat="server" ID="pnlSubir">
                                                                <%--<a href="#" onclick="javascript:window.open('CargarArchivos.aspx?IDDoc=<%# DataBinder.Eval(Container.DataItem, "KeyDocumento") %>'+GetParamsValue(),'AgregarImagenManual','left=0,top=0,width=750,height=400,toolbar=0,location=0,status=1,menubar=0,directories=0,scrollbars=0,resizable=0');" class="btn btn-default comp-agr Agregar">--%>
                                                                <a href="#" class="btn btn-default comp-agr Agregar" data-value="CargarArchivos.aspx?IDDoc=<%# DataBinder.Eval(Container.DataItem, "KeyDocumento") %>" />
                                                                <i class="fa fa-plus"></i>&nbsp;
                                                                    Agregar
                                                                </a>
                                                                <script type="text/javascript">
                                                                    function GetParamsValue() {
                                                                        var hf_value = '&IDRef=' + document.location.href.split("IDRef=")[1];
                                                                        return hf_value;
                                                                    }
                                                                </script>
                                                            </asp:Panel>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn HeaderText="Vista Previa" HeaderStyle-Font-Bold="True" HeaderStyle-Width="110px">
                                                        <ItemTemplate>
                                                            <asp:Panel Visible="True" runat="server">
                                                                <a class="btn btn-Default comp-vista" href="CargaListadoDocumentosVer.aspx?IDRef=<%#IDRef%>&cliente=<%#ClienteValue%>&rfc=<%# RfcValue %>&FVer=<%# Eval("Version") %>&IDDoc=<%# DataBinder.Eval(Container.DataItem, "KeyDocumento") %>">
                                                                    <i class="fa fa-search"></i>&nbsp;
                                                                    Vista Previa
                                                                </a>
                                                            </asp:Panel>

                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        debugger;
        jQuery(document).ready(function (event) {

            jQuery('#agregarModal').css("display", "none");

            function CloseIframeModal() {
                jQuery('#agregarModal').modal('hide');
            }

            jQuery(".Agregar").on('click', function (event) {
                debugger;
                jQuery('#agregarModal').modal('show');
                var hf_value = 'IDRef=' + document.location.href.split("IDRef=")[1];
                var iframeURL = "";
                if (hf_value.indexOf("IDDoc") > 0) {
                    iframeURL = event.target.dataset.value.split("?")[0] + "?";
                }
                else {
                    iframeURL = event.target.dataset.value + "&";
                }
                //var iframeURL = event.target.dataset.value.split("?")[0];
                $("#agrerarDocument").attr("src", iframeURL + hf_value);
            });

            window.onload = function () {
                debugger;
                if ($("#SelectedFileSource").val()) {
                    $("#imgLoad").attr("src", $("#SelectedFileSource").val());
                    console.log($("#SelectedFileSource").val());
                }

                $.urlParam = function (name) {
                    var results = new RegExp('[\?&]' + name + '=([^&#]*)')
                        .exec(window.location.search);

                    return (results !== null) ? results[1] || 0 : false;
                }
                debugger;
                var FileVersion = $.urlParam("FVer");
                var DocumentType = $.urlParam("IDDoc");
                if (FileVersion > "0" && DocumentType > "0") {
                    $(".doc-version")[parseInt(DocumentType) - 1].selectedIndex = FileVersion;
                }
                

            }

            $("select.doc-version").on('change', function (o) {
                debugger;
                var id = o.target.id;
                $($("#" + id).parent().siblings()[3]).find("a").attr('href', function (i, a) {
                    debugger;
                    return a.replace(/FVer=([^&]+)/, function (_, oldval) {
                        return 'FVer=' + (parseInt(o.target.value))

                    });
                });
            });
        });


    </script>
</body>
</html>
