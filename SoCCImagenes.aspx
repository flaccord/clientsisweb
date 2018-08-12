<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SoCCImagenes.aspx.vb" Inherits="So_SoCCImagenes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Sistema de Gestión de Peticiones - Agrega Imagenes Solicitudes -</title>
<style type="text/css">
#progressBar {position:absolute; 
              width:400px; 
              height:35px; 
              visibility:hidden;
              background-color:#ffffff; 
              padding:20px;
              border-width:0px;
              border-left-color:#9999ff; 
              border-top-color:#9999ff;
              border-right-color:#666666; 
              border-bottom-color:#666666; 
              border-style:solid;
             }
#progressBarMsg {position:absolute;
                 left:10px; 
                 top:10px; 
                 font:12px Verdana, Helvetica, sans-serif bold
                }
#sliderWrapper {position:absolute; 
                left:10px; 
                top:40px; 
                width:417px; 
                height:15px;
                background-color:#ffffff; 
                border:1px solid #000000; 
                text-align:center;
                font-size:12px
               }
#slider{position:absolute; 
        left:0px; 
        top:0px; 
        width:420px; 
        height:15px;
        clip:rect(0px 0px 15px 0px);
        background-color:#666699; 
        text-align:center; 
        color:#ffffff; 
        font-size:12px
       }
</style>

<SCRIPT type="text/javascript">

  
function disableContextMenu2() {
    document.oncontextmenu = function() {
       return false;
    }
}


</SCRIPT>

<script language="JavaScript" type="text/javascript">
// Estacion de Digitalizacion
ADoc = -1;
IDoc = 0;
ARuta="";
tDoc1="";
tLado="";
function StartScan()
    {
    window.resizeTo(1024,768);
    VSTwain1.StartDevice();
    VSTwain1.Register("PRESTACIONES FINMART SAPI DE CV SOFOM ENR","50.57.200.160","CA8C82DA13CEC0DFF98E396112B4C64648EAF79727E57332FEF03C865EC3EB7C3595A94C98DAF9775A547D0A26FBAECB0CA8738A58AF282D8C05C833244DF98787DB076D3948D9DCF1D3DCE16A53F1250A543BD4A6B580E7192EF9FC20CBA4BF7C6EE860CBEBEFF11F9C99606DB6A30BB7D5E065159AEA6CA525EF73722C588BD43C35E1C67088731A4A623BD8C01F9B176FA36E280AB024983809E4F9AC2565");
	VSTwain1.maxImages=20;	
	VSTwain1.autoCleanBuffer=1;
	VSTwain1.disableAfterAcquire=1;
	if (VSTwain1.SelectSource() == 1)
	    {
	    signodigital();
	    if (ADoc > -1) 
	        {	    
  	        setTimeout("StartScan1()", 1000);
  	        }
  	    else
  	        {
  	        alert("Todos los documentos se encuentran digitalizados.");
  	        }
	    }
    }
function StartScan1()
{	
      if (ODocs[ADoc] == true)
        {        
        if (NDocs[ADoc] == "Opcional")
            {
            tDoc1 = " opcional.";
            }
        else
            {
            tDoc1 = " " + NDocs[ADoc] + " es opcional.";
            }
        if (confirm("Desea escanear el documento" + tDoc1))
            {
            if (NDocs[ADoc] == "Opcional")
                {
                NDocs[ADoc] = (prompt("Nombre del Documento."))
                }
            if (LDocs[ADoc] = "frente")
                {
                tLado = ".";
                }
            else
                {
                tLado = " de " + LDocs[ADoc] + ".";
                }   
            if (confirm("Inserte el documento " + NDocs[ADoc] + tLado))
                {
                PDocs[ADoc]=true;
                window.resizeTo(1024,768);
  	            VSTwain1.ShowUI=VshowUI;
	            VSTwain1.OpenDataSource();
	            VSTwain1.pageSize=3;
	            VSTwain1.unitOfMeasure=0;
	            VSTwain1.pixelType=VpixelType;
	            VSTwain1.resolution=Vresolution;
	            VSTwain1.jpegQuality=VjpegQuality;
	            VSTwain1.Acquire();
	            calcProgress(0, 1);
	            setTimeout("UploadToFtpServer()", 2000);	  
	            }
	        else
	            {
	            calcProgress(0,1);
	            VSTwain1.CloseDataSource();
	            }
            }
        else
            {
            PDocs[ADoc]=true;
            if (NDocs[ADoc] == "Opcional")
            {
            for(i=ADoc;i<=Docs;i++)
                {
                PDocs[i]=true;
                }
            }      
            ADoc = -1
	        signodigital();
	        if (ADoc > -1) 
	            {	    
  	            setTimeout("StartScan1()", 1000);
  	            }        
            }        
        }
      else
        {
        if (LDocs[ADoc] = "frente")
                {
                tLado = ".";
                }
            else
                {
                tLado = " de " + LDocs[ADoc] + ".";
                }           
        if (confirm("Inserte el documento " + NDocs[ADoc] + tLado))
            {
            window.resizeTo(1024,768);
  	        VSTwain1.ShowUI=VshowUI;
	        VSTwain1.OpenDataSource();
	        VSTwain1.unitOfMeasure=0;
	        VSTwain1.pixelType=VpixelType;
	        VSTwain1.resolution=Vresolution;
	        VSTwain1.jpegQuality=VjpegQuality;
	        VSTwain1.Acquire();
	        calcProgress(0, 1);
	        setTimeout("UploadToFtpServer()", 2000);	  
	        }
	    else
	        {
	        calcProgress(0,1);
	        VSTwain1.CloseDataSource();
	        }
        }     
}

