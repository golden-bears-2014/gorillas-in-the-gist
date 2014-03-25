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
p "*"*80
p params
p params[:survey]
survey_data = JSON.parse(params[:survey])
p survey_data
survey = Survey.create(name: survey_data["name"])
# debugger
#CR make this a create method on the survey model
  survey_data["questions"].each do |question|
    this_question = Question.create(question: question["question"])
    question["choices"].each do |choice|
      new_choice = Choice.create(choice: choice["choice"])
      this_question.choices << new_choice
    end
    survey.questions << this_question
  end
current_user = User.find(1)  #CR Is this a hack because current_user wasn't working? Use current_user

# current_user = User.find(session[:id])
current_user.surveys << survey
{id: survey.id}.to_json  #CR add content-type: json to set the response content type
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
  #CR use includes to avoid n+1 database hits

  @survey = Survey.includes([:questions, {:choices => :responses}]).find(params[:id])
#   @responses = @survey.choices.includes(:responses).all
# @showring = Ring.includes([{:stones => :upcharges}, :variations]).find(params[:id])
  p @survey.inspect
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
