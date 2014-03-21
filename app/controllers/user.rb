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
  session[:id] = nil
  redirect '/'
end

post '/users' do
  create_user(params)
  session[:login] =true
  redirect '/surveys'
end

get '/users/:id' do
 @user = current_user
 # p "@@@@@@@@@@@@@@@@@@@@@@@@@"
 # p @user.name
 # p "@@@@@@@@@@@@@@@@@@@@@@@@@"
 if @user
   if @user.id == session[:id]
    @surveys = Survey.where(user_id: @user.id)
    p "@@@@@@@@@@@@@@@@@@@@@@@@@"
    erb :user_profile#, :layout => :layout
  end
 else
   erb :_login
  end
end