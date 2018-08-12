
    /*=========================== slider ===========================*/
    $(document).ready(function(){
        $(".slider_elemet.active").show(0);
        auto_slider(5000);
        /*Funcion del moviemiento del slider del index*/

        var slides = $(".slider_elemet").length;
        var active_slide;
        var slider_move;
        var slider_bullets = 0;

        for (var i = 1; i <= slides; i++) {
            $(".slider_bullets").append("<li></li>");
        };

        $(".slider_bullets li").eq(slider_bullets).addClass("active");

        function auto_slider(tiempo){
            slider_move = setInterval(function(){ change_next_slide(); }, tiempo);
        }

        
        function change_next_slide(){
            active_slide = $(".slider_elemet.active").index();
            var next_slide = active_slide+1;
            if(next_slide >= slides ){
                next_slide = 0;
            }
            $(".slider_elemet").removeClass("active");
            $(".slider_elemet").fadeOut(0);
            $(".slider_bullets li").removeClass("active");
            $(".slider_elemet").eq(next_slide).addClass("active");
            $(".slider_elemet").eq(next_slide).fadeIn(300);
            $(".slider_bullets li").eq(next_slide).addClass("active");
        }

        $(".slider_bullets li").click(function(){
            clearInterval(slider_move);
            active_slide = $(this).index();
            $(".slider_elemet").removeClass("active");
            $(".slider_elemet").fadeOut(0);
            $(".slider_bullets li").removeClass("active");
            $(".slider_elemet").eq(active_slide).addClass("active");
            $(".slider_elemet").eq(active_slide).fadeIn(300);
            $(".slider_bullets li").eq(active_slide).addClass("active");
            auto_slider(5000);
        });


    });




    

    /*=========================== slider testimonios ===========================*/

   
    
    //grab the width and calculate left value
    var item_width = $('.slider_footer_content li').outerWidth(); 
    var left_value = item_width * (-1); 
        
    //move the last item before first item, just in case user click prev button
    $('.slider_footer_content li:first').before($('.slider_footer_content li:last'));
    
    //set the default item to the correct position 
    $('.slider_footer_content ul').css({'left' : left_value});

    //if user clicked on prev button
    $('.customNextBtn').click(function() {

        //get the right position            
        var left_indent = parseInt($('.slider_footer_content ul').css('left')) + item_width;

        //slide the item            
        $('.slider_footer_content ul').animate({'left' : left_indent}, 200,function(){    

            //move the last item and put it as first item               
            $('.slider_footer_content li:first').before($('.slider_footer_content li:last'));           

            //set the default item to correct position
            $('.slider_footer_content ul').css({'left' : left_value});
        
        });

        //cancel the link behavior            
        return false;
            
    });

         
    //if user clicked on next button
    $('.customPrevBtn').click(function() {


        //get the right position
        var left_indent = parseInt($('.slider_footer_content ul').css('left')) - item_width;
        
        //slide the item
        $('.slider_footer_content ul').animate({'left' : left_indent}, 200, function () {
            
            //move the first item and put it as last item
            $('.slider_footer_content li:last').after($('.slider_footer_content li:first'));                  
            
            //set the default item to correct position
            $('.slider_footer_content ul').css({'left' : left_value});
        
        });
                 
        //cancel the link behavior
        return false;
        
    });        
            

    /*=========================== COTIZADOR ===========================*/



    // Funcion para agregar comas a los numeros
    function agregarComas(x) {
        return x.toString().replace(/\B(?=(?:\d{3})+(?!\d))/g, ",");
    }
    // Funcion para quitar comas a los numeros
    function quitarComas(x) {
        return x.toString().replace(",", "");
    }

    function quitarPesos(x) {
        return x.toString().replace("$", "");
    }

    function actualizarCostos(num_invitados){
        $("input[name$='invitados_hidden']").val(num_invitados);

        var costos = $('.cotizador_monto-costo');
        var num = costos.length;

        for (var i = 1; i <= num; i++) {
            costo = $('#costo' + i).data('costo');
            if (i == 1 || i == 2 || i == 3) {
                costoFinal = costo * num_invitados;
            }
            else{
                costoFinal = costo;
            };
            costoFinal = parseFloat(costoFinal);
            costoFinal = costoFinal.toFixed(0);
            $('#costo' + i).text('$' + agregarComas(costoFinal));
        };  
        recargarMonto();
    }

    function recargarMonto(){
        var costos = $('.cotizador_monto-costo');
        var num = costos.length;
        var total = 0;

        for (var i = 1; i <= num; i++) {
            costoActual = $('#costo' + i).text();
            costoActual = quitarPesos(costoActual);
            costoActual = quitarComas(costoActual);
            total = total + parseFloat(costoActual);
        };   
        total = total.toFixed(0);
        total = agregarComas(total);
        $('#montoTotal').text('$' + total);
    }


    function mensualidades(meses){
        $('.cotizador_container-meses').removeClass('meses_active');
        $('#btn_meses' + meses).addClass('meses_active');

        $("input[name$='registro_meses']").val(meses);

        calcularCredito();
    } 

    function calcularCredito(){

        var tasa_credito,
                comision_apertura,
                monto_comision,
                monto_credito,
                plazo_meses,
                couta_admon,
                seguro,
                mensualida_final,
                pesos_millar;

            // TASA CREDITO
            tasa_credito = $('#cotizadorDatos').data('tasa');
            tasa_credito = tasa_credito/12;
            tasa_credito = Math.round(tasa_credito * 100) / 100;
            tasa_credito = tasa_credito / 100;
            tasa_credito = Math.round(tasa_credito * 100) / 100;

            // COMISION DE APERTURA
            comision_apertura = $('#cotizadorDatos').data('comision');
            comision_apertura = comision_apertura/100;

            // MONTO DEL CREDITO
            monto_credito = $('#num-monto').val();
            monto_credito = quitarComas(monto_credito);
            monto_credito = quitarComas(monto_credito);
            monto_credito = parseInt(monto_credito);

            // MONTO DE COMISION
            monto_comision = monto_credito * comision_apertura;

            // PLAZO MESES
            if ($('#btn_meses36').hasClass('meses_active')) {
                plazo_meses = 36;
            }else if($('#btn_meses48').hasClass('meses_active')){
                plazo_meses = 48;
            }else if($('#btn_meses60').hasClass('meses_active')){
                plazo_meses = 60;
            };


            // CUOTA ADMON
            couta_admon = $('#cotizadorDatos').data('cuota');

            // SEGURO
            pesos_millar = $('#cotizadorDatos').data('millar');
            seguro = (monto_credito * pesos_millar)/1000;

            // IVA
            iva = 0.16;

            

            // CALCULO
            //((125000+(5000*(1+0.16)))/(((Math.pow((1+(0.02*(1+0.16))),24))-1)/((Math.pow((1+(0.02*(1+0.16))),24))*(0.02*(1+0.16)))))+(0*(1+0.16)+150);

            mensualida_final = ((monto_credito+(monto_comision*(1+iva)))/(((Math.pow((1+(tasa_credito*(1+iva))),plazo_meses))-1)/((Math.pow((1+(tasa_credito*(1+iva))),plazo_meses))*(tasa_credito*(1+iva)))))+(couta_admon*(1+iva)+seguro);
            mensualida_final = Math.round(mensualida_final * 100) / 100;
            mensualida_final = mensualida_final.toFixed(0);
            mensualida_final = agregarComas(mensualida_final);
            

            $('#mensualidadFinal').text(mensualida_final);

            $("input[name$='monto_hidden']").val(agregarComas(monto_credito));
            $("input[name$='meses_hidden']").val(plazo_meses);
    }

    function paquetes(){
        var tbasico = parseInt($('#contentBasico').css('height'));
        var tregular = parseInt($('#contentRegular').css('height'));
        var tpremium = parseInt($('#contentPremium').css('height'));
        var mayor = 2;
        
        if (mayor <= tbasico) {
            mayor = tbasico;
        }
        if (mayor <= tregular) {
            mayor = tregular;
        }
        if (mayor <= tpremium) {
            mayor = tpremium;
        }

        $('#contentBasico').css('height',mayor);
        $('#contentRegular').css('height',mayor);
        $('#contentPremium').css('height',mayor);

    }

    $(document).ready(function () {
        actualizarCostos(100);
        calcularCredito();
        paquetes();

        $('#costoBasico').text('$' + agregarComas($('#costoBasico').text()));
        $('#costoRegular').text('$' + agregarComas($('#costoRegular').text()));
        $('#costoPremium').text('$' + agregarComas($('#costoPremium').text()));

        $('#btn_mesesIndex60').addClass('meses_activeIndex');
        $('#btn_mesesIndex60').css("background-color", "#3766a1");
        $('#btn_mesesIndex60' + ' p').css("color", "#fff");



        // Botones cantidad de invitados
        $('#btn-invitadosMax').click(function (e) {
            e.preventDefault();
            var invitados_actual = $('#num-invitados').text();
            var num_invitados = parseInt(invitados_actual) + 20;
            $('#num-invitados').text(num_invitados);
            actualizarCostos(num_invitados);
            $("input[name$='registro_invitados']").val(num_invitados);
        });

        $('#btn-invitadosMin').click(function (e) {
            e.preventDefault();
            var invitados_actual = $('#num-invitados').text();
            var num_invitados = parseInt(invitados_actual) - 20;
            if (num_invitados >= 100) {
                $('#num-invitados').text(num_invitados);
                actualizarCostos(num_invitados);
                $("input[name$='registro_invitados']").val(num_invitados);
            };

        });

        
         // Botones Monto requerido
        $('#btn-monto').change(function (e) {
            e.preventDefault();
            var monto_actual = $('#num-monto').text();

            monto_actual = quitarComas(monto_actual);
            monto_actual = quitarComas(monto_actual);
            var monto = parseInt(monto_actual);

            calcularCredito();
            $("input[name$='registro_monto']").val(monto);
        });


        // Botones Monto requerido
        $('#btn-montoMax').click(function (e) {
            e.preventDefault();
            var monto_actual = $('#num-monto').text();
            monto_actual = quitarComas(monto_actual);
            monto_actual = quitarComas(monto_actual);
            var monto = parseInt(monto_actual) + 25000;
            console.log(monto);
            if (monto <= 5000000) {
                
                monto = agregarComas(monto);
                $('#num-monto').text(monto);
            };

            calcularCredito();
            $("input[name$='registro_monto']").val(monto);
        });

        $('#btn-montoMin').click(function (e) {
            e.preventDefault();
            var monto_actual = $('#num-monto').text();
            monto_actual = quitarComas(monto_actual);
            monto_actual = quitarComas(monto_actual);

            var monto = parseInt(monto_actual) - 25000;
            if (monto >= 200000) {
                monto = agregarComas(monto);
                $('#num-monto').text(monto);
                $("input[name$='registro_monto']").val(monto);
            };

            calcularCredito();

        });


        /*=========================== BUSCADOR ===========================*/
        $("#btnSearchHeader").click(function (e) {
            e.preventDefault();
            if ($(".search_input").hasClass('active')){
                var criterio = $('#inputBuscarHeader').val();
                console.log(criterio);
                if (criterio != "") {
                    location.href='http://www.financiatuboda.com/busqueda.php?criterio=' + criterio;
                }
            }else{
                $(".search_input").addClass("active")
            };
        });

        $("#btnSearchFooter").click(function (e) {
            e.preventDefault();
            if ($(".search_input").hasClass('active')){
                var criterio = $('#inputBuscarFooter').val();
                console.log(criterio);
                if (criterio != "") {
                    location.href='http://www.financiatuboda.com/busqueda.php?criterio=' + criterio;
                }
            }else{
                $(".search_input").addClass("active")
            };
        });



        /*=========================== VIDEO INDEX ===========================*/
        // $('#btn_verVideo').click(function(e){
        //     e.preventDefault();
        //     if ($('#slide_contentImagen').is(':visible')){
        //         $('#slide_contentImagen').hide();
        //         $('#slide_contentVideo').show();
        //         var myVideo = document.getElementById("videoSlide"); 
        //         if (myVideo.paused){
        //             myVideo.play();
        //         };

        //     }
        //     else if($('#slide_contentVideo').is(':visible')){
        //         $('#slide_contentVideo').hide();
        //         $('#slide_contentImagen').show();
        //         var myVideo = document.getElementById("videoSlide"); 
        //         if (myVideo.played){
        //             myVideo.pause();
        //         };
        //     }
            
        // });

        $('#btn_verVideo').click(function(e){
            e.preventDefault();
            $('#videoIndex').fadeIn();
        });

        $('#close_videoIndex, #videoIndex').click(function(e){
            e.preventDefault();
            $('#videoIndex').fadeOut();
        });

        $('#btn_verSlide').click(function(e){
            e.preventDefault();
            if ($('#slide_contentImagen').is(':visible')){
                $('#slide_contentImagen').hide();
                $('#slide_contentVideo').show();
                var myVideo = document.getElementById("videoSlide"); 
                if (myVideo.paused){
                    myVideo.play();
                };

            }
            else if($('#slide_contentVideo').is(':visible')){
                $('#slide_contentVideo').hide();
                $('#slide_contentImagen').show();
                var myVideo = document.getElementById("videoSlide"); 
                if (myVideo.played){
                    myVideo.pause();
                };
            }
            
        });

         /*=========================== POSICION INICIAL DEL COTIZADOR ===========================*/
        $('#panel_cotizador').css({
            'position': 'absolute',
            'right': '0',
            'width': '320px',
            'height': '400px',
            'top': '-70px',
            'font-family': 'Raleway,sans-serif',
            'z-index': '10',
        });

        $('.sidebar_title').css({
            'background-color': 'rgba(0, 0, 0, 0.2)'
        });

        /*=========================== POSICION INICIAL DEL COTIZADOR ===========================*/


        /*=========================== PROVEEDOR DESCRIPCION ===========================*/
        /*if ($('#descProveedor').text().length > 1196) {
            $('#descProveedor').removeClass("info_prov_header_text");
            $('#descProveedor').addClass("info_prov_header_text2");
        }*/

        




    });


    /*=========================== COTIZADOR MONTO INDEX ===========================*/
