<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detalleconsultas.aspx.cs" Inherits="Nemesis.Website.SystemUser.Detalleconsultas" %>

<!DOCTYPE html>
<html>
<head>
    <title>Referencia Buro</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/Site.css" rel="stylesheet" />
    <link rel="text/css" href="https://editor.datatables.net/extensions/Editor/css/editor.dataTables.min.css" />
    <link rel="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
    <link rel="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" />
    <link rel="text/css" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css" />
    <link rel="text/css" href="https://cdn.datatables.net/select/1.2.6/css/select.dataTables.min.css" />
    <style>
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

        table.dataTable thead th {
            padding: 10px 6px !important;
        }
    </style>
</head>
<body>
    <div class="col-lg-12 col-md-12 col-sm-12 nopadding main-grid">
        <div class="panel panel-default">
            <div class="panel-heading"><label>Consulta de Cliente</label></div>
            <div class="panel-body panel-collapse collapse in" id="dlrecclon">
                <div class="grid nopadding">
                    <div class="col-lg-12 col-xs-12 col-md-12 nopadding">
                        <table class="datatable" cellspacing="0" cellpadding="0" border="0" id="gridviewSection" style="border-collapse: collapse;">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Fecha Actualización</th>
                                    <th>Usuario</th>
                                    <th>Producto</th>
                                    <th>Fecha Crédito</th>
                                    <th>Fecha Cierre</th>
                                    <th>Saldo Actual</th>
                                    <th>Saldo Vencido</th>
                                    <th>MOP</th>
                                    <th>Histórico de Pagos</th>
                                    <th>Clave Observación</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="even">
                                    <td>
                                        <label>26/10/2016 13:09:24</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>IVAN HERNANDEZ</label></td>
                                    <td>
                                        <label>1259649805</label>
                                    </td>
                                    <td>
                                        <label>65</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>26/10/2016 13:09:24</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>IVAN HERNANDEZ</label></td>
                                    <td>
                                        <label>1259649805</label>
                                    </td>
                                    <td>
                                        <label>65</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                </tr>
                                <tr class="even">
                                    <td>
                                        <label>26/10/2016 13:09:24</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>IVAN HERNANDEZ</label></td>
                                    <td>
                                        <label>1259649805</label>
                                    </td>
                                    <td>
                                        <label>65</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                    <td>
                                        <label>HEME951213</label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


</body>
</html>
