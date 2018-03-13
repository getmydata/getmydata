// function bulletNavigation() {
//     console.log("Hoi")
//     if($('#bullet-navigation').offset().top + $('#bullet-navigation').height()
//                                            >= $('#section-1').offset().top + 110)
//         $('#bullet-navigation').css('z-index', '1');

//     if($(document).scrollTop() + window.innerHeight < $('#section-1').offset().top + 110)
//         $('#bullet-navigation').css('z-index', '-5'); // restore when you scroll up

// }
// $(document).scroll(function() {
//     bulletNavigation();
// });

// // $.fn.isOnScreen = function(){

// //     var win = $(window);

// //     var viewport = {
// //         top : win.scrollTop(),
// //         left : win.scrollLeft()
// //     };
// //     viewport.right = viewport.left + win.width();
// //     viewport.bottom = viewport.top + win.height();

// //     var bounds = this.offset();
// //     bounds.right = bounds.left + this.outerWidth();
// //     bounds.bottom = bounds.top + this.outerHeight();

// //     return (!(viewport.right < bounds.left || viewport.left > bounds.right || viewport.bottom < bounds.top || viewport.top > bounds.bottom));

// // };

// // $('body').click(function(){
// //     alert($('#anchor-1').isOnScreen());
// // });

// // if($('#anchor-1').isOnScreen()) {
// //   alert("Anchor-1 on screen")
// // }
