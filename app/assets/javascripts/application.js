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
      // localStorage.setItem($('#3').val());
    });

    $("#buymore").click(function(){
      location.reload();
    });

  });
