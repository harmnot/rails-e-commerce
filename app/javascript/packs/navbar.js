$(function() {

    var wins = $(this); //this = window
    if (wins.innerWidth() >= 991) {
        $("#test-here").css("display", 'none');
        $("#desktop").css("display", 'block')
    } else {
        $("#test-here").css("display", 'block');
        $("#desktop").css("display", 'none')
    }


    $(window).on('resize', function(){
        var win = $(this); //this = window
        if (win.innerWidth() >= 991) {
            $("#test-here").css("display", 'none');
            $("#desktop").css("display", 'block')
        } else {
            $("#test-here").css("display", 'block');
            $("#desktop").css("display", 'none')
        }
    });



    $("#m-click").click(function() {
        $("#mobile").css("width", "250px");
    })

    $("#close-nav").click(function() {
        $("#mobile").css("width", "0");
    })
});
