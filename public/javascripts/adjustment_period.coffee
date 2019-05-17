# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`
$(document).ready(function(){

  if($('#adjustment-period-solicitation').length > 0 || $('#allocation-period-solicitation').length > 0){
    buildScheduleTable();

    $(".hours_table").html(table);

    $("#departments-check input[type=checkbox]").change(function() {
      if ($(this).is(":checked")){
        ajaxReloadRooms($(this).val());
      } else {
        $("#rooms-list #department_rooms_" + $(this).val()).remove();
      }
    });

    $('table input[type=checkbox]').change(function () {
      $("#departments-check input[type=checkbox]").each(function(){
        if ($(this).is(":checked")){
          $("#rooms-list #department_rooms_" + $(this).val()).remove();
          ajaxReloadRooms($(this).val());
        }
      });
    });
  }

});

function buildScheduleTable() {
  table = "<tr>"
          + "<th></th>"
          + "<th>Segunda</th>"
          + "<th>Terça</th>"
          + "<th>Quarta</th>"
          + "<th>Quinta</th>"
          + "<th>Sexta</th>"
          + "<th>Sábado</th>"
        + "</tr>";

  week = ["segunda", "terca","quarta","quinta","sexta", "sabado"]

  period = '<%= @school_room.courses[0].shift %>';
  start_time = 6
  final_time = 23
  for (var row = start_time; row < final_time; row++) {
    table +="<tr>";
    table += "<td>" + row + ":00</td>";
    for (var col = 0; col < 6; col++) {
      table += "<td><input type='checkbox' name='" + week[col] + "[" + row + "]' value='1' /></td>";
    }
    table += "</tr>";
  }
}

function ajaxReloadRooms(department_id) {

  reservations = $(".hours_table input[type=checkbox]:checked").map(function() {
    return this.name;
  }).get()

  $.getJSON('../avaliable_rooms_by_department?department=' + department_id +
    '&school_room=' + $("#solicitation_school_room_id").val(),
    { allocations: reservations },
    { format: 'json'
  }).success(function(data){
    console.log(data);
    if (data.length > 0){
      listDepartmentRooms(department_id, data);
    }
  }).error(function(){
    alert("Falha no Processamento");
  });
}

function listDepartmentRooms(department_id, data) {
  var list = "<div id='department_rooms_" + department_id + "'>";

  list += "<h2>" + data[0][2].name + "</h2><table class='table'>";
  list += "<tr>" +
    "<th></th>" +
    "<th>Sala</th>" +
    "<th>Prédio</th>" +
    "<th>Ala</th>" +
    "<th>Capacidade</th>" +
    "<th>Recursos</th>" +
    "<th></th>" +
    "</tr>";
  for(var i = 0; i < data.length; i++) {
    var far = "near-room";
    if ($("#solicitation_wing").val() != data[i][1].wing) {
      console.log($("#solicitation_wing").val())
      far = "far-room";
    }

    list += "<tr class='" + far + "'><td><input type='checkbox' name='rooms[]' value='" +
      data[i][0].id + "'></td>" +
      "<td>" + data[i][0].name + "</td>" +
      "<td>" + data[i][1].name + "</td>" +
      "<td>" + data[i][1].wing + "</td>" +
      "<td>" + data[i][0].capacity + "</td><td>";
      var broken = false;
      for(var j = 0; j < data[i][3].length; j++){
        list +=  data[i][3][j].name + "<br>";
      }
      list +=  "</td><td>";
      if(!containsCategory(data[i][3]))
        list += '<a href="#" data-toggle="tooltip" data-placement="top" title="Não possui todos os recursos"><span class="glyphicon glyphicon-exclamation-sign"></span></a>';
      list += "</td></tr>";
  }
  list += "</table></div>";
  $("#rooms-list").append(list);
}

function containsCategory(room_categories) {
  var categories = $("#school_room_ressources").html().trim().split('<br>');

  if(categories.length == 1 && categories[0] == "") {
    return true;
  }

  for(var j = 0; j < categories.length; j++){
    var exists = false;
    for (var i = 0; i < room_categories.length; i++) {
      if(categories[j].includes(room_categories[i].name)){
        console.log("existe " + room_categories[i].name + " " + categories[j]);
        exists = true;
        break;
      }
    }

    if(!exists) {
      return false;
    }

  }
  return true;
}
`
