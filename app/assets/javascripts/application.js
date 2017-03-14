//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

// Document for Order index.html
$(document).ready(function(){

  // this is to prevent enter key and submit with no data
  $(window).keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });

  $('.stadium-img').hide();
  $('.stadium-sectors').hide();


  $(".display-map").click(function(){
    $('.stadium-img').toggle();
  });

  $(".display-sectors").click(function(){
    $('.stadium-sectors').toggle();
  });


  $("#buy-row").hide();
  $(".subfood").hide();
  $("#form-seat").hide();
  $("#food").click(function(){
    $("#buyfood").hide();
    $("#basket-ok").hide();
    $(".subfood").show();
    $("#buy-row").show();
    $("#beverage").hide();
  });

  $("#buybev").click(function(){
    $("#beverage").show();
    $("#food").hide();
    $(".subbeverage").show();
    $(".subfood").hide();
    $("#buyfood").show();
    $("#buybev").hide();
    $("#basket-ok").hide();
    $("#basket").show();
    $("#form-seat").hide();
    $(".hidden-panel").hide();

  });

  $("#buyfood").click(function(){
    $("#food").show();
    $("#beverage").hide();
    $(".subfood").show();
    $(".subbeverage").hide();
    $("#buybev").show();
    $("#buyfood").hide();
    $("#basket-ok").hide();
    $("#basket").show();
    $("#form-seat").hide();
    $(".hidden-panel").hide();
  });

  $(".subbeverage").hide();
  $("#beverage").click(function(){
    $("#buybev").hide();
    $("#basket-ok").hide();
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
  $("#basket").click(function(){
    $("#basket-ok").show();
    $("#basket").hide();
    $(".subfood").hide();
    $(".subbeverage").hide();
    $("hr").hide();
    $("#form-seat").show();
    $("#food").hide();
    $("#beverage").hide();
    $("#buyfood").show();
    $("#buybev").show();
  });
  $('.subfood input').each(function(food_index, food_value){
    var clicks = 0;
    $('#btn-up_' + food_index).click( function(e){
      clicks ++;
      $('#order_order_details_attributes_' + food_index + '_quantity').effect('bounce', 1).effect('highlight', {color: 'rgba(67, 146, 241, 1)'});
      $('#order_order_details_attributes_' + food_index + '_quantity').val(clicks);
    });
    $('#btn-down_' + food_index).click( function(e){
      if ($('#order_order_details_attributes_' + food_index + '_quantity').val() > 0 ){
      clicks --;
       $('#order_order_details_attributes_' + food_index + '_quantity').effect('bounce', 1).effect('highlight', {color: '#ED254E'});
       $('#order_order_details_attributes_' + food_index + '_quantity').val(clicks);
      }
    });
  });
  $("#basket").click(function(e){
    $(".hidden-panel").show();
    $('.panel-body ol').empty();
    var counter = 0;
    var food_total= 0;
    $('tbody').empty();
    $('.subfood').each(function(food_index, food_value){
      counter += 1;
      var food_name = $(food_value).children('p').text();
      var food_price = parseFloat($(food_value).find('#food-price').text().replace('R$', '')).toFixed(2);
      var food_quantity = parseInt($('#order_order_details_attributes_' + food_index + '_quantity').val());
        if (isNaN(food_quantity) || food_quantity  === 0 ){
        }
        else {
          food_total = food_total + (food_quantity * food_price);

          var $row = $('<tr>' + '</tr>');
          $('tbody').append($row);
          $($row).append('<td>' + food_quantity + '</td>');
          $($row).append('<td>' + food_name + '</td>');
          $($row).append('<td>' + food_price + '</td>');
          $($row).append('<td>' + food_price * food_quantity + '</td>');

          // $('.table tbody').append('<tr>');
          // $('<td/>').html(food_quantity).appendTo('tbody');
          // $('<td/>').html(food_name).appendTo('tbody');
          // $('<td/>').html(food_price).appendTo('tbody');
          // $('<td/>').html(food_price * food_quantity).appendTo('tbody');
          // $('.table tbody').append('</tr>');
        }
    });
    var bev_total = 0;
    $('.subbeverage').each(function(bev_index, bev_value){
      var beverage_name = $(bev_value).children('p').text();
      var beverage_price = parseFloat($(bev_value).find('#bev-price').text().replace('R$', '')).toFixed(2);
      var beverage_quantity = parseInt($('#order_order_details_attributes_' + counter + '_quantity').val());
      counter += 1;


      if (isNaN(beverage_quantity) || beverage_quantity  === 0 ){
      }
      else {
        bev_total = bev_total + (beverage_quantity * beverage_price);
        // $('.table').append('<tr>');
        // $('<tr/>').appendTo('tbody');

        var $row = $('<tr>' + '</tr>');
        $('tbody').append($row);
        $($row).append('<td>' + beverage_quantity + '</td>');
        $($row).append('<td>' + beverage_name + '</td>');
        $($row).append('<td>' + beverage_price + '</td>');
        $($row).append('<td>' + beverage_price * beverage_quantity + '</td>');

        // $('<td/>').html(beverage_quantity).appendTo('tr');
        // $('<td/>').html(beverage_name).appendTo('tr');
        // $('<td/>').html(beverage_price).appendTo('tr');
        // $('<td/>').html(beverage_price * beverage_quantity).appendTo('tr');

      }
      // Estava aqui o codigo do total
    });
    var total = 0;
      var total = food_total + bev_total;
      if (total === 0){
        $('h2').empty();
        $('<h2/>').html('Seu carrinho está vazio').appendTo('tbody');
        $("#basket-ok").hide();
        $("#form-seat").hide();
      }
      else {
        $('h4').empty();
        var $row = $('<tr>' + '</tr>');
        $('tbody').append($row);
        $($row).append('<h4>' + 'Total: R$ ' + total.toFixed(2) + '</h4>');
        // $('.table tbody').append('<tr>');
        // $("<h4/>").html('Total: R$ ' + total.toFixed(2)).appendTo('tbody');
        // $('.table tbody').append('</tr>');
         $("#basket-ok").show();
      }
  });
});