function signodigital()
    {
    var i = 0
    for(i=0;i<=Docs;i++)
        {
        if (DDocs[i] == "No" && PDocs[i] == false)
            {
            ADoc = i;
            return;
            }
        }    
    }

function UploadStatus()
{
	var statString = VSTwain1.ftpStateString
	if (VSTwain1.ftpState == 10)
	    {
	  statString = statString + " Uploaded " + String(VSTwain1.ftpBytesUploaded) + " bytes from " + String(VSTwain1.ftpBytesTotal) + " bytes."
	  calcProgress(VSTwain1.ftpBytesUploaded, VSTwain1.ftpBytesTotal);        
	  }
	window.status = statString
	if ((VSTwain1.ftpState == 13) || (VSTwain1.ftpErrorCode != 0))
	{
	  if (VSTwain1.ftpErrorCode == 0) 
	  {
	      
	      window.resizeTo(1024,768);
	      ARuta = "http://50.57.200.160/ArchivoDigital/Imgs/" + IDVar + "img" + KDocs[ADoc] + LDocs[ADoc] + ".jpg";
	      document.Img1a.src = ARuta
	      hideProgressBar();
	      setTimeout("continua()",2000);
	      	      
	   }
	  else alert(VSTwain1.ftpErrorString)
	  }
	else
	  setTimeout("UploadStatus()",10)
}

function continua()
    {
    if (confirm("¿Es Correcto el documento " + NDocs[ADoc] + " de " + LDocs[ADoc] + "?")) 
	        {
	        PDocs[ADoc]=true;
	        DDocs[ADoc] = "Si";
	        UpdateIframe_Alta();
	        ADoc++;
	        IDoc++;
	        }
	else
	    {
	    document.Img1a.src = "http://50.57.200.160/Crediamigo/images/Blank.jpg";
	    VSTwain1.DeleteImage(IDoc);	    
	    }
	      if (ADoc <= Docs)
	        {
	        ADoc = -1
	        signodigital();
	        if (ADoc > -1) 
	            {	    
  	            setTimeout("StartScan1()", 1000);
  	            }        
	        }
	      calcProgress(0, 1);
	      window.resizeTo(1024,768);	
	      VSTwain1.CloseDataSource();      
    }

function UpdateIframe_Alta()
{
    document.getElementById("frame1234").src="SoCImagenes.aspx?IdVar=" + IDVar + "&IdTipo=" + IDTipo + "&IdAccion=1&IDoc=" + KDocs[ADoc] + "&Lado=" + LDocs[ADoc] + "&Ruta=" + ARuta + "&Nom=" + NDocs[ADoc];
    window.resizeTo(1024,768);
}


function UploadToFtpServer()
{
	var ftpServer = "76.74.253.23";
	var ftpUser = "ftpuser123";
	var ftpPassw = "ftp123$%&";
	showProgressBar();    
	VSTwain1.SetFtpServerParams(ftpServer,21,ftpUser,ftpPassw,"");
	if (VSTwain1.errorCode != 0)
	{
	
	  alert(VSTwain1.errorString);
	}
	else
	{
	  VSTwain1.SetFtpServerAdvParams(1,20);
	  var ftpPath = "/Imgs/" + IDVar + "img" + KDocs[ADoc] + LDocs[ADoc] + ".jpg";	  
	  if (VSTwain1.SaveImageToFtp(IDoc,ftpPath) == 0)
	  {	      
	      alert(VSTwain1.errorString);
	  }
	  else setTimeout("UploadStatus()",10)
	}
}
function CancelUploadToFtpServer()
{
 	VSTwain1.ftpCancel = 1
	
}

function OnPageUnload()
{
	VSTwain1.StopDevice()
}
function Img1a_onclick()
        {
        var randomnumber=Math.floor(Math.random()*101)
        window.open(document.Img1a.src,'Img' + randomnumber);        
        }


