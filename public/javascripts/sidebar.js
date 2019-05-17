function addDropdownEvent(id) {
    $(id).click(function() {
        var itemList = $(id)
        var caretIcon = itemList.find("a").children("i")
        var subItemList = itemList.find("ul")

        itemList.toggleClass("active")

        console.log(subItemList.css("display"))
        if (subItemList.css("display") === "block") {
        caretIcon.removeClass('fa-caret-up')
        caretIcon.addClass('fa-caret-down')
        subItemList.css("display", "none")
        } else {
        caretIcon.removeClass('fa-caret-down')
        caretIcon.addClass('fa-caret-up')
        subItemList.css("display", "block")
        }

    });
}

$(".menu-hamburguer").click(function() {
    if ($(".nav-sidebar").css("display") === "flex") {
    $(".nav-sidebar").css("display", "none")
    $(".main-container").css("margin-left", "0px")
    } else {
    $(".nav-sidebar").css("display", "flex")
    $(".main-container").css("margin-left", "240px")
    }
});

// Função responsável por Sumir / Aparecer sidebar
function hideSidebar() {
    document.getElementById("sidebarComponent").classList.toggle('active');
}
