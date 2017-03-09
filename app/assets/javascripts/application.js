//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

  $(document).ready(function(){
    $("#buy-row").hide();
    $(".subfood").hide();
    $("#food").click(function(){
      $(".subfood").show();
      $("#buy-row").show();
      $("#beverage").hide();

    });

    $(".subbeverage").hide();
    $("#beverage").click(function(){
      $(".subbeverage").show();
      $("#buy-row").show();
      $("#food").hide();
    });

    $("#buymore").click(function(){
      $("#food").hide();
      $("#beverage").hide();
      $("#buy-row").hide();
      $(".subfood").hide();
      $(".subbeverage").hide();
      $("#food").show();
      $("#beverage").show();
    });

    $("#basket").click(function(){
      $("#food").hide();
      $("#beverage").hide();
      $("#buy-row").hide();
      $(".subfood").hide();
      $(".subbeverage").hide();
      $("hr").hide();
    });

  });
