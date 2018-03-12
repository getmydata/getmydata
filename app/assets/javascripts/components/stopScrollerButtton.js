function checkOffsetLeft() {
    if($('#stickybutton-left').offset().top + $('#stickybutton-left').height()
                                           >= $('#footer').offset().top - 10)
        $('#stickybutton-left').css('position', 'absolute');
    if($(document).scrollTop() + window.innerHeight < $('#footer').offset().top)
        $('#stickybutton-left').css('position', 'fixed'); // restore when you scroll up

}
$(document).scroll(function() {
    checkOffsetLeft();
});

function checkOffsetRight() {
    if($('#stickybutton-right').offset().top + $('#stickybutton-right').height()
                                           >= $('#footer').offset().top - 10)
        $('#stickybutton-right').css('position', 'absolute');
    if($(document).scrollTop() + window.innerHeight < $('#footer').offset().top)
        $('#stickybutton-right').css('position', 'fixed'); // restore when you scroll up
}
$(document).scroll(function() {
    checkOffsetRight();
});

function checkOffset() {
    if($('#social-float').offset().top + $('#social-float').height()
                                           >= $('#footer').offset().top - 10)
        $('#social-float').css('position', 'absolute');
    if($(document).scrollTop() + window.innerHeight < $('#footer').offset().top)
        $('#social-float').css('position', 'fixed'); // restore when you scroll up
    $('#social-float').text($(document).scrollTop() + window.innerHeight);
}
$(document).scroll(function() {
    checkOffset();
});

