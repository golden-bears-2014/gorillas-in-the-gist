#CR use a before filter to protect from non logged in users

# before /^?\/(sessions\/*|\/) / do
#  erb :login unless current_user
# end

#create sessions as soon as the user logs in or signs up
get '/sessions/new' do
erb :_login
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  #CR if @user.password== params[:password]
  session[:email] = @user.email  #CR no need to set this in a session, you can refind it from the id
  session[:id] = @user.id
    p "[LOG] session id #{session[:id]}" #CR you are not checking for a valid user and giving error if not valid.
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
  #CR at current version ajax on 'form' is sending the wrong data here.
  create_user(params)
  session[:login] =true  #CR later you look for session[:id] which isn't set here.
  redirect '/surveys'
end

get '/users/:id' do

if current_user.id == params[:id]  #CR this will protect the profile
 # @user = current_user
 # if @user
   # if @user.id == session[:id] #CR how could this not be true?
    @surveys = Survey.where(user_id: @user.id)
    @surveys_taken = Completion.where(user_id: @user.id)
    erb :user_profile#, :layout => :layout
  end
 else
   erb :_login
  end
end
