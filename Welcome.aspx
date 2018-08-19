<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Welcome.aspx.vb" Inherits="Welcome" %>

<%--<%@ Register Assembly="obout_Window_NET" Namespace="OboutInc.Window" TagPrefix="owd" %>
<%@ Register TagPrefix="spl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>CrediSys Integra by Cronos Consulting - Principal -</title>
   
    <style type="text/css">
        body
        {
            font-family:Arial;
        }
        .text
        {
            font-size:11px;
            text-align:center;
        }
        .textContent
        {
            font-size:11px;
            text-align:center;           
        }
        .textlF
        {
	        font-size:14px;
	        text-align:center;	
	        color:White;
	        font-weight:bold;
	        font-family:Arial;
        }
        .textHead
        {
            font-family:Arial;
	        font-size:14pt;
	        text-align:left;
	        color:White;
	        font-weight:bold;	        
        }
        .textHead2
        {
            font-family:Arial;
	        font-size:16pt;
	        text-align:left;
	        color:#99CC00;
	        font-weight:bold;
	        font-family:Arial;
        }
        .textMsj
        {
            font-size: 8pt;
            text-align: center;
            color: #1A4274;
            font-family: Arial;
            font-weight: bold;            
        }
    </style>
</head>
<body onbeforeunload="closeIt()">
    <%--<form id="form1" runat="server">
    <owd:Window ID="myWindow" runat="server" IsModal="true" ShowCloseButton="true" Status="Hello" Left="200" Top="100" Height="240"  Width="320" VisibleOnLoad="false" StyleFolder="Styles/Ventana" Title="Obout Window">
    </owd:Window>
    <spl:Splitter CookieDays="0" id="sp1" runat="server" StyleFolder="Styles/Divisor" CollapsePanel="left" LiveResize="true" RememberScrollPosition="true">
        <LeftPanel ID="LeftPanel1" WidthMin="260" WidthMax="260" WidthDefault="260" runat="server">
		<Header Height="100">
			<div style="width:100%;height:100%;text-align:center;" class="textHead" >
			<br />
			    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
			</div>
		</Header>
		<Content Url="Menu.aspx">
			
		</Content>
		<Footer Height="40">
			<div style="width:100%;height:100%; vertical-align:middle; text-align:left;" class="textlF">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<a href="Javascript:cerrarS();" class="textlF">Cerrar Sesión</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Javascript:salir();" class="textlF">Salir</a>
				
			</div>
		</Footer>
	</LeftPanel>
	<RightPanel>
	<Header Height="34">
	        <div style="width:100%;height:100%;text-align:left;" class="textMsj">
	        <br />
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="" Height="20" ></asp:Label></div>
	    </Header>
		<Content>
			<div style="width:100%;height:100%;" class="textContent">
				<br />
				<br />
				<br />
				<img src="Images/Logo.png" alt="FINMART" width="391px" height="260px"/>
			</div>
		</Content>	
		<Footer ID="Footer1" Height="47" Url="Msj.aspx" runat="server">
		</Footer>	
	</RightPanel>
</spl:Splitter>
    
    </form>--%>
</body>
</html>

<script type="text/javascript">
var windownumber = 0;
var url = "";
var alto = 200;
var ancho = 300;
var cerrada = false;
function salir()
    {    
    Flag1 = true;
    url = "MensajeSalida.aspx?Ventana=" + windownumber + "&IDVar=" + IDVar + "&IDUsu=" + IDUsu + "&NUsu=" + NUsu;
    alto = 175;
    ancho = 300;    
    muestramsj();
    setTimeout("Flag1 = false;", 5000);
    }
 function cerrarS()
    {    
    
    //cerrada = true;
    
    //window.parent.location.href='CierraSesionManual.aspx?IDVar=' + IDVar + '&IDUsu=' + IDUsu + '&NUsu=' + NUsu;    
    }
    
function finsession()
    {
    url = "MensajeFinSesion.aspx?Ventana=" + windownumber + "&IDVar=" + IDVar + "&IDUsu=" + IDUsu + "&NUsu=" + NUsu;
    alto = 215;
    ancho = 300;    
    muestramsj();
    }
function msjerror(msj)
    {
    url = "MensajeError.aspx?Msj=" + msj;
    alto = 270;
    ancho = 400;    
    muestramsj();
    }

function msjavanceA()
    {
    url = "PantallaAvanceArchivo.aspx";
    alto = 140;
    ancho = 430;    
    muestraavance();
    }
function msjavanceP()
    {
    url = "PantallaAvanceProceso.aspx";
    alto = 140;
    ancho = 430;    
    muestraavance();
    }
function msjavance()
    {
    url = "PantallaAvanceImagen.aspx";
    alto = 140;
    ancho = 430;    
    muestraavance();
    }
function msjaviso(msj)
    {
    url = "MensajeWarm.aspx?Msj=" + msj;
    alto = 270;
    ancho = 400;    
    muestramsj();
    }    
