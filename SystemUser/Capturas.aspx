<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Capturas.aspx.cs" Inherits="Nemesis.Website.SystemUser.Capturas" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
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
        table.dataTable thead .sorting_desc:after{
            content: unset !important;
        }
    </style>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Solicitud de Información</h1>
            </div>
        </div>

        <%--if single capturas details selected.--%>
        <%if (referenceId != "")
            {%>
        <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
            <div id="puntos-section">
                <div class="panel panel-default">
                    <div class="panel-heading"><a href="#Puntos" data-toggle="collapse">Puntos</a></div>
                    <div class="panel-body panel-collapse collapse in" id="Puntos">
                        <div class="grid nopadding">
                            <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
                                <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
                                    <div class="col-lg-5 col-xs-12 col-md-12 common-puntos">
                                        <span class="section-label">Edad</span>
                                        <span class="label-value">15</span>
                                    </div>
                                    <div class="col-lg-6 col-xs-12 col-md-12 common-puntos">
                                        <span class="section-label">Antigüedad en el Domicilio</span>
                                        <span class="label-value">15</span>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
                                    <div class="col-lg-5 col-xs-12 col-md-12 common-puntos">
                                        <span class="section-label">Vivienda</span>
                                        <span class="label-value">15</span>
                                    </div>
                                    <div class="col-lg-6 col-xs-12 col-md-12 common-puntos">
                                        <span class="section-label">Tipo de Empleo</span>
                                        <span class="label-value">15</span>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
                                    <div class="col-lg-5 col-xs-12 col-md-12 common-puntos">
                                        <span class="section-label">Antigüedad Laboral</span>
                                        <span class="label-value">15</span>
                                    </div>
                                    <div class="col-lg-6 col-xs-12 col-md-12 common-puntos">
                                        <span class="section-label">Nivel Endeudamiento</span>
                                        <span class="label-value">15</span>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
                                    <div class="col-lg-5 col-xs-12 col-md-12 common-puntos">
                                        <span class="section-label">Créditos MOP</span>
                                        <span class="label-value">15</span>
                                    </div>
                                    <div class="col-lg-6 col-xs-12 col-md-12 common-puntos">
                                        <span class="section-label">Score</span>
                                        <span class="label-value">15 (Buró:718)</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <% } %>


        <div class="row">
            <div class="col-lg-12 col-xs-12 col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body panel-collapse collapse in" id="Captura">
                        <table id="capturas_table" class="display responsive nowrap" style="width: 100%">
                            <thead>
                                <tr>
                                    <th>Fecha</th>
                                    <th>RFC</th>
                                    <th>Cliente</th>
                                    <th>Referencia Buró</th>
                                    <th>Puntos</th>
                                    <th>Semáforo</th>
                                    <th>Documentos</th>
                                    <th>Generar PDF</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span class="pd10">26/10/2016 13:09:24</span></td>
                                    <td>
                                        <label runat="server" class="pd10 anchor">HEME951213</label>
                                    </td>
                                    <td>ERICK IVAN HERNANDEZ</td>
                                    <td class="center">
                                        <label runat="server" class="pd10 anchor referencia_buro" data-value="1259649805">1259649805</label>
                                    </td>
                                    <td class="center">
                                        <a class="pd10 error" href="Capturas.aspx?Ref=1259649805">65</a>
                                    </td>
                                    <td class="center amarilio">
                                        <span class="color-section pd10">Amarilio</span>
                                    </td>
                                    <td style="padding: 10px 10px !important;">
                                        <a class="btn btn-default" onclick="openConsultaDocumentos('76','HEME951213','ERICK IVAN HERNANDEZ');">
                                            <i class="fa fa-file-text-o"></i>
                                            Documentos
                                        </a>
                                    </td>
                                    <td style="padding: 10px 10px !important;">
                                        <button class="btn btn-default">
                                            <i class="fa fa-file-pdf-o" aria-hidden="true"></i>
                                            Contrato
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.17/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.2/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/select/1.2.6/js/dataTables.select.min.js"></script>
    <script src="https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js"></script>
    <script>
        $(document).ready(function () {

            $('#capturas_table').DataTable({
                "columns": [
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                ]
            });


            $(".referencia_buro").on("click", function (event) {
                debugger;
                var ref = event.target.dataset.value;
                var windowObjectReference;
                if (ref) {
                    windowObjectReference = window.open(
                        "Detalleconsultas.aspx?Ref=" + ref,
                        "DescriptiveWindowName",
                        "resizable,scrollbars,status"
                    );
                }
            });
            
        });
    </script>
</asp:Content>
