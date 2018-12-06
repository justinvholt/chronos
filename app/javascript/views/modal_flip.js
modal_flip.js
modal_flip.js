// modal flip

function flip_dialog(message, html) {

 // fix backstyle
 $('.flip-container .back').height($('.flip-container .front').height());

 // scroll to top
 $(window).scrollTop(0)

 if(html)
    $('.flip-container .back p').html(message);
  else
    $('.flip-container .back p').text(message);


 // then flip that side
 $('.flip-container').addClass('hover');
 $('.flip-container .back button').click(function(){
     $('.flip-container').removeClass('hover');
  });

}

export { flip_dialog };