function msjinfo(msj)
    {
    url = "MensajeInfo.aspx?Msj=" + msj;
    alto = 270;
    ancho = 400;    
    muestramsj();
}
//RQ805 HN
function msjConfirma(msj) {
    url = "MensajeConfirma.aspx?Msj=" + msj;
    alto = 270;
    ancho = 400;
    return muestraConfirma();
}
//
function msjguardar()
    {
    url = "PantallaAltas.aspx";
    alto = 270;
    ancho = 400;    
    muestramsj();
    }
function msjvaltel() 
    {
    url = "MsjEnviaValTel.aspx";
    alto = 270;
    ancho = 400;
    muestramsj();
    }      
 function msjguardarPoliza()
    {
    url = "PantallaAltasPoliza.aspx";
    alto = 270;
    ancho = 400;    
    muestramsj();
    } 
 function msjbuscacomplejo()
    {
    url = "PantallaBuscaComplejo.aspx";
    alto = 470;
    ancho = 500;    
    muestrabsc();
    }
 function msjbuscacuentac()
    {
    url = "PantallaBuscaCuentaC.aspx";
    alto = 530;
    ancho = 550;    
    muestrabscuenta();
    }
function msjresbpoliza()
    {
    url = "PantallaResBPoliza.aspx";
    alto = 530;
    ancho = 650;    
    muestrarbp();
    }
function msjborrar()
    {
    url = "PantallaBajas.aspx";
    alto = 270;
    ancho = 400;    
    muestramsj();
    } 
function pantallaCal(Conv)
    {
    url = "../Conv/ConvCalendarioDesc.aspx?Conv=" + Conv;
    alto =600;
    ancho = 770;    
    muestrapantalla();
    }
function pantallaCalProd(Conv,Prod)
    {
    url = "../Conv/ProdCalendarioDesc.aspx?Conv=" + Conv + "&Prod=" + Prod;
    alto =600;
    ancho = 770;    
    muestrapantalla();
    }
function msjPlazosSegs(Clave,Conv,Prod)
    {
    url = "./Prod/ProdPlazosSegmentos.aspx?Clave=" + Clave + "&Conv=" + Conv + "&Prod=" + Prod;
    alto = 605;
    //RQ560 AAAV
    ancho = 800;  
    muestraPS();
    }
function msjagregadocs(Clave,Conv)
    {
    url = "../Conv/ConvAgregarDocumentos.aspx?Clave=" + Clave + "&Conv=" + Conv;
    alto = 300;
    ancho = 560;    
    muestraadocs();
    }
function msjagregamanual(Conv)
    {
    url = "../Conv/ConvAgregaManual.aspx?Conv=" + Conv;
    alto = 300;
    ancho = 560;    
    muestraaman();
    }
function msjgeneralP(PURL,PAlto,PAncho,PTitulo,PNombre) {
    url = PURL;
    alto = PAlto;
    ancho = PAncho;
    muestrageneralP(PTitulo,PNombre);
}
//muestraBCon
function muestrageneralP(PTitulo1,PNombre1) {
    var oWin = oWindowManager.newWindow(PNombre1 + windownumber, url, false, false, false, false, false, true);
    //BUENO false,false,false,false,false,true
    window.Aviso0 = oWin;
    oWin.setSize(ancho, alto);
    oWin.setTitle(PTitulo1);
    oWin.Open();
    oWin.setStatus('');
    oWin.setPosition(10, 10);
    oWin.bringToFront();
    windownumber++;
}
function muestraPS()
    {
    var oWin = oWindowManager.newWindow("AgregaSegmento" + windownumber,url,false,false,false,false,false,true); 
    //MALO true,false,false,false,false,false
    window.Aviso0 = oWin;
    oWin.setSize(ancho,alto);
    oWin.setTitle("Agrega Segmento");
    oWin.Open();
    oWin.setStatus('');
    oWin.setPosition(0,0);
    oWin.bringToFront();       
    windownumber++;
    }
function muestrapantalla()
    {
    var oWin = oWindowManager.newWindow("Calendario" + windownumber,url,false,false,false,false,false,true); 
    //BUENO false,false,false,false,false,true
    window.Aviso0 = oWin;
    oWin.setSize(ancho,alto);
    oWin.setTitle("Calendario");
    oWin.Open();
    oWin.setStatus('');
    oWin.setPosition(20,20);
    oWin.bringToFront();       
    windownumber++;
    }
