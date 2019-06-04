# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`
# $(document).ready(function(){
#
#   if($('#new-allocation').length > 0) {
#     ajaxReloadTable();
#   }
#
#   $(".autofill-field").change(function() {
#     ajaxReloadTable();
#   });
#
#   $("#select-room").change(function() {
#     var weekdayIds = [
#       '#select-Segunda', '#select-Terça', '#select-Quarta',
#       '#select-Quinta', '#select-Sexta', '#select-Sábado'
#     ]
#
#     $.each(weekdayIds, function(index, weekdayId){
#       var weekDaySelector = $(weekdayId)
#
#       if(!weekDaySelector.hasClass("not-modify")) {
#         weekDaySelector.val($("#select-room").val())
#       }
#     })
#     ajaxReloadTable();
#   });

  function ajaxReloadTable() {
    $.getJSON('../room_allocations_by_day?Segunda=' + $("#select-Segunda").val() +
    '&Terça=' + $("#select-Terça").val()  +
    '&Quarta=' + $("#select-Quarta").val() +
    '&Quinta=' + $("#select-Quinta").val() +
    '&Sexta=' + $("#select-Sexta").val() +
    '&Sabado=' + $("#select-Sábado").val() +
    '&school_room=' + $("#school_room").val(), {
      format: 'json'
    }).success(function(data){
      generateTable(data);
    }).error(function(){
      alert("Há uma falha no processamento da Grade de Alocação");
    });
  }

  function generateTable(data) {
    var school_room = $("#school_room").val();
    var string = "";
    var day = ["", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"];
    var shift = data[0][1][5];
    var disabled;

    //linhas
    for(row = 0; row < 12; row += 2) {
      string += "<tr>"

      //colunas
      for(col = 0; col < 7; col++){

        //coluna 0 - coluna dos horarios
        if (col == 0){
          string += "<th>" + data[row][col] + "</th>";

        //coluna 1 ate a 7 checkbox dos dias da semana

        //se os dados do dia e horario estiverem vazios colocar o checkbox
        } else if (data[row][col][0] == " ") {

          string += '<td id="check_' + day[col] + "_" + (row + 6) + '">';

          if(disabled) {
            string += '<input type="checkbox" value="1" name="' + day[col] + '[' + (6 + row) + '][active]" disabled/>';

          } else {
            string += '<input type="checkbox" value="1" name="' + day[col] + '[' + (6 + row) + '][active]"/>';
          }
          string += '<input value="' + data[row][col][2] + '" type="hidden" name="' + day[col] + '[' + (6 + row) +'][room_id]" />' +
          '<input value="' + data[row][col][1] + '" type="hidden" name="' + day[col] + '[' + (6 + row) +'][school_room_id]" />' +
          '<input value="' + day[col] + '" type="hidden" name="' + day[col] + '[' + (6 + row) +'][day]" />' +
          '<input value="' + data[row][col][3] + '" type="hidden" name="' + day[col] + '[' + (6 + row) +'][start_time]" />' +
          '<input value="' + data[row][col][4] + '" type="hidden" name="' + day[col] + '[' + (6 + row) +'][final_time]" />' +
        '</td>';

        //se nao, colocar a programacao deste dia e horario
        } else {
          string += "<td>" + data[row][col][0] + "</td>";
        }
      }
      string += "</tr>";
    }

    $("#hours_table").html(string);
  }
})
`
