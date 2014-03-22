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
  "*"*80
  puts "I made it to the controller"
  p params
  "*"*80
  # new_survey = Survey.create(params)
  # content_type :json
  # {id: new_survey.id, name: new_survey.name}.to_json
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