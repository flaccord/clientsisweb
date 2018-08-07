<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Nemesis.Website.SystemUser.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/Login.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/Site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 logo-image">
                <img src="../Content/Images/nemesis-logo.jpg" />
            </div>
            <div class="login-mainform form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 nopadding">
                <div class="title">
                    <span>Inicia Sesión</span>
                </div>
                <div class="login-section">
                    <div class="email-section mgb-10">
                        <input type="email" id="email" placeholder="Usuario" runat="server" class="form-control"/>
                        <label id="emailValidation" runat="server" class="field-validation-error"></label>
                    </div>
                    <div class="password-section mgb-10">
                        <input type="password" id="password" placeholder="Password" runat="server" class="form-control"/>
                        <label id="passwordValidation" runat="server" class="field-validation-error"></label>
                    </div>
                    <div class="submit">
                        <asp:Button runat="server" Text="Enviar" CssClass="btn btn-primary" OnClick="Login_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
