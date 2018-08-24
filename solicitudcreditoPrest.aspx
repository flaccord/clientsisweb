<%@ Page Language="VB" AutoEventWireup="false" CodeFile="solicitudcreditoPrest.aspx.vb" Inherits="solicitudcreditoPrest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<title>Solicitud de Credito</title>
<head>
    <link rel="stylesheet" href="disenio1/c16e9a3d.css">
    <link rel="stylesheet" href="disenio1/style.css">
    <link rel="stylesheet" href="disenio1/slider.css">
    <script src="disenio1/Scripts/jquery-3.3.1.js"></script>
    <style class="firebugResetStyles" type="text/css" charset="utf-8">
        .mini {
            color: #fff;
            font: bold ultra-condensed 12px/18px Raleway,sans-serif;
            padding-left: 2px;
            padding-right: 2px;
        }

        .tituloblanco {
            font-family: Raleway, sans-serif;
            font-size: 12px;
            font-weight: regular;
            color: #FFF;
        }

        #page-wrapper {
            margin: 0px;
        }

        .tipoConsulta span {
            margin-right: 10px;
        }
            .tipoConsulta span > input {
                margin-right: 5px;
            }
    </style>
    <link href="disenio1/newdesign/bootstrap.min.css" rel="stylesheet" />
    <link href="disenio1/newdesign/sb-admin-2.css" rel="stylesheet" />
    <script src="disenio1/Scripts/bootstrap.min.js" type="text/javascript"></script>
    <link href="disenio1/newdesign/bootstrap-theme.css" rel="stylesheet" />
    <link href="disenio1/newdesign/Site.css" rel="stylesheet" />
    <script src='https://www.google.com/recaptcha/api.js?hl=es'></script>
    <script language="javascript" type="text/javascript">
        var correctCaptcha = function (response) {
            if (response.length == 0) {
                document.getElementById('captcha').innerHTML = "No se puede dejar vacío el Código Captcha";
            }
            else {
                document.getElementById('captcha').innerHTML = "Verificación completada";
                document.getElementById('enviarform').style.display = "";
            }
        };

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

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

        function stringCheck(e, field) {

            key = e.keyCode ? e.keyCode : e.which

            //alert(key);
            //backspace
            if (key == 32) return true;

            //numeros 0-9
            if ((key >= 48 && key <= 57) || key == 42) return false;

            // Caracteres Raros
            if (key == 94 ||
                key == 59 ||
                key == 58 ||
                key == 61 ||
                key == 43 ||
                key == 45 ||
                key == 95 ||
                key == 47 ||
                key == 96 ||
                key == 40 ||
                key == 41 ||
                key == 91 ||
                key == 123 ||
                key == 92 ||
                key == 124 ||
                key == 125 ||
                key == 93 ||
                key == 39 ||
                key == 34 ||
                key == 44 ||
                key == 46 ||
                key == 47 ||
                key == 231 ||
                key == 42 ||
                key == 168 ||
                key == 33 ||
                key == 161 ||
                key == 183 ||
                key == 8364 ||
                key == 37 ||
                key == 191 ||
                key == 186 ||
                key == 170 ||
                key == 64 ||
                key == 35 ||
                key == 126 ||
                key == 36 ||
                key == 38 ||
                key == 180 ||
                key == 63) return false;

        }
    </script>
