$(document).ready(function () {
  $(".reports_allocation, .reports_no_all").hide();

  $(".all_reports_school_room, .allocations_reports_school_room, .no_all_reports_school_room").click(function () {
    $(".reports_allocation").hide();
    $(".reports_no_all").hide();
    $(".reports_all").hide();
    var clickedElement = $(this);

    if (clickedElement.hasClass('all_reports_school_room')) {
      $(".reports_all").show();
    } else if (clickedElement.hasClass('allocations_reports_school_room')) {
      $(".reports_allocation").show();      
    } else {
      $(".reports_no_all").show();
    }
  });
});