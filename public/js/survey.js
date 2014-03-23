$(document).ready(function(){
  thisSurvey = new Survey
  $('#surveyName').on('blur', function(){ thisSurvey.name = this.value })
  $('#addQuestion').on('click', thisSurvey.addQuestion.bind(thisSurvey))
  thisSurvey.saveSurvey()
 })

function blurQuestionFunction(){
  var qName = this.name.split("_")
  var qId = parseInt(qName.pop())
  var theQuestion = thisSurvey.questions[qId-1]
  if (this.value){ theQuestion.question = this.value }
}

function blurChoiceFunction(){
  var cName = this.name.split("_")
  var qId = parseInt(cName[1])
  var cId = parseInt(cName[2])
  var theChoice = thisSurvey.questions[qId-1].choices[cId-1]
  if (this.value){ theChoice.choice = this.value }
}

function Survey() {
  this.id = 1 //arbitrary
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
  var choiceIndex = this.choices.length + 1
  var choice = new Choice(this.id, choiceIndex)
  this.choices.push(choice)
  choice.renderField()
}

var Choice = function(questionId,choiceIndex) {
    this.questionId = questionId
    this.id = choiceIndex
    this.choice = undefined
}

Question.prototype.renderField = function(){
  questionName = '"question_'+this.id+'"'
  var newDiv = $('<div id="'+this.id+'">')
  var inputField = $('<input class="questionField" type="text" name='+questionName+'>')
  var newChoiceLink = $('<a class="addChoice" href="#">Add choice</a>')
  inputField.on('blur', blurQuestionFunction)
  $(newDiv).append(inputField).append(newChoiceLink)
  $('#questions').append(newDiv)
}

Choice.prototype.renderField = function() {
  choiceName = '"choice_'+this.questionId+'_'+this.id+'"'
  var newDiv = $('<div>')
  var inputField = $('<input class="choiceField" type="text" name='+choiceName+'>')
  inputField.on('blur', blurChoiceFunction)
  $(newDiv).append(inputField)
  $('#'+this.questionId+'').append(newDiv)
}

Survey.prototype.saveSurvey = function() {
  $('form').on('submit', function(e) {
    e.preventDefault()
    survey_content = JSON.stringify(thisSurvey)
    debugger
    $.ajax({
      type: this.method,
      url: this.action,
      data: { survey: survey_content }
    }).done(function(){
      console.log("done!")
    }).fail(function(){
      console.log("fail!")
    })
  })
}


