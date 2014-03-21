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
      data: form_content,
      // dataType: "json"

    }).done(function(server_content){

      console.log('done')
      console.log('server_content: ' + server_content)
      // hide survey form
      $('#new-survey').hide()
      // show survey name
      $('#title').append(server_content.name)
      var surveyId = server_content.id
      console.log(surveyId)
      $('#survey_id_for_question').val(surveyId)
      // debugger
      // show question form:
      $('#new-question').show()


    }).fail(function(){
      console.log('fail')
    })

  })


    // intercept the form submission event using jQuery:
  $('#new-question').on('submit', function(e){
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
      // hide question form, show choice form
      $('#new-question').hide()
      $('#new-choice').show()
      // show new question
      $('#questions').append('<li>' + server_content.question + '</li>')
      var questionId = server_content.id
      console.log(questionId)
      $('#question_id_for_choice').val(questionId)
      // show add choice button
      console.log('done')
      console.log('server_content: ' + server_content)

    }).fail(function(){
      console.log('fail')
    })

  })


    // intercept the form submission event using jQuery:
  $('#new-choice').on('submit', function(e){
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
      // show? hide?

      // show new choice
      $('#choices').append('<li>' + server_content.choice + '</li>')

      // show add choice button
      console.log('done')
      console.log('server_content: ' + server_content)

    }).fail(function(){
      console.log('fail')
    })

  })


});
