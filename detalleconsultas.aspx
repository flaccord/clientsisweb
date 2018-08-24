<%@ Page Language="VB" AutoEventWireup="false" CodeFile="detalleconsultas.aspx.vb" Inherits="detalleconsultas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Consulta de Clientes Web</title>
    <link href="disenio1/newdesign/bootstrap.min.css" rel="stylesheet" />
    <link href="disenio1/newdesign/sb-admin-2.css" rel="stylesheet" />
    <link rel="text/css" href="https://editor.datatables.net/extensions/Editor/css/editor.dataTables.min.css" />
    <link rel="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
    <link rel="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" />
    <link rel="text/css" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css" />
    <link rel="text/css" href="https://cdn.datatables.net/select/1.2.6/css/select.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />
    <script src="disenio1/Scripts/jquery-3.3.1.min.js" type="text/javascript"></script>
    <link href="disenio1/newdesign/Site.css" rel="stylesheet" />
    <script type="text/javascript" src='js/BASE64JS.js'></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <style type="text/css">
        table.dataTable.dtr-inline.collapsed > tbody > tr > th:first-child:before {
            top: 8px;
            left: 4px;
            height: 16px;
            width: 16px;
            display: block;
            position: absolute;
            color: white;
            border: 2px solid white;
            border-radius: 16px;
            box-shadow: 0 0 3px #444;
            box-sizing: content-box;
            font-family: 'Courier New', Courier, monospace;
            text-indent: 4px;
            line-height: 16px;
            content: '+';
            background-color: #008CBA;
        }

        .grid .datatable {
            width: 100%;
            border: none;
            padding: 0px;
            margin: 0px;
            color: #333;
        }

            .grid .datatable th, .grid .datatable td {
                padding: 6px 3px;
                font-weight: bold;
                text-align: left;
                font-size: 10pt;
                border-bottom: solid 1px #BDBDBD;
                vertical-align: middle;
                /*font-family: Consolas, "Andale Mono", "Lucida Console", "Lucida Sans Typewriter", Monaco, "Courier New", monospace;*/
            }

        #gridviewSection tr td label {
            font-weight: normal;
        }

        .main-grid {
            padding: 15px;
        }

        .grid .datatable tr.even {
            background-color: #F2F2F2;
        }

        .panel-body {
            padding: 0px;
        }

        #puntos-section .panel-body {
            padding: 10px 10px 35px 10px;
            font-size: 14px;
            font-weight: 500;
            color: black;
        }

        #puntos-section {
            margin: 0 auto;
            width: 60%;
        }

        .common-puntos {
            padding: 7px;
            border-top: 1px solid #ddd;
            /*border-bottom: 1px solid #ddd;*/
        }

            .common-puntos:nth-child(odd) {
                margin-right: 30px;
            }

        .label-value {
            float: right;
        }

        #capturas_table_info, #capturas_table_paginate {
            display: none;
        }

        table.dataTable thead .sorting:after, table.dataTable thead .sorting_asc:after,
        table.dataTable thead .sorting_desc:after {
            content: unset !important;
        }
    </style>
    <script type="text/javascript" src='js/BASE64JS.js'></script>
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

            ajax.onreadystatechange = function () {
                if (ajax.readyState == 4) {
                    midiv.innerHTML = ajax.responseText;
                }
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="menu" style="width: 100%; height: 100%; vertical-align: middle; text-align: left;">
        </div>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container">
            <div class="page-wrapper">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="col-lg-12 col-xs-12 col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading"><a href="#detalleConsultas" data-toggle="collapse">Consulta de Cliente</a></div>
                                <div class="panel-body panel-collapse collapse in" id="detalleConsultas">
                                    <div id="UpdatePanel">
                                        <asp:GridView
                                            ID="GridView1"
                                            runat="server"
                                            CssClass="datatable"
                                            CellPadding="0"
                                            CellSpacing="0"
                                            GridLines="None"
                                            AutoGenerateColumns="False">

                                            <RowStyle CssClass="even" />
                                            <HeaderStyle CssClass="header" />
                                            <AlternatingRowStyle CssClass="odd" />

                                            <Columns>
                                                <asp:BoundField HeaderText="ID" DataField="id_consulta"></asp:BoundField>
                                                <asp:BoundField HeaderText="Fecha Actualizacion" DataField="fecha_actualizacion"></asp:BoundField>
                                                <asp:BoundField HeaderText="Usuario" DataField="nombre_usuario"></asp:BoundField>
                                                <asp:BoundField HeaderText="Producto" DataField="producto"></asp:BoundField>
                                                <asp:BoundField HeaderText="Fecha Credito" DataField="fecha_credito"></asp:BoundField>
                                                <asp:BoundField HeaderText="fecha Cierre" DataField="fecha_cierre"></asp:BoundField>
                                                <asp:BoundField DataFormatString="{0:C}" HeaderText="Saldo Actual" DataField="saldo_actual"></asp:BoundField>
                                                <asp:BoundField DataFormatString="{0:C}" HeaderText="Saldo Vencido" DataField="saldo_vencido"></asp:BoundField>
                                                <asp:TemplateField HeaderText="MOP">
                                                    <ItemTemplate>
                                                        <asp:HyperLink ToolTip='<%# Eval("descripcion", "{0}") %>' ID="HyperLink1" runat="server" NavigateUrl="#"><%# Eval("mop", "{0}") %></asp:HyperLink>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="Historico Pagos" DataField="historico_pagos"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Clave Observacion">
                                                    <ItemTemplate>
                                                        <asp:HyperLink ToolTip='<%# Eval("nombre", "{0}") %>' ID="HyperLink1" runat="server" NavigateUrl="#"><%# Eval("clave_observacion", "{0}") %></asp:HyperLink>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>

                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>




                <asp:Label ID="ErrorMsg" runat="server" CssClass="ErrorMsj1"></asp:Label>
            </div>
            <!-- grid -->
        </div>
        <!-- divGrid -->
    </form>

    <script src="https://code.jquery.com/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/1.10.17/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.2/js/dataTables.responsive.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/select/1.2.6/js/dataTables.select.min.js" type="text/javascript"></script>
    <%--<script src="https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js"></script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            window.onload = function () {
                $('#GridView1').DataTable({});
            }
        });
    </script>
</body>
</html>