/*
    // Botones Monto requerido
    $('#btn-montoMax').click(function (e) {
        e.preventDefault();
        var monto_actual = $('#num-monto').text();
        monto_actual = quitarComas(monto_actual);
        var monto = parseInt(monto_actual) + 5000;
        if (monto <= 700000) {
            monto = agregarComas(monto);
            $('#num-monto').text(monto);
        };

    });

    $('#btn-montoMin').click(function (e) {
        e.preventDefault();
        var monto_actual = $('#num-monto').text();
        monto_actual = quitarComas(monto_actual);

        var monto = parseInt(monto_actual) - 5000;
        if (monto >= 0) {
            monto = agregarComas(monto);
            $('#num-monto').text(monto);
        };

    });*/


    /*=========================== FAQS ===========================*/
    function mostrarRespuesta(id) {
        var answer = $('.answer' + id);
        var icon = $('.icon_question' + id);

        if (icon.hasClass('faqs_arrow-up')){
            answer.slideToggle(500);
            icon.removeClass( "faqs_arrow-up" );
            icon.addClass( "faqs_arrow-down" );
        }
        else{
            $('.faqs_item-answer').hide(10);

            $('.icon_arrow').removeClass( "faqs_arrow-up" );
            $('.icon_arrow').addClass( "faqs_arrow-down" );

            icon.removeClass( "faqs_arrow-down" );
            icon.addClass( "faqs_arrow-up" );
            answer.slideToggle(500);
        }

        
        return false;
    }

    /*=========================== COTIZADOR INDEX ===========================*/


    function fixDiv() {

        var $cache = $('#panel_cotizador');
        var altoImage = $('.contentSlider').css("height");

        altoImage = parseInt(altoImage) - 55;
      
        if ($(window).scrollTop() > altoImage - 120){
           if($(window).scrollTop() > altoImage + 400){
                $cache.css({
                    'position': 'absolute',
                    'right': '0',
                    'width': '320px',
                    'height': '400px',
                    'top': '490px',
                    'font-family': 'Raleway,sans-serif',
                    'z-index': '10'
                });
            }else{
                $cache.css({
                    'position': 'fixed',
                    'top': '145px'
                });
                $('.sidebar_title').css({
                    'background-color': '#3766a1'
                });
            }
        }else if ($(window).scrollTop() < altoImage - 120){
            $cache.css({
                'position': 'absolute',
                'right': '0',
                'width': '320px',
                'height': '400px',
                'top': '-70px',
                'font-family': 'Raleway,sans-serif',
                'z-index': '10',
            });
        }  

    }
    $(window).scroll(fixDiv);
    fixDiv();

    function mensualidadesIndex(meses){
        $('.btn_month').removeClass('meses_activeIndex');
        $('.btn_month').css("background-color", "#90bae4");
        $('.btn_month p').css("color", "#3766a1");

        $('#btn_mesesIndex' + meses).addClass('meses_activeIndex');
        $('#btn_mesesIndex' + meses).css("background-color", "#3766a1");
        $('#btn_mesesIndex' + meses + ' p').css("color", "#fff");
    }


    // Cotizador index
    function formCotizar_index(){
        // PLAZO MESES
        if ($('#btn_mesesIndex36').hasClass('meses_activeIndex')) {
            plazo_mesesIndex = 36;
        }else if($('#btn_mesesIndex48').hasClass('meses_activeIndex')){
            plazo_mesesIndex = 48;
        }else if($('#btn_mesesIndex60').hasClass('meses_activeIndex')){
            plazo_mesesIndex = 60;
        };

        montoIndex = $('#num-monto').text();
        montoIndex = quitarComas(montoIndex);
        montoIndex = quitarComas(montoIndex);

        location.href='cotizador.php?meses=' + plazo_mesesIndex + '&monto=' + montoIndex;
    }

    /*================================ AVISO DE PRIVACIDAD ================================*/

    $('#show_aviso').click(function(a){
        a.preventDefault();
        $('#avisobox').fadeIn(500);
    });
    $('#close_aviso').click(function(a){
        a.preventDefault();
        $('#avisobox').fadeOut(500);
    });
	
	$('#show_acerca').click(function(a){
        a.preventDefault();
        $('#acercabox').fadeIn(500);
    });
    $('#close_acerca').click(function(a){
        a.preventDefault();
        $('#acercabox').fadeOut(500);
    });

    $('#show_terminos').click(function(a){
        a.preventDefault();
        $('#terminosbox').fadeIn(500);
    });
    $('#show_terminos2').click(function(a){
        a.preventDefault();
        $('#terminosbox').fadeIn(500);
    });
    $('#close_terminos').click(function(a){
        a.preventDefault();
        $('#terminosbox').fadeOut(500);
    });

    /*================================ LOGIN MOVIL ================================*/
        
    
    $('#btn_loginMovil').click(function(a){
        a.preventDefault();
        $('.menu_login-movil').slideToggle(500);
        
    });


    /*================================ GALERIA ================================*/ 
    
    function galeriaProv() {
        $('#galeria_proveedor').fadeIn();
    };

    $('#close_galeriaProv').click(function(a){
        a.preventDefault();
        $('#galeria_proveedor').fadeOut();
    });

    /*================================ REGISTRO ================================*/ 

    $('#btnDia').click(function(a){
        a.preventDefault();
        if ($('#listDia').is(":hidden")) {
            $('.elementList').hide();
        };
        $('#listDia').slideToggle(200);
    });

    $('#btnMes').click(function(a){
        a.preventDefault();
        if ($('#listMes').is(":hidden")) {
            $('.elementList').hide();
        };
        $('#listMes').slideToggle(200);
    });

    $('#btnAno').click(function(a){
        a.preventDefault();
        if ($('#listAno').is(":hidden")) {
            $('.elementList').hide();
        };
        $('#listAno').slideToggle(200);
    });

    function selectDia() {
        $('#galeria_proveedor').fadeIn();
    };

    $('.elementDia').click(function(a){
        a.preventDefault();
        $('#diaSelect').text($(this).text());
        $('#listDia').hide();
    });
    $('.elementMes').click(function(a){
        a.preventDefault();
        $('#mesSelect').text($(this).text());
        $('#listMes').hide();
    });
    $('.elementAno').click(function(a){
        a.preventDefault();
        $('#anoSelect').text($(this).text());
        $('#listAno').hide();
    });
    





