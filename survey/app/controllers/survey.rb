# all the surveys listed
get '/surveys' do
  @surveys = Survey.all
  erb :surveys
end

# new survey form
get '/surveys/new' do
  erb :new_survey
end
# post create the survey
post '/surveys' do
  "*"*80
  puts "I made it to the controller"
  puts params
  "*"*80

  new_survey = Survey.create(params)
  "#{new_survey.name}"
end

# create new question
post '/questions' do
  new_question = Question.create(params[question])
  "#{new_question.id}"
end

# create new choice
post '/choices' do
  new_choice = Choice.create(params[choice])
  "#{new_choice.id}"
end