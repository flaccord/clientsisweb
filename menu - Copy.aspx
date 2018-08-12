<%@ Page Language="VB" AutoEventWireup="false" CodeFile="menu.aspx.vb" Inherits="menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
		<!-- Estilos CSS -->
		<style type="text/css">
			a:link   
			{   
				text-decoration:none;   
			} 
			/* Div que contiene el menú, el logo y la barra animada */
			.Principal {
				-webkit-user-select: none; /* Chrome, Safari, y Opera 15 */
				-moz-user-select: none;
				-ms-user-select: none;
				user-select: none;
			}
			/* Logo del demonio */
			.Logo {
				position:absolute;
				display:inline-block;
				width:120px;
				height:120px;
				border-radius:60px;
				border:1px solid black;
				background-image:url('/Web/Graficos/logo100.png'), -webkit-radial-gradient(rgb(0, 25, 51), rgba(0,76,153, 0.7));
				background-image:url('/Web/Graficos/logo100.png'), radial-gradient(rgb(0, 25, 51), rgba(0,76,153, 0.7));
				background-repeat:no-repeat, no-repeat;
				background-position:center; 				
				
/*				background:rgb(90, 80, 80) url('/Web/Graficos/logo100.png') no-repeat center;*/
				box-shadow:1px 1px 1px 1px rgba(80,80,80, 0.5); 
				z-index:2;
			}
			/* Barra que simula el subrayado */
			.Barra {
				position:absolute;
				width:1px;
				height:3px;
				left:10px;
				top:50px;
				background:blue;
				z-index:0;
			}
			/* Menu */
			.MenuSubrayado {
				position:absolute;
				top:10px;
				left:10px; 
				z-index:1;
			}
			/* Items del menu */
			.MenuSubrayado > li {
				display:inline-block;
				margin-left:25px;
				font-family:Consolas, "Andale Mono", "Lucida Console", "Lucida Sans Typewriter", Monaco, "Courier New", monospace;
				font-size:24px;			
				cursor:pointer;
				color:rgb(0,0,0);
			}
			/* Item resaltado por el mouse */
			.MenuSubrayado > li:hover {
				color:rgb(0,76,153);
			}
		</style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script>
			var Menu_Temporitzador = 0;
			/* Al cargar la página */
			$(window).load(function() {
				/* Re-emplazo los eventos mouseover y mouseout */
				$(".MenuSubrayado > li").on("mouseover", function() { 
					Menu_AnimarSubrayat(this);
				})
				$(".MenuSubrayado > li").on("mouseout", function() { 
					Menu_Temporitzador = setInterval(function() { 
						/* Animación para devolver la barra detrás del logo */
						$(".Barra").stop().animate({ "left" : "10px", width: "1px"}, 300, function() { 
							clearInterval(Menu_Temporitzador); 
							Menu_Temporitzador = 0; 
						});
					}, 500);
				})
			});
			/* Función que localiza el li:hover y hace que se mueva la barra a su posición */
			function Menu_AnimarSubrayat(Objecte) {
				Menu = $(Objecte);
				Barra = $(".Barra");
				if (Menu_Temporitzador != 0) clearInterval(Menu_Temporitzador);
				Barra.stop().animate({ "left" : Menu.offset().left + "px", "width" : Menu.outerWidth() + "px" }, 300, function() { });
			}
        </script>
    </head>
    <body>
    	<div class='Principal'>
            <ul class='MenuSubrayado'>
                <li><a href="SolicitudCredito.htm">Registro</a></li>
                <li><a href="consultas.aspx">Consultas</a></li>
                <li>Usuarios</li>
            </ul>
            <!--<div class='Barra'></div>
			<div class='Logo'></div>!-->
            
        </div>
    </body>
</html>