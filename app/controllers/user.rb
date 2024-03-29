#create sessions as soon as the user logs in or signs up
get '/sessions/new' do
erb :_login
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  session[:email] = @user.email
  session[:id] = @user.id
    p "[LOG] session id #{session[:id]}"
  redirect '/surveys'
end

delete '/sessions' do
  session.clear
  redirect '/'
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/users' do
  create_user(params)
  session[:login] =true
  redirect '/surveys'
end

get '/users/:id' do
 @user = current_user
 if @user
   if @user.id == session[:id]
    @surveys = Survey.where(user_id: @user.id)
    @surveys_taken = Completion.where(user_id: @user.id)
    erb :user_profile#, :layout => :layout
  end
 else
   erb :_login
  end
end