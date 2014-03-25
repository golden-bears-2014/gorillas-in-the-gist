#CR Explore Factory Girl to create users that are available here.

require 'spec_helper'

describe 'UserController' do

  describe 'user can access application home page: ' do
    it 'loads the index page' do
      get "/"
      expect(last_response).to be_ok
    end
  end

  describe 'user can sign in: ' do
    let(:signin_user){ User.create( name: 'Fake user',
                                     email: 'fake@fake.com',
                                     password: '123456') }

    it 'loads the sign in form' do
      get '/sessions/new'
      expect(last_response.body).to include('Login')
    end

    it 'authenticates a current user' do
      pending
    end

    it 'redirect signed-in user to Surveys page' do
      pending
    end
  end

  describe 'user can sign up: ' do
  let(:new_user){ User.create(name: 'my pretty name',
                              email: 'pretty_email@pretty.com',
                              password: 'abcd1234') }

    it 'creates a new session email variable equal to current user email' do
      user_params = { email: 'pretty_email@pretty.com',
                      password: 'abcd1234' }
      post('/sessions', user_params)
      expect(session[:email]).to eq(user_params[:email])
    end

    it 'creates a new session id variable equal to current user id' do
      user_params = { email: 'pretty_email@pretty.com',
                      password: 'abcd1234' }
      current_user = User.find_by_email(user_params[:email])
      post('/sessions', user_params)
      expect(session[:id]).to eq(current_user[:id])
    end

    it 'saves the new user to database' do

      expect(User.last.email).to eq('pretty_email@pretty.com')
    end

    it 'redirects signed-up user to surveys page' do
      pending
    end
  end

  describe 'user can sign out: ' do
    it 'ends the current session' do
      delete '/sessions'
      expect(session).to be_empty
    end
  end


  describe 'user has a profile page: ' do
    it 'allows the current user to see her profile page' do
      new_user = User.create(name: 'my pretty name',
                             email: 'pretty_email@pretty.com',
                             password: 'abcd1234')
      current_user = User.find_by_email(new_user[:email])
      user_params = { email: current_user.email,
                      password: current_user.password }
      post('/sessions', user_params )
      get "/users/#{session[:id]}"
      expect(last_response.body).to include('my pretty name')
    end
  end
end
