$(document).ready(function () {
  $('#finish').hide()
    // intercept the form submission event using jQuery:
  $('#submit').on('click', function(e){
    //response iteration
    $("form").each(function(e){
      // e.preventDefault() 
      // console.log('Form loop')
      // serialize the form's key-value pairs
      form_content = $(this).serialize()
      // use jQuery to submit an AJAX post to the form's action:
      $.ajax({
        type: this.method,
        url: this.action,
        data: form_content

      }).done(function(server_content){

        console.log('done, server_content: ' + server_content)
        if (server_content == "completion route hit"){
          $('#submit').hide()
          $('#start').hide()
          $('#responses').hide()
          $('#completion').hide()
          $('#finish').show()
        }

      }).fail(function(){
        console.log('fail')
      })


    })

  })

});