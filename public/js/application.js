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
  var newDiv = $('<div class="questionSet" id="'+this.id+'">')
  var inputField = $('<input class="questionField" type="text" name='+questionName+'>')
  var newChoiceLink = $('<a class="addChoice" href="#">Add choice</a>')
  newDiv.text("Question "+this.id+":")
  inputField.on('blur', blurQuestionFunction)
  // debugger
  $(newDiv).append(inputField).append(newChoiceLink)
  $('#questions').append(newDiv)
}

Choice.prototype.renderField = function() {
  choiceName = '"choice_'+this.questionId+'_'+this.id+'"'
  var newDiv = $('<div class="choice">')
  newDiv.text("Option "+this.id+":")
  var inputField = $('<input class="choiceField" type="text" name='+choiceName+'>')
  inputField.on('blur', blurChoiceFunction)
  $(newDiv).append(inputField)
  $('#'+this.questionId+'').append(newDiv)
}

Survey.prototype.saveSurvey = function() {
  $('form').on('submit', function(e) {
    e.preventDefault()
    console.log("hi katie")
    survey_content = JSON.stringify(thisSurvey)
    $.ajax({
      type: this.method,
      url: this.action,
      data: { survey: survey_content }
    }).success(function(server_data){
      var survey = JSON.parse(server_data)
      window.location = "/surveys/"+survey.id
      console.log("done!", server_data)
    }).fail(function(){
      console.log("fail!")
    })
  })
}


