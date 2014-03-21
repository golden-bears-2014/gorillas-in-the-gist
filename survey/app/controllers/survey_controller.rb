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
  content_type :json
  {id: new_survey.id, name: new_survey.name}.to_json
end

# create new question
post '/questions' do
  new_question = Question.create(params)
  content_type :json
  {id: new_question.id, question: new_question.question}.to_json
end

# create new choice
post '/choices' do
  new_choice = Choice.create(params)
  content_type :json
  {id: new_choice.id, choice: new_choice.choice}.to_json
end