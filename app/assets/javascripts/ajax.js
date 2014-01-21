

$(function(){

  // $('body').on('mousemove', function(e){
  //   console.log(e.pageY)
  //   console.log(e.pageX)
  // })

  console.log('loaded');
   $('[data-like-button="delete"]').on('submit', function(event) {
    //event.preventDefault();

    $form = $(event.currentTarget);
    console.log(event);
    console.log('hater in the house!');
  });

   $('[data-like-button="create"]').on('submit', function(event) {
    event.preventDefault();

    $form = $(event.currentTarget);

    $.ajax({
      type: "POST",
      url: $form.attr('action'),
      dataType: "json",

      success: function(data) {
        $form.fadeOut(2000);
      },
      failure: function(data) {
        console.log(data);
      }
    });
  });
});
