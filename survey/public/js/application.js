$(document).ready(function () {
    $('#new-question').hide()
    $('#new-choice').hide()
    // intercept the form submission event using jQuery:
  $('#new-survey').on('submit', function(e){
    // prevent the default action for that event from happening:
    e.preventDefault()
    // serialize the form's key-value pairs
    form_content = $(this).serialize()
    // use jQuery to submit an AJAX post to the form's action:
    $.ajax({
      type: this.method,
      url: this.action,
      data: form_content

    }).done(function(server_content){
      // hide survey form
      $('#new-survey').hide()
      // show survey name
      $('#title').append(server_content)
      // show question form:
      $('#new-question').show()
      console.log('done')
      console.log('server_content: ' + server_content)

    }).fail(function(){
      console.log('fail')
    })

  })


  //   // intercept the form submission event using jQuery:
  // $('#new-question').on('submit', function(e){
  //   // prevent the default action for that event from happening:
  //   e.preventDefault()
  //   // serialize the form's key-value pairs
  //   form_content = $(this).serialize()
  //   // use jQuery to submit an AJAX post to the form's action:
  //   $.ajax({
  //     type: this.method,
  //     url: this.action,
  //     data: form_content

  //   }).done(function(server_content){
  //     // hide question form
  //     // show new question
  //     // show add choice button
  //     console.log('done')
  //     console.log('server_content: ' + server_content)

  //   }).fail(function(){
  //     console.log('fail')
  //   })

  // })


  //   // intercept the form submission event using jQuery:
  // $('#new-choice').on('submit', function(e){
  //   // prevent the default action for that event from happening:
  //   e.preventDefault()
  //   // serialize the form's key-value pairs
  //   form_content = $(this).serialize()
  //   // use jQuery to submit an AJAX post to the form's action:
  //   $.ajax({
  //     type: this.method,
  //     url: this.action,
  //     data: form_content

  //   }).done(function(server_content){
  //     // hide question form
  //     // show new question
  //     // show add choice button
  //     console.log('done')
  //     console.log('server_content: ' + server_content)

  //   }).fail(function(){
  //     console.log('fail')
  //   })

  // })


});
