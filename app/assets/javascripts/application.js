// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require bootstrap-sprockets
//= require activestorage
//= require Chart.bundle
//= require highcharts
//= require chartkick
//= require dataTables/jquery.dataTables
//= require dataTables/extras/dataTables.responsive
//= require turbolinks
//= require select2
//= require_tree .

(function($){
    "use strict";
    $(document).on('turbolinks:load', function(){
        // Alert fade out time
        $(".alert" ).fadeOut(4000);

        // Selector for city query type
        $("#type_selector").select2({
            minimumResultsForSearch: -1,
            allowClear: true,
            width: 300,
            theme: "bootstrap"
        });

        // Selecctor for city in index view
        $("#city_city_id").select2({
            allowClear: true,
            width: 300,
            theme: "bootstrap"
        });

        // Automaticaly hide geolocation and zip code forms
        $("#form_geo").hide();
        $("#form_zip").hide();

        // Change active form based on selected choice
        $("#type_selector").change(function() {
            $("#form_city").hide();
            $("#form_geo").hide();
            $("#form_zip").hide();
            if($(this).find("option:selected").text() == "Código Postal"){
                $("#form_zip").show();
            }
            else if($(this).find("option:selected").text() == "Geolocalización"){
                $("#form_geo").show();
            }
            else{
                $("#form_city").show();
            }
        });

        // Forecast data table
        $('#forecast-table').DataTable({
            responsive: true,
            searching: false,
            paginate: false
        });

        // City list table
        $('#city-table').DataTable({
            responsive: true,
            language: {
                lengthMenu: "Mostrar _MENU_ filas por página",
                zeroRecords: "No se encontraron resultados",
                info: "Mostrando página _PAGE_ de _PAGES_",
                infoEmpty: "No existen ciudades registradas",
                infoFiltered: "(filtrado de _MAX_ ciudades en total)",
                search: "Buscar:",
                paginate: {
                    previous: "Anterior",
                    next: "Siguiente"
                }
            }
        });
    });


}(jQuery));