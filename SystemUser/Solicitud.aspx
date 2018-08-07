<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Solicitud.aspx.cs" Inherits="Nemesis.Website.SystemUser.Dashboard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Solicitud de Informacion</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12" id="Solicitud_form">
                <%--Datos Generales--%>
                <div class="panel panel-default">
                    <div class="panel-heading"><a href="#datos_generales" data-toggle="collapse">Datos Generales</a></div>
                    <div class="panel-body panel-collapse collapse in" id="datos_generales">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label for="primer_number">Primer Nombre *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:TextBox CssClass="form-control" ID="primer_number" runat="server" placeholder="Juan"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Segundo Nombre</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:TextBox CssClass="form-control" ID="segundo_nombre" runat="server" placeholder="Ramon de Jesus"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Apellido Paterno *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:TextBox CssClass="form-control" ID="apellido_paterno" runat="server" placeholder="Perez"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Apellido Materno</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:TextBox CssClass="form-control" ID="apellido_materno" runat="server" placeholder="Lopez"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Sexo *</label>
                                <asp:RadioButtonList runat="server" ID="sexo_selection" CssClass="sexo-info" RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True">Masculino</asp:ListItem>
                                    <asp:ListItem>Femenino</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <div class="col-lg-6 col-md-6 col-xs-12 form-group">
                                <div>
                                    <label>Fecha de Nacimiento *</label>
                                </div>
                                <div class="col-lg-3 col-md-3 col-xs-3 inl-blk nopadding">
                                    <asp:DropDownList ID="birthDay" runat="server" CssClass="form-control inl-blk">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-6 col-md-6 col-xs-6 inl-blk">
                                    <asp:DropDownList ID="birthMonth" runat="server" CssClass="form-control inl-blk">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-3 col-md-3 col-xs-3 inl-blk nopadding">
                                    <asp:DropDownList ID="birthYear" runat="server" CssClass="form-control inl-blk">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>RFC *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:TextBox CssClass="form-control" ID="rfc_number" runat="server" placeholder="PEJZ711556ABC"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Teléfono Fijo *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:TextBox CssClass="form-control" ID="telefono_fijo" runat="server" placeholder="54885456465"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Celular *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:TextBox CssClass="form-control" ID="celular" runat="server" placeholder="54885456465"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Email *</label>
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
                                <label>Tipo Empleo *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:DropDownList ID="tipo_empleo" runat="server" CssClass="form-control inl-blk">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-xs-12 form-group">
                                <div>
                                    <label>Fecha de Ingreso *</label>
                                </div>
                                <div class="col-lg-3 col-md-3 col-xs-3 inl-blk nopadding">
                                    <asp:DropDownList ID="ingreso_day" runat="server" CssClass="form-control inl-blk">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-5 col-md-5 col-xs-5 inl-blk">
                                    <asp:DropDownList ID="ingreso_month" runat="server" CssClass="form-control inl-blk">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-3 col-md-3 col-xs-3 inl-blk nopadding">
                                    <asp:DropDownList ID="ingreso_year" runat="server" CssClass="form-control inl-blk">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Ingreso Mensual *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:TextBox CssClass="form-control" ID="ingreso_mensual" runat="server" placeholder="12300"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Gasto Mensual</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:TextBox CssClass="form-control" ID="gasto_mensual" runat="server" placeholder="8500"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%--Direcclon--%>
                <div class="panel panel-default">
                    <div class="panel-heading"><a href="#dlrecclon" data-toggle="collapse">Dirección</a></div>
                    <div class="panel-body panel-collapse collapse in" id="direccion">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                <label>Calle *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:TextBox CssClass="form-control" ID="calle" runat="server" placeholder="Av. del Iman"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Código Postal *</label>
                                <div class="input-group custom-search-form search-codigo">
                                    <asp:TextBox CssClass="form-control" ID="codigo_postal" runat="server" placeholder="11000"></asp:TextBox>
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Número Exterior</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:TextBox CssClass="form-control" ID="numero_exterior" runat="server" placeholder="151"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Número Interior</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:TextBox CssClass="form-control" ID="numero_interior" runat="server" placeholder="4B"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Manzana</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:TextBox CssClass="form-control" ID="manzana" runat="server" placeholder="6"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Lote</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:TextBox CssClass="form-control" ID="lote" runat="server" placeholder="3"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Colonia *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:DropDownList ID="Colonia" runat="server" CssClass="form-control inl-blk">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Municipio *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:DropDownList ID="municipio" runat="server" CssClass="form-control inl-blk">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Ciudad *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:DropDownList ID="Ciudada" runat="server" CssClass="form-control inl-blk">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Estado *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:DropDownList ID="Estado" runat="server" CssClass="form-control inl-blk">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Antigüedad en el Domicilio *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:DropDownList ID="antiguedad_domicilio" runat="server" CssClass="form-control inl-blk">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Tipo de Vivienda *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:DropDownList ID="tipo_vivienda" runat="server" CssClass="form-control inl-blk">
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
                                <label>Tipo De Consulta *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:RadioButtonList runat="server" ID="tipode_consulta" CssClass="sexo-info" RepeatDirection="Horizontal">
                                        <asp:ListItem>Consulta Tradicional</asp:ListItem>
                                        <asp:ListItem Selected="True">Consulta con Autenticacion</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-xs-12 form-group">
                                <div>
                                    <label>¿Cuenta con Tarjeta de Credito? *</label>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:RadioButtonList runat="server" ID="tarjetade_credito" CssClass="sexo-info" RepeatDirection="Horizontal">
                                        <asp:ListItem>Sí</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-xs-12 form-group">
                                <div>
                                    <label>Últimos 4 Dígitos de la Trajeta *</label>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:TextBox CssClass="form-control" ID="Digitosdela_trajeta" runat="server" placeholder="4567"></asp:TextBox>                                    
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>¿Ha Ejercido Un Credito Hipotecario? *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:RadioButtonList runat="server" ID="credito_hipotecario" CssClass="sexo-info" RepeatDirection="Horizontal">
                                        <asp:ListItem>Sí</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                <label>Ha Ejercido un Crédito Automotriz en los Últimos 24 Meses? *</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                    <asp:RadioButtonList runat="server" ID="credito_automotriz" CssClass="sexo-info" RepeatDirection="Horizontal">
                                        <asp:ListItem>Sí</asp:ListItem>
                                        <asp:ListItem Selected="True">No</asp:ListItem>
                                    </asp:RadioButtonList>
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
                                <label>Nombre</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="nombre_familiar_1" runat="server" placeholder="Nombre Familiar"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Relacion</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="relacion_familiar_1" runat="server" placeholder="Relacion Familiar"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Hora</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="hora_familiar_1" runat="server" placeholder="Hora"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Celular</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="cel_familiar_1" runat="server" placeholder="Celular"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Fijo</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="fijo_familiar_1" runat="server" placeholder="Tel Fijo"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Nombre</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="nombre_familiar_2" runat="server" placeholder="Nombre Familiar"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Relacion</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="relacion_familiar_2" runat="server" placeholder="Relacion Familiar"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Hora</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="hora_familiar_2" runat="server" placeholder="Hora"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Celular</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="cel_familiar_2" runat="server" placeholder="Celular"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Fijo</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="Fijo_familiar_2" runat="server" placeholder="Tel Fijo"></asp:TextBox>
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
                                <label>Nombre</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="nombre_nonfamiliar_1" runat="server" placeholder="Nombre no Familiar"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Relación</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="relacion_nonfamiliar_1" runat="server" placeholder="Relación no Familiar"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Hora</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="hora_nonfamiliar_1" runat="server" placeholder="Hora"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Celular</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="cel_nonfamiliar_1" runat="server" placeholder="Celular"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Fijo</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="fijo_nonfamiliar_1" runat="server" placeholder="Tel Fijo"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Nombre</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="nombre_nonfamiliar_2" runat="server" placeholder="Nombre Familiar"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Relación</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="relacion_nonfamiliar_2" runat="server" placeholder="Relación no Familiar"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Hora</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="hora_nonfamiliar_2" runat="server" placeholder="Hora"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Celular</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="cel_nonfamiliar_2" runat="server" placeholder="Celular"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                <label>Fijo</label>
                                <div class="col-lg-12 col-md-12 col-sm-12 nopadding">
                                     <asp:TextBox CssClass="form-control" ID="fijo_nonfamiliar_2" runat="server" placeholder="Tel Fijo"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="align-center">
                    <div class="g-recaptcha" data-sitekey="6Lee5mYUAAAAAAEXFbrqvOAp2rJjWMKiTGbHMKtK"></div>
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>