function muestramsj()
    {
    var oWin = oWindowManager.newWindow("Aviso" + windownumber,url,false,false,false,false,false,true); 
    //BUENO false,false,false,false,false,true
    window.Aviso0 = oWin;
    oWin.setSize(ancho,alto);
    oWin.setTitle("Aviso");
    oWin.Open();
    oWin.setStatus('');
    oWin.setPosition(400,250);
    oWin.bringToFront();       
    windownumber++;
}
// RQ805 HN
function muestraConfirma() {
    var oWin = oWindowManager.newWindow("Confirmacion" + windownumber, url, false, false, false, false, false, true);
    window.Aviso0 = oWin;
    oWin.setSize(ancho, alto);
    oWin.setTitle("Confirmacion");
    oWin.Open();
    oWin.setStatus('');
    oWin.setPosition(400, 250);
    oWin.bringToFront();
    windownumber++;
}
//
function muestrarbp()
    {
    var oWin = oWindowManager.newWindow("BuscarPoliza" + windownumber,url,false,false,false,false,false,true); 
    //MALO true,false,false,false,false,false
    window.Aviso0 = oWin;
    oWin.setSize(ancho,alto);
    oWin.setTitle("Resultados Pólizas");
    oWin.Open();
    oWin.setStatus('');
    oWin.setPosition(200,100);
    oWin.bringToFront();       
    windownumber++;
    }
function muestrabscuenta()
    {
    var oWin = oWindowManager.newWindow("BuscarCuenta" + windownumber,url,false,false,false,false,false,true); 
    window.Aviso0 = oWin;
    oWin.setSize(ancho,alto);
    oWin.setTitle("Buscar Cuenta Contable");
    oWin.Open();
    oWin.setStatus('');
    oWin.setPosition(200,120);
    oWin.bringToFront();       
    windownumber++;
    }
function muestrabsc()
    {
    var oWin = oWindowManager.newWindow("Buscar" + windownumber,url,false,false,false,false,true,false); 
    window.Aviso0 = oWin;
    oWin.setSize(ancho,alto);
    oWin.setTitle("Buscar");
    oWin.setStatus('');
    oWin.Open();
    oWin.setPosition(50,50);
    oWin.bringToFront();       
    windownumber++;
    }
function muestraavance()
    {
    var oWin = oWindowManager.newWindow("Avance" + windownumber,url,false,false,false,false,false,true); 
    //oWindowManager.newWindow(txtWinID,[txtUrl],[bIsModal],[bClose],); 
    //oWindowManager.newWindow(txtWinID,[txtUrl],[bClose],[bMaximize],[bStatusBar],[bResizable],[bDraggable],[bIsModal]); 
    window.Aviso123 = oWin;
    oWin.setSize(ancho,alto);
    oWin.setTitle("Avance");
    oWin.setStatus('');
    oWin.Open();    
    oWin.setPosition(400,250);
    oWin.bringToFront();    
    windownumber++;
    }
function muestraaman()
    {
    var oWin = oWindowManager.newWindow("Agregar Manual" + windownumber,url,false,false,false,false,true,false); 
    window.Aviso0 = oWin;
    oWin.setSize(ancho,alto);
    oWin.setTitle("Agregar Manual");
    oWin.setStatus('');
    oWin.Open();
    oWin.setPosition(50,50);
    oWin.bringToFront();       
    windownumber++;
    }
function muestraadocs()
    {
    var oWin = oWindowManager.newWindow("Agregar Documentos" + windownumber,url,false,false,false,false,true,false); 
    window.Aviso0 = oWin;
    oWin.setSize(ancho,alto);
    oWin.setTitle("Agregar Documentos");
    oWin.setStatus('');
    oWin.Open();
    oWin.setPosition(50,50);
    oWin.bringToFront();       
    windownumber++;
    }
function CierraPan()
    {
    if (Flag1 == false) 
        {
        //window.location.href='CierraSession.aspx?IDVar=' + IDVar + '&IDUsu=' + IDUsu + '&NUsu=' + NUsu;
        var objWindow = window.open("", "_self");
        objWindow.close();
        alert('Esta abandonando el Sistema!.');
        }
    }


//var objWindow = window.opener.open('', '_self');
//objWindow.close();
 
</script>

 <script type="text/javascript">
function closeIt()
  {  
  //if (cerrada == false)
  //{
  //confirm("abc")
  window.parent.open('CierraSesionManual.aspx?IDVar=' + IDVar + '&IDUsu=' + IDUsu + '&NUsu=' + NUsu + '&RUsu=' + RUsu + '&RTip=' + RTip,'Otro','left=20,top=20,width=1,height=1,toolbar=0,location=0,status=0,menubar=0,directories=0,scrollbars=0,resizable=0');
  window.parent.location.href='Default.aspx';
  //window.location.href='CierraSession.aspx?IDVar=' + IDVar + '&IDUsu=' + IDUsu + '&NUsu=' + NUsu;
  //window.parent.location.href='CierraSesionManual.aspx?IDVar=' + IDVar + '&IDUsu=' + IDUsu + '&NUsu=' + NUsu;    
  //}
   //var objWindow = window.opener.open('', '_self');
  //objWindow.close();
   //window.open('CierraSession.aspx?IDVar=' + IDVar + '&IDUsu=' + IDUsu + '&NUsu=' + NUsu, 'CerrarSession','left=20,top=20,width=1,height=1,toolbar=0,location=0,status=0,menubar=0,directories=0,scrollbars=0,resizable=0');
  }
</script>

