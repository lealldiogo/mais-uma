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
        var food_total= 0;
        $('.subfood').each(function(food_index, food_value){
        counter += 1;
        var food_name = $(food_value).children('p').text();
        var food_price = parseFloat($(food_value).children('#food-price').text().replace('R$', '')).toFixed(2);
        var food_quantity = parseInt($('#order_order_details_attributes_' + food_index + '_quantity').val());

        if (isNaN(food_quantity) || food_quantity  === 0 ){

          // $(this).hide();
          // $('<li/>').html('Seu carrinho está vazio').appendTo('.panel-body ol');
        }
        else {
          food_total = food_total + (food_quantity * food_price);
          $('<li/>').html(food_name + ' ' + 'Qtd: ' + food_quantity + ' ' + 'R$' + food_price ).appendTo('.panel-body ol');
        }
      });
        var bev_total = 0;
       $('.subbeverage').each(function(bev_index, bev_value){
        var beverage_name = $(bev_value).children('p').text();
        var beverage_price = parseFloat($(bev_value).children('#bev-price').text().replace('R$', '')).toFixed(2);
        var beverage_quantity = parseInt($('#order_order_details_attributes_' + counter + '_quantity').val());
        counter += 1;
        if (isNaN(beverage_quantity) || beverage_quantity  === 0 ){

          // $(this).hide();
          // $('<li/>').html('Seu carrinho está vazio').appendTo('.panel-body ol');
        }
        else {
          bev_total = bev_total + (beverage_quantity * beverage_price);
          $('<li/>').html(beverage_name + ' ' + 'Qtd: ' + beverage_quantity + ' ' + 'R$' + beverage_price ).appendTo('.panel-body ol');
        }
        var j = 0;
      $('#apertar').click( function(e){
        j ++;
        $('#order_order_details_attributes_' + counter + '_quantity').val(j);
        });
      });
       var total = food_total + bev_total;
       if (total === 0){
        $('<h2/>').html('Sua cesta está vazia').appendTo('.panel-body ol');
       }
       else {
       $('<h2/>').html('Total: R$ ' + total.toFixed(2)).appendTo('.panel-body ol');
       }
    });
  });

