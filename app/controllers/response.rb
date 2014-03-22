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