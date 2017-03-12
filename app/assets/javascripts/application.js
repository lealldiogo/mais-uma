//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

// Document for Order index.html
  $(document).ready(function(){
    $("#buy-row").hide();
    $(".subfood").hide();
    $("#form-seat").hide();
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
      $("#buy-row").hide();
      $(".subfood").hide();
      $(".subbeverage").hide();
      $("hr").hide();
      $("#form-seat").show();
      $("#food").show();
      $("#beverage").show();
      $('#food').removeClass('food-beverage');
      $('#food').addClass('food-beverage-small');
      $('#beverage').removeClass('food-beverage');
      $('#beverage').addClass('food-beverage-small');
    });

    $("#food").click(function(){
      $(".hidden-panel").hide();
      $("#form-seat").hide();
      $('#food').removeClass('food-beverage-small');
      $('#food').addClass('food-beverage');
      $('#beverage').removeClass('food-beverage-small');
      $('#beverage').addClass('food-beverage');
    });

    $("#beverage").click(function(){
      $(".hidden-panel").hide();
      $("#form-seat").hide();
      $('#food').removeClass('food-beverage-small');
      $('#food').addClass('food-beverage');
      $('#beverage').removeClass('food-beverage-small');
      $('#beverage').addClass('food-beverage');
    });

    // var first_food = $('#order_order_details_attributes_0_quantity').val();
      $("#basket").click(function(){
        $(".hidden-panel").show();
        $('.panel-body ol').empty();

        var counter = 0;
        $('.subfood').each(function(food_index, food_value){
        counter += 1;
        var food_name = $(food_value).find('p').text();
        var food_quantity = parseInt($('#order_order_details_attributes_' + food_index + '_quantity').val());
        if (isNaN(food_quantity) || food_quantity  === 0 ){

          // $(this).hide();
          // $('<li/>').html('Seu carrinho está vazio').appendTo('.panel-body ol');
        }
        else {
          $('<li/>').html(food_name + ' ' + 'Quantidade: ' + food_quantity ).appendTo('.panel-body ol');
        }
      });

       $('.subbeverage').each(function(bev_index, bev_value){
        var beverage_name = $(bev_value).children('p').text();
        var beverage_quantity = parseInt($('#order_order_details_attributes_' + counter + '_quantity').val());
        counter += 1;
        if (isNaN(beverage_quantity) || beverage_quantity  === 0 ){

          // $(this).hide();
          // $('<li/>').html('Seu carrinho está vazio').appendTo('.panel-body ol');
        }
        else {
          $('<li/>').html(beverage_name + ' ' + 'Quantidade: ' + beverage_quantity ).appendTo('.panel-body ol');
        }
      });
      });
    });




  // $('.subfood').each(function(food_index, food_value){
  //         var food_name = $(food_value).find('p').text();
  //         var food_quantity = parseInt($('#order_order_details_attributes_' + food_index + '_quantity').val());
  //         if (isNaN(food_quantity) || food_quantity  === 0 ){

  //           // $(this).hide();
  //           // $('<li/>').html('Seu carrinho está vazio').appendTo('.panel-body ol');
  //         }
  //         else {
  //           $('<li/>').html(food_name + ' ' + 'Quantidade: ' + food_quantity ).appendTo('.panel-body ol');
  //         }
  //       });

  //        $('.subbeverage').each(function(bev_index, bev_value){
  //         var beverage_name = $(bev_value).children('p').text();
  //         var beverage_quantity = parseInt($('#order_order_details_attributes_' + bev_index + '_quantity').val());
  //         if (isNaN(beverage_quantity) || beverage_quantity  === 0 ){

  //           // $(this).hide();
  //           // $('<li/>').html('Seu carrinho está vazio').appendTo('.panel-body ol');
  //         }
  //         else {
  //           $('<li/>').html(beverage_name + ' ' + 'Quantidade: ' + beverage_quantity ).appendTo('.panel-body ol');
  //         }
  //       });
