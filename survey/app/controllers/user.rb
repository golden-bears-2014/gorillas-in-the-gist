#create sessions as soon as the user logs in or signs up
get '/sessions/new' do
erb :_login
end

post '/sessions' do
  session[:email] = User.email
  session[:id] = User.id
end

delete '/sessions' do
  session[:id] = nil
end

post '/users' do
  create_user(params)
  session[:login] =true
  redirect '/surveys'
end

get '/users/:id' do

end