</head>
<body>
    <iframe id="menu" style="width: 100%; height: 1000px; vertical-align: middle; text-align: left;" src="menu.aspx?m=C02wMbiD" scrolling="no" frameborder="0" runat="server"></iframe>
    <div class="container registro1" style="position: absolute; top: 50px; padding: 0; width: 100%; opacity: 1; background-repeat: repeat-y">
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Solicitud de Informacion</h1>
                </div>
            </div>
            <div class="row">
                <form runat="server">
                    <div class="col-lg-12 col-md-12 col-sm-12" id="Solicitud_form">
                        <%--Datos Generales--%>
                        <div class="panel panel-default">
                            <div class="panel-heading"><a href="#datos_generales" data-toggle="collapse">Datos Generales</a></div>
                            <div class="panel-body panel-collapse collapse in" id="datos_generales">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld" for="primer_number">Primer Nombre *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="txtnombre" onkeypress="return stringCheck(event, this);" placeholder="Primer Nombre *" required="" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Segundo Nombre</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="nombre1" onkeypress="return stringCheck(event, this);" placeholder="Segundo Nombre" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Apellido Paterno *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="apellidos" onkeypress="return stringCheck(event, this);" placeholder="Apellido Paterno *" required="" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Apellido Materno</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="apellidos1" onkeypress="return stringCheck(event, this);" placeholder="Apellido Materno" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Sexo *</label>
                                        <asp:RadioButtonList runat="server" ID="sexo" placeholder="Sexo *" required="" CssClass="sexo-info" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True">Masculino</asp:ListItem>
                                            <asp:ListItem>Femenino</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-xs-12 form-group">
                                        <div>
                                            <label class="fntbld">Fecha de Nacimiento *</label>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-xs-3 inl-blk nopadding">
                                            <asp:DropDownList ID="Dia" placeholder="Dia *" required="" runat="server" CssClass="form-control inl-blk">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem>01</asp:ListItem>
                                                <asp:ListItem>02</asp:ListItem>
                                                <asp:ListItem>03</asp:ListItem>
                                                <asp:ListItem>04</asp:ListItem>
                                                <asp:ListItem>05</asp:ListItem>
                                                <asp:ListItem>06</asp:ListItem>
                                                <asp:ListItem>07</asp:ListItem>
                                                <asp:ListItem>08</asp:ListItem>
                                                <asp:ListItem>09</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                                <asp:ListItem>13</asp:ListItem>
                                                <asp:ListItem>14</asp:ListItem>
                                                <asp:ListItem>15</asp:ListItem>
                                                <asp:ListItem>16</asp:ListItem>
                                                <asp:ListItem>17</asp:ListItem>
                                                <asp:ListItem>18</asp:ListItem>
                                                <asp:ListItem>19</asp:ListItem>
                                                <asp:ListItem>20</asp:ListItem>
                                                <asp:ListItem>21</asp:ListItem>
                                                <asp:ListItem>22</asp:ListItem>
                                                <asp:ListItem>23</asp:ListItem>
                                                <asp:ListItem>24</asp:ListItem>
                                                <asp:ListItem>25</asp:ListItem>
                                                <asp:ListItem>26</asp:ListItem>
                                                <asp:ListItem>27</asp:ListItem>
                                                <asp:ListItem>28</asp:ListItem>
                                                <asp:ListItem>29</asp:ListItem>
                                                <asp:ListItem>30</asp:ListItem>
                                                <asp:ListItem>31</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-xs-6 inl-blk">
                                            <asp:DropDownList ID="Mes" placeholder="Mes *" required="" runat="server" CssClass="form-control inl-blk">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="01">Enero</asp:ListItem>
                                                <asp:ListItem Value="02">Febrero</asp:ListItem>
                                                <asp:ListItem Value="03">Marzo</asp:ListItem>
                                                <asp:ListItem Value="04">Abril</asp:ListItem>
                                                <asp:ListItem Value="05">Mayo</asp:ListItem>
                                                <asp:ListItem Value="06">Junio</asp:ListItem>
                                                <asp:ListItem Value="07">Julio</asp:ListItem>
                                                <asp:ListItem Value="08">Agosto</asp:ListItem>
                                                <asp:ListItem Value="09">Septiembre</asp:ListItem>
                                                <asp:ListItem Value="10">Octubre</asp:ListItem>
                                                <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                                <asp:ListItem Value="12">Diciembre</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-xs-3 inl-blk nopadding">
                                            <asp:DropDownList ID="Anio" placeholder="Año *" required="" runat="server" CssClass="form-control inl-blk">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">RFC *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="rfc" required="" MaxLength="13" runat="server" placeholder="PEJZ711556ABC"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Teléfono Fijo *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="telfijo" onkeypress="return isNumberKey(event)" runat="server" placeholder="54885456465"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Celular *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="telcelu" onkeypress="return isNumberKey(event)" runat="server" placeholder="54885456465"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Email *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="email" runat="server" placeholder="Juan@dominio.com"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--Empleo section--%>
                        <div class="panel panel-default">
                            <div class="panel-heading"><a href="#empleo" data-toggle="collapse">Empleo</a></div>
                            <div class="panel-body panel-collapse collapse in" id="empleo">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Tipo Empleo *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:DropDownList ID="tipoempleo" placeholder="Tipo Empleo *" required="" runat="server" CssClass="form-control inl-blk">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="Independiente Informal">Independiente Informal</asp:ListItem>
                                                <asp:ListItem Value="Independiente Formal">Independiente Formal</asp:ListItem>
                                                <asp:ListItem Value="Empleado">Empleado</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-xs-12 form-group">
                                        <div>
                                            <label class="fntbld">Fecha de Ingreso *</label>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-xs-3 inl-blk nopadding">
                                            <asp:DropDownList ID="Diaempleo" placeholder="Dia empleo *" runat="server" CssClass="form-control inl-blk">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem>01</asp:ListItem>
                                                <asp:ListItem>02</asp:ListItem>
                                                <asp:ListItem>03</asp:ListItem>
                                                <asp:ListItem>04</asp:ListItem>
                                                <asp:ListItem>05</asp:ListItem>
                                                <asp:ListItem>06</asp:ListItem>
                                                <asp:ListItem>07</asp:ListItem>
                                                <asp:ListItem>08</asp:ListItem>
                                                <asp:ListItem>09</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>11</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                                <asp:ListItem>13</asp:ListItem>
                                                <asp:ListItem>14</asp:ListItem>
                                                <asp:ListItem>15</asp:ListItem>
                                                <asp:ListItem>16</asp:ListItem>
                                                <asp:ListItem>17</asp:ListItem>
                                                <asp:ListItem>18</asp:ListItem>
                                                <asp:ListItem>19</asp:ListItem>
                                                <asp:ListItem>20</asp:ListItem>
                                                <asp:ListItem>21</asp:ListItem>
                                                <asp:ListItem>22</asp:ListItem>
                                                <asp:ListItem>23</asp:ListItem>
                                                <asp:ListItem>24</asp:ListItem>
                                                <asp:ListItem>25</asp:ListItem>
                                                <asp:ListItem>26</asp:ListItem>
                                                <asp:ListItem>27</asp:ListItem>
                                                <asp:ListItem>28</asp:ListItem>
                                                <asp:ListItem>29</asp:ListItem>
                                                <asp:ListItem>30</asp:ListItem>
                                                <asp:ListItem>31</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg-5 col-md-5 col-xs-5 inl-blk">
                                            <asp:DropDownList ID="Mesempleo" placeholder="Mes empleo *" required="" runat="server" CssClass="form-control inl-blk">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="01">Enero</asp:ListItem>
                                                <asp:ListItem Value="02">Febrero</asp:ListItem>
                                                <asp:ListItem Value="03">Marzo</asp:ListItem>
                                                <asp:ListItem Value="04">Abril</asp:ListItem>
                                                <asp:ListItem Value="05">Mayo</asp:ListItem>
                                                <asp:ListItem Value="06">Junio</asp:ListItem>
                                                <asp:ListItem Value="07">Julio</asp:ListItem>
                                                <asp:ListItem Value="08">Agosto</asp:ListItem>
                                                <asp:ListItem Value="09">Septiembre</asp:ListItem>
                                                <asp:ListItem Value="10">Octubre</asp:ListItem>
                                                <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                                <asp:ListItem Value="12">Diciembre</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-xs-3 inl-blk nopadding">
                                            <asp:DropDownList ID="Anioempleo" placeholder="Año empleo*" required="" runat="server" CssClass="form-control inl-blk">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Ingreso Mensual *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="ingmensual" placeholder="Ingreso Mensual *" onkeypress="return isNumberKey(event)" required="" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Gasto Mensual</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="gasmensual" placeholder="Gasto Mensual *" onkeypress="return isNumberKey(event)" required="" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--Direcclon--%>
                        <div class="panel panel-default">
                            <div class="panel-heading"><a href="#direccion" data-toggle="collapse">Dirección</a></div>
                            <div class="panel-body panel-collapse collapse in" id="direccion">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                        <label class="fntbld">Calle *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="calle" placeholder="Calle *" required="" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Código Postal *</label>
                                        <div class="input-group custom-search-form search-codigo">
                                            <asp:TextBox CssClass="form-control" ID="codpostal" onkeypress="return isNumberKey(event)" required="" runat="server" placeholder="11000"></asp:TextBox>
                                            <asp:ImageButton ID="BuscarCP" runat="server" Style="margin-right: 0px; vertical-align: middle;" Width="35px" Height="35px" align="center" CausesValidation="False" ImageUrl="images\buscar.gif" ToolTip="Buscar" />
                                            <%--<span class="input-group-btn" ID="BuscarCP" runat="server">
                                                <button class="btn btn-default" type="button">
                                                    <i class="fa fa-search"></i>
                                                </button>
                                            </span>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Número Exterior</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="numexterior" runat="server" placeholder="151"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Número Interior</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="numinterior" runat="server" placeholder="4B"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Manzana</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="manzana" runat="server" placeholder="6"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Lote</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="lote" runat="server" placeholder="3"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Colonia *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:DropDownList ID="colonia" placeholder="Colonia *" runat="server" CssClass="form-control inl-blk">
                                                <asp:ListItem></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Municipio *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:DropDownList ID="municipio" placeholder="Municipio *" runat="server" CssClass="form-control inl-blk">
                                                <asp:ListItem></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Ciudad *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:DropDownList ID="ciudad" placeholder="Ciudad *" runat="server" CssClass="form-control inl-blk">
                                                <asp:ListItem></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Estado *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:DropDownList ID="estado" placeholder="Estado *" runat="server" CssClass="form-control inl-blk">
                                                <asp:ListItem></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Antigüedad en el Domicilio *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:DropDownList ID="Antdomicilio" placeholder="Ant domicilio *" runat="server" CssClass="form-control inl-blk">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="Menor que 2 Año">Menor que 2 Años</asp:ListItem>
                                                <asp:ListItem Value="Entre 2 y 4 Años">Entre 2 y 4 Años</asp:ListItem>
                                                <asp:ListItem Value="Mas de 4 Años">Mas de 4 Años</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Tipo de Vivienda *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:DropDownList ID="tipovivienda" placeholder="Tipo Vivienda *" runat="server" CssClass="form-control inl-blk">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem Value="Propia">Propia</asp:ListItem>
                                                <asp:ListItem Value="Rentada">Rentada</asp:ListItem>
                                                <asp:ListItem Value="Familiares">Familiares</asp:ListItem>
                                                <asp:ListItem Value="Hipoteca">Hipoteca</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--Opciones de consulta buro de credito--%>
                        <div class="panel panel-default">
                            <div class="panel-heading"><a href="#burode_credito" data-toggle="collapse">Opciones de consulta buro de credito</a></div>
                            <div class="panel-body panel-collapse collapse in" id="burode_credito">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Tipo De Consulta *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding tipoConsulta">
                                            <asp:RadioButton ID="tradicional" AutoPostBack="true" placeholder="Consulta Tradicional *" Text="Consulta Tradicional" GroupName="tipoConsulta" runat="server"></asp:RadioButton>
                                            <asp:RadioButton ID="autenticacion" AutoPostBack="true" placeholder="Consulta con Autenticación *" Text="Consulta con Autenticación" Checked="True" GroupName="tipoConsulta" runat="server"></asp:RadioButton>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-xs-12 form-group" id="TCredito" runat="server">
                                        <div>
                                            <label class="fntbld">¿Cuenta con Tarjeta de Credito? *</label>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding tipoConsulta">
                                            <asp:RadioButton ID="tcreditosi" placeholder="Si *" Text="Si" GroupName="cuentaTarjetaCredito" runat="server"></asp:RadioButton>
                                            <asp:RadioButton ID="tcreditono" placeholder="No *" Text="No" Checked="True" GroupName="cuentaTarjetaCredito" runat="server"></asp:RadioButton>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-xs-12 form-group" id="TPrestamos" runat="server">
                                        <div>
                                            <label class="fntbld">Últimos 4 Dígitos de la Trajeta *</label>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="ultimosCuatroDigitosTarjetaCredito" onkeypress="return isNumberKey(event)" MaxLength="4" placeholder="4 digitos" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">¿Ha Ejercido Un Credito Hipotecario? *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding tipoConsulta">
                                            <asp:RadioButton ID="hipotecariosi" placeholder="Si *" Text="Si" GroupName="creditoHipotecario" runat="server"></asp:RadioButton>
                                            <asp:RadioButton ID="hipotecariono" placeholder="No *" Text="No" Checked="True" GroupName="creditoHipotecario" runat="server"></asp:RadioButton>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                        <label class="fntbld">Ha Ejercido un Crédito Automotriz en los Últimos 24 Meses? *</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding tipoConsulta">
                                            <asp:RadioButton ID="automotrizsi" placeholder="Si *" Text="Si" GroupName="creditoAutomotriz" runat="server"></asp:RadioButton>
                                            <asp:RadioButton ID="automotrizmo" placeholder="No *" Text="No" Checked="True" GroupName="creditoAutomotriz" runat="server"></asp:RadioButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--Referencias Familiares--%>
                        <div class="panel panel-default">
                            <div class="panel-heading"><a href="#referencias_familiares" data-toggle="collapse">Referencias Familiares</a></div>
                            <div class="panel-body panel-collapse collapse in" id="referencias_familiares">
                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Nombre</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="nombreref1" placeholder="Nombre Familiar" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Relación</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="relacion1" runat="server" placeholder="Relacion Familiar"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Hora</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="hora1" runat="server" placeholder="Hora"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Celular</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="cel1" runat="server" placeholder="Celular"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Fijo</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="fijo1" runat="server" placeholder="Tel Fijo"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Nombre</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="nombreref2" runat="server" placeholder="Nombre Familiar"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Relación</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="relacion2" runat="server" placeholder="Relacion Familiar"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Hora</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="hora2" runat="server" placeholder="Hora"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Celular</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="cel2" runat="server" placeholder="Celular"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Fijo</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="fijo2" runat="server" placeholder="Tel Fijo"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--Referencias Non Familiares--%>
                        <div class="panel panel-default">
                            <div class="panel-heading"><a href="#referenciasnon_familiares" data-toggle="collapse">Referencias no Familiares</a></div>
                            <div class="panel-body panel-collapse collapse in" id="referenciasnon_familiares">
                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Nombre</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="nombreref3" runat="server" placeholder="Nombre no Familiar"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Relación</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="relacion3" runat="server" placeholder="Relación no Familiar"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Hora</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="hora3" runat="server" placeholder="Hora"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Celular</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="cel3" runat="server" placeholder="Celular"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Fijo</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="fijo3" runat="server" placeholder="Tel Fijo"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Nombre</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="nombreref4" runat="server" placeholder="Nombre Familiar"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Relación</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="relacion4" runat="server" placeholder="Relación no Familiar"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Hora</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="hora4" runat="server" placeholder="Hora"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Celular</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="cel4" runat="server" placeholder="Celular"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                        <label class="fntbld">Fijo</label>
                                        <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                            <asp:TextBox CssClass="form-control" ID="fijo4" runat="server" placeholder="Tel Fijo"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="align-center">
                            <div class="g-recaptcha" data-sitekey="6Lee5mYUAAAAAAEXFbrqvOAp2rJjWMKiTGbHMKtK" data-callback="correctCaptcha"></div>
                            <span id="captcha" style="color: while" />
                        </div>
                        <div class="align-center" id="enviarform" style="display: none;">
                            <div class="align-center">
                                <asp:Button ID="btninsertdatos" CssClass="btn btn-success" runat="server" Text="Enviar" />
                            </div>
                            <div>
                                <asp:Label ID="ErrorMsg" runat="server" Text="*CAMPOS OBLIGATORIOS" CssClass="ErrorMsj1" Style="color: #fba118"></asp:Label>
                                <asp:Label ID="puntosdato" runat="server" Text=""></asp:Label>
                                <asp:Label ID="semaforodato" runat="server" Text=""></asp:Label>
                                <asp:Label ID="errorburo" runat="server" Text=""></asp:Label>
                                <asp:Label ID="datosburo" runat="server" Text=""></asp:Label>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
