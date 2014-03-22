$(document).ready(function(){
  thisSurvey = new Survey
  $('#addQuestion').on('click', function(){thisSurvey.addQuestion()})
  thisSurvey.saveSurvey()

 })

function Survey() {
  this.id = 1 //this is arbitrary, but necessary
  this.questions = []
  this.name = "undefined"
}

Survey.prototype.addQuestion = function(){
  var questionIndex = this.questions.length + 1
  var question = new Question(this.id, questionIndex)
  this.questions.push(question)
  question.renderField()
  question.bindChoiceButton()
}

var Question = function(surveyId,questionIndex) {
  this.surveyId = surveyId
  this.id =  questionIndex
  this.choices = []
  this.question = undefined
}

Question.prototype.bindChoiceButton = function(){
  question = this
  $('.addChoice').on('click', function(){ question.addChoice()})
}

Question.prototype.addChoice = function(){
  var choice = new Choice(this.id)
  this.choices.push(choice)
  choice.renderField()
}

var Choice = function(questionId) {
    this.questionId = questionId
    this.choice = undefined
}

Question.prototype.renderField = function(){
  $('#questions').append('<div id="'+this.id+'" class="question">Question: <input type="text" name="question_'+this.id+'"><a class="addChoice" href="#">Add choice</a></div>')
}

Choice.prototype.renderField = function() {
  $('#'+this.questionId+'').append('<div class="choice">Choice: <input type="text" name="choice_'+this.questionId+'"></div>')
}

Survey.prototype.saveSurvey = function() {
  $('form').on('submit', function(e) {
    e.preventDefault()
    console.log("hi katie")
    survey_content = $(this).serialize()
// survey_content looks like this: "name=test&question_1=one&choice_1=c1&choice_1=c2&choice_1=c3"
// need name[survey_content]
    debugger
    $.ajax({
      type: this.method,
      url: this.action,
      data: survey_content
      // debugger
    }).done(function(){
      console.log("done!")
    }).fail(function(){
      console.log("fail!")
    })
  })
}

Survey.prototype.
    // }).done(function(){
    //   console.log("successfully sent!")
    //   )}.fail(function(){
    //     console.log("failed to send!")
    //   })
    // })

    // debugger

