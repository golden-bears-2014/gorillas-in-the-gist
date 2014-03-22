# display survey to take
get '/surveys/:id/?' do
  @survey = Survey.find(params[:id])
  erb :show_survey
end

# add completion to database
post '/completions/?' do
  new_completion = Completion.create!(params)
  content_type :json
  {id: new_completion.id, user_id: new_completion.user_id, survey_id: new_completion.survey_id}.to_json
end

# add response to database
post '/responses/?' do
  new_response = Response.create!(params)
  content_type :json
  {id: new_response.id, user_id: new_response.user_id, choice_id: new_response.choice_id}.to_json
end