var isCSS, isW3C, isIE4, isNN4, isIE6CSS;
function initDHTMLAPI() {
    if (document.images) {
        isCSS = (document.body && document.body.style) ? true : false;
        isW3C = (isCSS && document.getElementById) ? true : false;
        isIE4 = (isCSS && document.all) ? true : false;
        isNN4 = (document.layers) ? true : false;
        isIE6CSS = (document.compatMode && document.compatMode.indexOf("CSS1") >= 0) ? true : false;
    }
}

window.onload = initDHTMLAPI;

function seekLayer(doc, name) {
    var theObj;
    for (var i = 0; i < doc.layers.length; i++) {
        if (doc.layers[i].name == name) {
            theObj = doc.layers[i];
            break;
        }
        if (doc.layers[i].document.layers.length > 0) {
            theObj = seekLayer(document.layers[i].document, name);
        }
    }
    return theObj;
}

function getRawObject(obj) {
    var theObj;
    if (typeof obj == "string") {
        if (isW3C) {
            theObj = document.getElementById(obj);
        } else if (isIE4) {
            theObj = document.all(obj);
        } else if (isNN4) {
            theObj = seekLayer(document, obj);
        }
    } else {
        theObj = obj;
    }
    return theObj;
}

function getObject(obj) {
    var theObj = getRawObject(obj);
    if (theObj && isCSS) {
        theObj = theObj.style;
    }
    return theObj;
}

function shiftTo(obj, x, y) {
    var theObj = getObject(obj);
    if (theObj) {
        if (isCSS) {            
            var units = (typeof theObj.left == "string") ? "px" : 0 
            theObj.left = x + units;
            theObj.top = y + units;
        } else if (isNN4) {
            theObj.moveTo(x,y)
        }
    }
}

function shiftBy(obj, deltaX, deltaY) {
    var theObj = getObject(obj);
    if (theObj) {
        if (isCSS) {
            var units = (typeof theObj.left == "string") ? "px" : 0 
            theObj.left = getObjectLeft(obj) + deltaX + units;
            theObj.top = getObjectTop(obj) + deltaY + units;
        } else if (isNN4) {
            theObj.moveBy(deltaX, deltaY);
        }
    }
}

function setZIndex(obj, zOrder) {
    var theObj = getObject(obj);
    if (theObj) {
        theObj.zIndex = zOrder;
    }
}

function setBGColor(obj, color) {
    var theObj = getObject(obj);
    if (theObj) {
        if (isNN4) {
            theObj.bgColor = color;
        } else if (isCSS) {
            theObj.backgroundColor = color;
        }
    }
}

function show(obj) {
    var theObj = getObject(obj);
    if (theObj) {
        theObj.visibility = "visible";
    }
}

function hide(obj) {
    var theObj = getObject(obj);
    if (theObj) {
        theObj.visibility = "hidden";
    }
}

function getObjectLeft(obj)  {
    var elem = getRawObject(obj);
    var result = 0;
    if (document.defaultView) {
        var style = document.defaultView;
        var cssDecl = style.getComputedStyle(elem, "");
        result = cssDecl.getPropertyValue("left");
    } else if (elem.currentStyle) {
        result = elem.currentStyle.left;
    } else if (elem.style) {
        result = elem.style.left;
    } else if (isNN4) {
        result = elem.left;
    }
    return parseInt(result);
}

function getObjectTop(obj)  {
    var elem = getRawObject(obj);
    var result = 0;
    if (document.defaultView) {
        var style = document.defaultView;
        var cssDecl = style.getComputedStyle(elem, "");
        result = cssDecl.getPropertyValue("top");
    } else if (elem.currentStyle) {
        result = elem.currentStyle.top;
    } else if (elem.style) {
        result = elem.style.top;
    } else if (isNN4) {
        result = elem.top;
    }
    return parseInt(result);
}

function getObjectWidth(obj)  {
    var elem = getRawObject(obj);
    var result = 0;
    if (elem.offsetWidth) {
        result = elem.offsetWidth;
    } else if (elem.clip && elem.clip.width) {
        result = elem.clip.width;
    } else if (elem.style && elem.style.pixelWidth) {
        result = elem.style.pixelWidth;
    }
    return parseInt(result);
}

function getObjectHeight(obj)  {
    var elem = getRawObject(obj);
    var result = 0;
    if (elem.offsetHeight) {
        result = elem.offsetHeight;
    } else if (elem.clip && elem.clip.height) {
        result = elem.clip.height;
    } else if (elem.style && elem.style.pixelHeight) {
        result = elem.style.pixelHeight;
    }
    return parseInt(result);
}

function getInsideWindowWidth() {
    if (window.innerWidth) {
        return window.innerWidth;
    } else if (isIE6CSS) {
        return document.body.parentElement.clientWidth
    } else if (document.body && document.body.clientWidth) {
        return document.body.clientWidth;
    }
    return 0;
}

