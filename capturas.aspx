<%@ Page Language="VB" AutoEventWireup="false" CodeFile="capturas.aspx.vb" Inherits="capturas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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

        function verCreditos(cred) {
            if (cred != '') {
                var w = 1200;
                var h = 500;
                var LeftPosition = (screen.width) ? (screen.width - w) / 2 : 100;
                var TopPosition = (screen.height) ? (screen.height - h) / 2 : 100;
                var config = "width=" + w + ", height=" + h + ", left=" + LeftPosition + ", top=" + TopPosition + ", toolbar=0,location=0,status=1,menubar=0,directories=0,scrollbars=1,resizable=0";
                var urlace = "detalleconsultas.aspx?Ref=" + cred;
                window.open(urlace, "Detalle Creditos", config);
            }
        }

        function verDatosCli(cred) {
            if (cred != '') {
                var w = 1200;
                var h = 500;
                var LeftPosition = (screen.width) ? (screen.width - w) / 2 : 100;
                var TopPosition = (screen.height) ? (screen.height - h) / 2 : 100;
                var config = "width=" + w + ", height=" + h + ", left=" + LeftPosition + ", top=" + TopPosition + ", toolbar=0,location=0,status=1,menubar=0,directories=0,scrollbars=1,resizable=0";
                var urlace = "datoscliente.aspx?Ref=" + cred;
                window.open(urlace, "Datos Cliente", config);
            }
        }

        function verCapDatosCli(ref) {
            if (ref != '') {
                window.location = "solicitudcreditoPrest.aspx?Ref=" + ref;
            }
        }

        function verDocumentos(cred, rfc, cliente) {
            debugger;
            if (cred != '') {
                var w = 1000;
                var h = 680;
                var LeftPosition = (screen.width) ? (screen.width - w) / 2 : 100;
                var TopPosition = (screen.height) ? (screen.height - h) / 2 : 100;
                var config = "width=" + w + ", height=" + h + ", left=" + LeftPosition + ", top=" + TopPosition + ", toolbar=0,location=0,status=1,menubar=0,directories=0,scrollbars=1,resizable=0";
                var urlace = "CargaListadoDocumentosVer.aspx?IDRef=" + cred + "&rfc=" + rfc + "&cliente=" + cliente;
                window.open(urlace, "Documentos", config);
            }
        }

        function verMasinformacion(ref) {
            debugger;
            if (ref != '') {
                window.location = "capturas.aspx?Ref=" + ref;
            }
        }
    </script>

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
</head>
<body>
    <iframe id="menu" style="width: 100%; height: 1000px; vertical-align: middle; text-align: left;" src="menu.aspx?m=6qfo0PQf" scrolling="no" frameborder="0" runat="server"></iframe>
    <div class="container registro1" style="position: absolute; top: 50px; padding: 0; width: 100%; opacity: 1; background-repeat: repeat-y">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header" id="PageHeading" runat="server"></h1>
                </div>
            </div>
            <div class="row">
                <form runat="server" id="form1">
                    <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
                        <div id="tablepuntosysema" runat="server">
                            <div class="panel panel-default">
                                <div class="panel-heading"><a href="#Puntos" data-toggle="collapse">Puntos</a></div>
                                <div class="panel-body panel-collapse collapse in" id="Puntos">
                                    <div class="grid nopadding">
                                        <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
                                            <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
                                                <div class="col-lg-5 col-xs-12 col-md-12 common-puntos">
                                                    <span class="section-label">Edad</span>
                                                    <asp:Label CssClass="label-value" ID="puntosedad" runat="server"></asp:Label>
                                                </div>
                                                <div class="col-lg-6 col-xs-12 col-md-12 common-puntos">
                                                    <span class="section-label">Antigüedad en el Domicilio</span>
                                                    <asp:Label CssClass="label-value" ID="puntosantdomi" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
                                                <div class="col-lg-5 col-xs-12 col-md-12 common-puntos">
                                                    <span class="section-label">Vivienda</span>
                                                    <asp:Label CssClass="label-value" ID="puntosvivienda" runat="server"></asp:Label>
                                                </div>
                                                <div class="col-lg-6 col-xs-12 col-md-12 common-puntos">
                                                    <span class="section-label">Tipo de Empleo</span>
                                                    <asp:Label CssClass="label-value" ID="puntostipoempleo" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
                                                <div class="col-lg-5 col-xs-12 col-md-12 common-puntos">
                                                    <span class="section-label">Antigüedad Laboral</span>
                                                    <asp:Label CssClass="label-value" ID="puntosantlaboral" runat="server"></asp:Label>
                                                </div>
                                                <div class="col-lg-6 col-xs-12 col-md-12 common-puntos">
                                                    <span class="section-label">Nivel Endeudamiento</span>
                                                    <asp:Label CssClass="label-value" ID="puntosnivelendeuda" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
                                                <div class="col-lg-5 col-xs-12 col-md-12 common-puntos">
                                                    <span class="section-label">Créditos MOP</span>
                                                    <asp:Label CssClass="label-value" ID="puntosmop" runat="server"></asp:Label>
                                                </div>
                                                <div class="col-lg-6 col-xs-12 col-md-12 common-puntos">
                                                    <span class="section-label">Score</span>
                                                    <span class="right">
                                                        <asp:Label ID="puntosscore" runat="server"></asp:Label>
                                                        ( Buró: <asp:Label ID="scoreburo" runat="server"></asp:Label> )
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:ScriptManager ID="ScriptManager1" runat="server" />
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="col-lg-12 col-xs-12 col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-body panel-collapse collapse in" id="Captura">
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
                                                <asp:BoundField HeaderText="Fecha" DataField="fecha"></asp:BoundField>

                                                <asp:TemplateField HeaderText="RFC">
                                                    <ItemTemplate>
                                                        <asp:HyperLink ToolTip="Datos Cliente..." ID="HyperLink7" runat="server" NavigateUrl=<%# "javascript:verCapDatosCli('" & Eval("referenciaburo", "{0}") & "')" %>><%# Eval("rfc", "{0}") %></asp:HyperLink>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:BoundField HeaderText="Cliente" DataField="nombre" ControlStyle-Font-Size="13px"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Referencia Buro">
                                                    <ItemTemplate>
                                                        <asp:HyperLink ToolTip="Mas información..." ID="HyperLink3" runat="server" NavigateUrl=<%# "javascript:verCreditos('" & Eval("referenciaburo", "{0}") & "')" %>><%# Eval("referenciaburo", "{0}") %></asp:HyperLink>
                                                        <br>
                                                        <font color="FF0000"><%# Eval("errorburo", "{0}") %></font>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Puntos">
                                                    <ItemTemplate>
                                                        <asp:HyperLink ToolTip="Mas información..." ID="HyperLink6" runat="server" ForeColor="Red" NavigateUrl=<%# "javascript:verMasinformacion('" & Eval("referenciaburo", "{0}") & "')" %>><%# Eval("Puntos", "{0}") %></asp:HyperLink>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="Semáforo" DataField="Semaforo"></asp:BoundField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="center">
                                                    <ItemTemplate>
                                                        <a class="btn btn-default" id="HyperLink4" runat="server" href=<%# "javascript:verDocumentos('" & Eval("Id", "{0}") & "','" & Eval("rfc", "{0}") & "','" & Eval("nombre", "{0}") & "')" %>>
                                                            <i class="fa fa-file-text-o"></i>
                                                            Documentos
                                                        </a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="center">
                                                    <ItemTemplate>

                                                        <a id="Buttondoc" onserverclick="Buttondoc_Click" runat="server" name='<%# Eval("referenciaburo") %>' class="btn btn-default" download>
                                                            <i class="fa fa-file-pdf-o" aria-hidden="true"></i>
                                                            Contrato
                                                        </a>
                                                        <%--<asp:Button CssClass="btn btn-default" ToolTip="Generar PDF" ID="PdfButton" Text=" <i class='fa fa-file-pdf-o' aria-hidden='true'></i> Contrato" name='<%# Eval("referenciaburo") %>' OnClick="Buttondoc_Click" runat="server" />--%>
                                                        <%--<i class="fa fa-file-pdf-o" aria-hidden="true"></i>
                                                                Contrato
                                                            </asp:Button>--%>
                                                        <%--<asp:LinkButton runat="server" OnClick="Buttondoc_Click" ToolTip="Generar PDF" ID="PdfButton" name='<%# Eval("referenciaburo") %>' CssClass="btn btn-default">
                                                                <i class="fa fa-file-pdf-o" aria-hidden="true"></i>
                                                                Contrato
                                                            </asp:LinkButton>--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <asp:Label ID="ErrorMsg" runat="server" CssClass="ErrorMsj1"></asp:Label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/1.10.17/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.2/js/dataTables.responsive.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/select/1.2.6/js/dataTables.select.min.js" type="text/javascript"></script>
    <%--<script src="https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js"></script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            window.onload = function () {
                $('table tr.header th:nth-child(1)').css("width", "100px");
                $('table tr.header th:nth-child(2)').css("width", "120px");
                $('table tr.header th:nth-child(3)').css("width", "130px");
                $('table tr.header th:nth-child(7)').css("width", "110px");
                $('table tr.header th:nth-child(8)').css("width", "100px");

                $('table tr.header th:nth-child(4)').css("text-align", "center");
                $("#GridView1 tr:nth-child(1) th:nth-child(7)")[0].innerText = "Documentos";
                $("#GridView1 tr:nth-child(1) th:nth-child(8)")[0].innerText = "Generar PDF";
                $('#GridView1').DataTable({});



            }
        });
    </script>
</body>
</html>
