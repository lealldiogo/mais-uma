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

    // $('#food').removeClass('food-beverage');
    // $('#food').addClass('food-beverage-small');
    // $('#beverage').removeClass('food-beverage');
    // $('#beverage').addClass('food-beverage-small');
  });
  // var first_food = $('#order_order_details_attributes_0_quantity').val();





    $('.subfood input').each(function(food_index, food_value){
      var clicks = 0;
      $('#btn-up_' + food_index).click( function(e){
          clicks ++;
          $('#order_order_details_attributes_' + food_index + '_quantity').val(clicks);
      });
      // counter += 1;

      $('#btn-down_' + food_index).click( function(e){
        if ($('#order_order_details_attributes_' + food_index + '_quantity').val() > 0 ){
        clicks --;
         $('#order_order_details_attributes_' + food_index + '_quantity').val(clicks);
         console.log(clicks);
        }
      });
    });


    // $('.subbeverage').each(function(bev_index, bev_value){
    //   counter += 1;
    //   var clicks = 0;
    //   $('#order_order_details_attributes_' + 3 + '_quantity').click( function(e){
    //     clicks ++;
    //     $('#order_order_details_attributes_' + 3 + '_quantity').val(clicks);
    //   });
    // });










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
      // var clicks = 0;
      // $('#order_order_details_attributes_' + food_index + '_quantity').click( function(e){
      //     clicks ++;
      //     $('#order_order_details_attributes_' + food_index + '_quantity').val(clicks);
      //   });
      var food_quantity = parseInt($('#order_order_details_attributes_' + food_index + '_quantity').val());
        if (isNaN(food_quantity) || food_quantity  === 0 ){

          // $(this).hide();
          // $('<li/>').html('Seu carrinho está vazio').appendTo('.panel-body ol');
        }
        else {
          food_total = food_total + (food_quantity * food_price);
          $('.table tbody').append('<tr>');
          $('<td/>').html(food_quantity).appendTo('tbody');
          $('<td/>').html(food_name).appendTo('tbody');
          $('<td/>').html(food_price).appendTo('tbody');
          $('<td/>').html(food_price * food_quantity).appendTo('tbody');
          $('.table tbody').append('</tr>');
          // $('<li/>').html(food_name + ' '  + 'R$' + food_total ).appendTo('.panel-body ol');
        }
    });




    var bev_total = 0;
    $('.subbeverage').each(function(bev_index, bev_value){
      var beverage_name = $(bev_value).children('p').text();
      var beverage_price = parseFloat($(bev_value).find('#bev-price').text().replace('R$', '')).toFixed(2);
      var beverage_quantity = parseInt($('#order_order_details_attributes_' + counter + '_quantity').val());
      counter += 1;
      if (isNaN(beverage_quantity) || beverage_quantity  === 0 ){

        // $(this).hide();
        // $('<li/>').html('Seu carrinho está vazio').appendTo('.panel-body ol');
      }
      else {
        bev_total = bev_total + (beverage_quantity * beverage_price);
        $('.table tbody').append('<tr>');
        $('<td/>').html(beverage_quantity).appendTo('tbody');
        $('<td/>').html(beverage_name).appendTo('tbody');
        $('<td/>').html(beverage_price).appendTo('tbody');
        $('<td/>').html(beverage_price * beverage_quantity).appendTo('tbody');
        $('.table tbody').append('</tr>');
        // $('<li/>').html(beverage_name + ' ' + 'Qtd: ' + beverage_quantity + ' ' + 'R$' + bev_total ).appendTo('.panel-body ol');
      }
      var total = 0;
      var total = food_total + bev_total;
      if (total === 0){
        $('h2').empty();
        $('<h2/>').html('Seu carrinho está vazio').appendTo('tbody');
        $("#basket-ok").hide();
        $("#form-seat").hide();
      }
      else {
        $('h2').empty();
        $('.table tbody').append('<tr>');
        $("<h2/>").html('Total: R$ ' + total.toFixed(2)).appendTo('tbody');
        $('.table tbody').append('</tr>');
         $("#basket-ok").show();
      }
    });
  });
});



//   var bev_total = 0;
//   $('.subbeverage').each(function(bev_index, bev_value){
//     var beverage_name = $(bev_value).children('p').text();
//     var beverage_price = parseFloat($(bev_value).children('#bev-price').text().replace('R$', '')).toFixed(2);
//     var clicks = 0;
//     $('#order_order_details_attributes_' + counter + '_quantity').click( function(e){
//       clicks ++;
//       $('#order_order_details_attributes_' + counter + '_quantity').val(clicks);
//     });

//     var beverage_quantity = parseInt($('#order_order_details_attributes_' + counter + '_quantity').val());
//     counter += 1;
//     if (isNaN(beverage_quantity) || beverage_quantity  === 0 ){

//       // $(this).hide();
//       // $('<li/>').html('Seu carrinho está vazio').appendTo('.panel-body ol');
//     }
//     else {
//       bev_total = bev_total + (beverage_quantity * beverage_price);
//       $('<li/>').html(beverage_name + ' ' + 'Qtd: ' + beverage_quantity + ' ' + 'R$' + bev_total ).appendTo('.panel-body ol');
//     }
//     var total = food_total + bev_total;
//     if (total === 0){
//       $('<h2/>').html('Seu carrinho está vazio').appendTo('.panel-body ol');
//     }
//     else {
//       $('<h2/>').html('Total: R$ ' + total.toFixed(2)).appendTo('.panel-body ol');
//     }
//     });
//   });
// });

