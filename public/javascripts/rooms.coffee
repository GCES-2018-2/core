# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`
$(document).ready(function () {
  $("input:radio").on('click', function() {
    var roomStatus = $(this).attr("value");

    $('tr').show()
    if (roomStatus === "active") {
      $('tr#inactive').hide()
    } else if (roomStatus === "inactive") {
      $('tr#active').hide()
    }
  });

  $('select#wing').on('change', function() {
    var selected_wing = $(this).val();
    var selected_building = $('select#building_id').find('option:selected');
    $('select#building_id').find('option').removeClass('hide');
    if ( selected_wing != '' ) {
      $('select#building_id').find('option').not('option[data-wing="' + selected_wing + '"]').addClass('hide');
    }
    if ( selected_building.attr('data-wing') != selected_wing && selected_wing != '') {
      $('select#building_id').val('');
    }
  });

  $('select#campus_id').on('change', function() {
    var selected_campus = $(this).find('option:selected').text();
    var selected_department = $('select#department_id').find('option:selected');
    $('select#department_id').find('option').removeClass('hide');
    if ( selected_campus != '' ) {
      $('select#department_id').find('option').not('option[data-campus="' + selected_campus + '"]').addClass('hide');
    }
    if ( selected_department.attr('data-campus') != selected_campus && selected_campus != '') {
      $('select#department_id').val('');
    }
  });
})
`