function getInsideWindowHeight() {
    if (window.innerHeight) {
        return window.innerHeight;
    } else if (isIE6CSS) {        
        return document.body.parentElement.clientHeight
    } else if (document.body && document.body.clientHeight) {
        return document.body.clientHeight;
    }
    return 0;
}


function centerOnWindow(elemID) {
    var obj = getRawObject(elemID);    
    var scrollX = 0, scrollY = 0;
    if (document.body && typeof document.body.scrollTop != "undefined") {
        scrollX += document.body.scrollLeft;
        scrollY += document.body.scrollTop;
        if (document.body.parentNode && 
            typeof document.body.parentNode.scrollTop != "undefined") {
            scrollX += document.body.parentNode.scrollLeft;
            scrollY += document.body.parentNode.scrollTop
        }
    } else if (typeof window.pageXOffset != "undefined") {
        scrollX += window.pageXOffset;
        scrollY += window.pageYOffset;
    }
    var x = Math.round((getInsideWindowWidth()/2) - (getObjectWidth(obj)/2)) + scrollX;
    var y = Math.round((getInsideWindowHeight()/2) -  (getObjectHeight(obj)/2)) + scrollY;
    //shiftTo(obj, x, y);
    show(obj);
}


function initProgressBar() {
    UpdateIframe();
    window.resizeTo(1024,768);    
    if (navigator.appName == "Microsoft Internet Explorer" && 
        navigator.userAgent.indexOf("Win") != -1 && 
        (typeof document.compatMode == "undefined" || 
        document.compatMode == "BackCompat")) {
        document.getElementById("progressBar").style.height = "81px";
        document.getElementById("progressBar").style.width = "444px";
        document.getElementById("sliderWrapper").style.fontSize = "xx-small";
        document.getElementById("slider").style.fontSize = "xx-small";
        document.getElementById("slider").style.height = "13px";
        document.getElementById("slider").style.width = "415px";
        
    }
}

function showProgressBar() {
    centerOnWindow("progressBar");
}

function calcProgress(current, total) {
    if (current <= total) {
        var factor = current/total;
        var pct = Math.ceil(factor * 100);
        document.getElementById("sliderWrapper").firstChild.nodeValue = pct + "%";
        document.getElementById("slider").firstChild.nodeValue = pct + "%";
        document.getElementById("slider").style.clip = "rect(0px " + parseInt(factor * 417) + "px 16px 0px)";
    }
}

function hideProgressBar() {
    hide("progressBar");
    calcProgress(0, 1);
}

function UpdateIframe()
{
    document.getElementById("frame1234").src="SoCImagenes.aspx?IdVar=" + IDVar + "&IdTipo=" + IDTipo;
    window.resizeTo(1024,768);
}

function Cerrar_Ventana()
 {
       window.parent.close();
}   
</script>
<link href="../Estilos.css" rel="stylesheet" type="text/css" />
</head>
<body onload="initDHTMLAPI(); initProgressBar();" onunload="JavaScript:OnPageUnload();" oncontextmenu="disableContextMenu2();">
           
   
    <form name="FormHttp" id="FormHttp" autocomplete="off" action="SoAgregaImagenes.aspx" runat=server method="post">
         
	    
    </form>    
        <div id="ErrorString" ></div>
            <table name="tabla1" id="tabla1" style="left: 13px; position: absolute; top: 12px" width="950">
                <tr>
                    <td colspan="2" style="width: 447px; height: 580px;" valign="top">
                    <asp:Label id="Label1" runat="server" Height="24px" Text="Módulo de Ventas - Consulta Documentos - " CssClass="textHead2"></asp:Label>
                    <br />
                <img src="http://50.57.200.160/Crediamigo/Images/Blank.jpg" name="Img1a" alt="Imagen" id="Img1a" onclick="return Img1a_onclick()" width="488" style="height: 555px" />
                        
                    </td>
                    <td style="width: 5px; height: 580px;" valign="top"><iframe id="frame1234" src="SoCImagenes.aspx" style="width: 450px; height: 499px" frameborder="0"></iframe>
                        <br />
                        <table name="tabla2" style="width: 450px">
                            <tr>
                                <td colspan="3" style="height: 56px; width: 445px;" valign="top">
                                <div id="progressBar" style="height: 17px">
                                    <div id="progressBarMsg" style="left: 13px; top: 7px">Procesando Imagen...</div>
                                    <div id="sliderWrapper" style="left: 10px; top: 26px">0%
                                        <div id="slider">0%</div>
                                    </div>
                                </div>
                            </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="width: 445px">
                            <input id="Button1" value="Cerrar Ventana" name="Button1" type="button" onclick="javascript:Cerrar_Ventana();" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
</body>
</html>
