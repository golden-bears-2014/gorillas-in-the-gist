get '/' do
  erb :index
end

# all the surveys listed
get '/surveys' do
  @surveys = Survey.all
  erb :surveys
end

get '/surveys/new' do
  erb :new_survey
end

post '/surveys' do
# debugger
survey_data = JSON.parse(params[:survey])


survey = Survey.create(name: survey_data["name"])
# debugger
survey_data["questions"].each do |question|
  this_question = Question.create(question: question["question"])
  question["choices"].each do |choice|
    new_choice = Choice.create(choice: choice["choice"])
    this_question.choices << new_choice
  end
  survey.questions << this_question
end
current_user = User.find(1)
# current_user = User.find(session[:id])
current_user.surveys << survey
"hi katie"
# {id: survey.id, name: survey.name}.to_json
end

# display survey to take
get '/surveys/:id/?' do
  # if session[:id] == nil
  #   redirect '/'
  # else
    @survey = Survey.find(params[:id])
    erb :show_survey
  # end
end

# display all results for particular survey
get '/results/:id?' do
  @survey = Survey.find(params[:id])
  erb :show_results
end

# add completion to database
post '/completions/?' do
  Completion.create!(params)
  "completion route hit"
end

# add response to database
post '/responses/?' do
  Response.create!(params)
  "response route hit"
end