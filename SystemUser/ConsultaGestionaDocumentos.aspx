<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaGestionaDocumentos.aspx.cs" Inherits="Nemesis.Website.SystemUser.ConsultaGestionaDocumentos" %>

<!DOCTYPE html>
<html>
<head>
    <title>Consulta Gestiona Documentos</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/Site.css" rel="stylesheet" />
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.3.1.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

    <style>
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
                    <input type="file" class="btn btn-file" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-info" data-dismiss="modal">Sublr documento</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal End-->

    <form action="/" method="post" runat="server">
        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
            <div class="col-lg-12 col-md-12 col-sm-12 nopadding" id="selectedDocument-Header">
                <div class="col-lg-offset-3 col-lg-6 col-md-12 col-sm-12" id="selected-document">
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
                            <span><%=rfc %></span>
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <%=clienteName %>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div id="vista-section">
                            <div class="panel panel-default">
                                <div class="panel-heading"><span>Vista Previa</span></div>
                                <div class="panel-body panel-collapse collapse in" id="vista-previa">
                                    <div class="grid nopadding">
                                        <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-heading hide"><span class="selected-documentName"></span></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-8 col-md-12 col-sm-12">
                        <div id="documentos-section">
                            <div class="panel panel-default">
                                <div class="panel-heading"><span>Documentos</span></div>
                                <div class="panel-body panel-collapse collapse in" id="documentos">
                                    <div class="grid nopadding">
                                        <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
                                            <table class="datatable" cellspacing="0" cellpadding="0" border="0" id="gridviewSection" style="border-collapse: collapse;">
                                                <thead class="documentos-Thead">
                                                    <tr>
                                                        <th style="width: 245px; padding: 15px 0 10px;">Documento</th>
                                                        <th style="width: 80px; padding: 15px 0 10px;">Digital</th>
                                                        <th style="width: 110px; padding: 15px 0 10px;">Versión</th>
                                                        <th style="width: 110px; padding: 15px 0 10px;">Agregar</th>
                                                        <th style="width: 110px; padding: 15px 0 10px;">Vista Previa</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="documentos-Tbody">
                                                    <tr class="even">
                                                        <td>
                                                            <span>Identificación Oficial</span>
                                                        </td>
                                                        <td>
                                                            <span>Si</span>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="docVersion_1" runat="server" CssClass="form-control doc-version">
                                                                <asp:ListItem>1</asp:ListItem>
                                                                <asp:ListItem>2</asp:ListItem>
                                                                <asp:ListItem>3</asp:ListItem>
                                                                <asp:ListItem>4</asp:ListItem>
                                                                <asp:ListItem>5</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <a href="#" class="btn btn-default idnt-agr Agregar">
                                                                <i class="fa fa-plus"></i>&nbsp;
                                                                Agregar
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#" class="btn btn-default idnt-vista">
                                                                <i class="fa fa-search"></i>&nbsp;
                                                                Vista Previa
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr class="even">
                                                        <td>
                                                            <span>Comprobante de Domicilio</span>
                                                        </td>
                                                        <td>
                                                            <span>No</span>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="docVersion_2" runat="server" CssClass="form-control doc-version">
                                                                <asp:ListItem>1</asp:ListItem>
                                                                <asp:ListItem>2</asp:ListItem>
                                                                <asp:ListItem>3</asp:ListItem>
                                                                <asp:ListItem>4</asp:ListItem>
                                                                <asp:ListItem>5</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <a href="#" class="btn btn-default comp-agr Agregar">
                                                                <i class="fa fa-plus"></i>&nbsp;
                                                                Agregar
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#" class="btn btn-default comp-vista">
                                                                <i class="fa fa-search"></i>&nbsp;
                                                                Vista Previa
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr class="even">
                                                        <td>
                                                            <span>Estado de Cuenta</span>
                                                        </td>
                                                        <td>
                                                            <span>Si</span>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="docVersion_3" runat="server" CssClass="form-control doc-version">
                                                                <asp:ListItem>1</asp:ListItem>
                                                                <asp:ListItem>2</asp:ListItem>
                                                                <asp:ListItem>3</asp:ListItem>
                                                                <asp:ListItem>4</asp:ListItem>
                                                                <asp:ListItem>5</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <a href="#" class="btn btn-default estado-agr Agregar">
                                                                <i class="fa fa-plus"></i>&nbsp;
                                                                Agregar
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#" class="btn btn-default estado-vista">
                                                                <i class="fa fa-search"></i>&nbsp;
                                                                Vista Previa
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr class="even">
                                                        <td>
                                                            <span>Recibo de Nómina</span>
                                                        </td>
                                                        <td>
                                                            <span>Si</span>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="docVersion_4" runat="server" CssClass="form-control doc-version">
                                                                <asp:ListItem>1</asp:ListItem>
                                                                <asp:ListItem>2</asp:ListItem>
                                                                <asp:ListItem>3</asp:ListItem>
                                                                <asp:ListItem>4</asp:ListItem>
                                                                <asp:ListItem>5</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <a href="#" class="btn btn-default recibo-agr Agregar">
                                                                <i class="fa fa-plus"></i>&nbsp;
                                                                Agregar
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#" class="btn btn-default recibo-vista">
                                                                <i class="fa fa-search"></i>&nbsp;
                                                                Vista Previa
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    <tr class="even">
                                                        <td>
                                                            <span>Consulta Buró de Crédito</span>
                                                        </td>
                                                        <td>
                                                            <span>Si</span>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="docVersion_5" runat="server" CssClass="form-control doc-version">
                                                                <asp:ListItem>1</asp:ListItem>
                                                                <asp:ListItem>2</asp:ListItem>
                                                                <asp:ListItem>3</asp:ListItem>
                                                                <asp:ListItem>4</asp:ListItem>
                                                                <asp:ListItem>5</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <a href="#" class="btn btn-default consult-agr Agregar">
                                                                <i class="fa fa-plus"></i>&nbsp;
                                                                Agregar
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="#" class="btn btn-default consult-vista">
                                                                <i class="fa fa-search"></i>&nbsp;
                                                                Vista Previa
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
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
        $(document).ready(function (event) {

            $('#agregarModal').css("display", "none");

            $(".Agregar").on('click', function (event) {
                $('#agregarModal').modal('show');
            });

        });
    </script>
</body>
</html>
