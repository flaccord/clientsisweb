<%@ Page Language="VB" AutoEventWireup="false" CodeFile="menu.aspx.vb" Inherits="menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Nemesis Application</title>

    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="disenio1/newdesign/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="disenio1/newdesign/bootstrap.min.css" rel="stylesheet" />
    <link href="disenio1/newdesign/Site.css" rel="stylesheet" />
    <%--data tables links--%>
    <link rel="text/css" href="https://editor.datatables.net/extensions/Editor/css/editor.dataTables.min.css" />
    <link rel="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
    <link rel="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css" />
    <link rel="text/css" href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css" />
    <link rel="text/css" href="https://cdn.datatables.net/select/1.2.6/css/select.dataTables.min.css" />

    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />
    <script src="disenio1/Scripts/jquery-3.3.1.min.js"></script>
    <script src="disenio1/Scripts/Chart.bundle.js"></script>
    <script src="disenio1/Scripts/Chart.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="disenio1/newdesign/sb-admin-2.css" rel="stylesheet" />
    <link href="disenio1/newdesign/sb-admin-2.min.css" rel="stylesheet" />

    <style type="text/css">

        span.input-group-btn button {
            padding: 9px;
        }

        ul#side-menu {
            border-right: 1px solid #e3e3e3;
        }

        .navbar-default{
            -webkit-box-shadow: unset !important;
            background-image: unset !important;
        }
            
    </style>
</head>
<body>
    <div id="wrapper">
        <!-- Navigation -->
        <form runat="server">
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="#">
                        <asp:Image ImageUrl="~/disenio1/newdesign/Images/logo.png" CssClass="images-section" runat="server" />
                    </a>
                </div>
                <!-- /.navbar-header -->
                <ul class="nav navbar-top-links navbar-right" id="top-header">
                    <li>
                        <asp:Label ID="lblBienvenida" runat="server" ></asp:Label>
                    </li>
                    <!-- /.dropdown -->
                    <!-- /.dropdown -->
                    <!-- /.dropdown -->
                    <li class="dropdown">
                        <asp:LinkButton ID="lbFinSession" runat="server" Text="Finalizar Sesión" />
                        <%--<a href="#">
                            <i class="fa fa-sign-out fa-fw"></i>Cerrar Sesión
                        </a>--%>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
                <!-- /.navbar-top-links -->
                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
                                <div class="input-group custom-search-form">
                                    <asp:TextBox CssClass="form-control" runat="server" placeholder="Buscar..."></asp:TextBox>
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                                <!-- /input-group -->
                            </li>
                            <li>
                                <asp:LinkButton ID="lbRegistro" runat="server" Text="<i class='fa fa-wpforms fa-fw'></i> Solicitud" />
                            </li>
                            <li>
                                <asp:LinkButton ID="lbUsuarios" runat="server" Text="Usuarios" Visible="False" />
                            </li>
                            <li>
                               <asp:LinkButton ID="lbConsultas" runat="server" Text="<i class='fa fa-wpforms fa-fw'></i> Consultas" />
                            </li>
                            <li>
                               <asp:LinkButton ID="lbReporteBC" runat="server" Text="<i class='fa fa-files-o fa-fw'></i> Reporte BC"/>
                            </li>
                        </ul>
                        <%--<ul class='MenuSubrayado' style="margin-left:580px">
                            <li>
                               <asp:Label ID="lblBienvenida" runat="server" ></asp:Label>
                            </li>
                        </ul>--%>
                        <%--<ul class='MenuSubrayado' style="margin-left:1050px">
                            <li>
                                <asp:LinkButton ID="lbFinSession" runat="server" Text="Finalizar Sesión" />
                            </li>
                        </ul>--%>

                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>
        </form>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- jQuery -->
    <script src="disenio1/Scripts/sb-admin-2.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="disenio1/Scripts/bootstrap.min.js"></script>
    <%--<script src="../Scripts/raphael.js"></script>--%>
    <script src="disenio1/Scripts/metisMenu.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

</body>
</html>
