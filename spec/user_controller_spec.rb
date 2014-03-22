require 'spec_helper'

describe 'UserController' do

  describe 'user can access home page' do
    it 'loads the index page' do
      get "/"
      expect(last_response).to be_ok
    end
  end

  describe 'user can sign in' do
    let(:current_user){ User.create( name: 'Fake user',
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

  describe 'user can sign up' do
  let(:new_user){ User.create(name: 'my pretty name',
                              email: 'pretty_email@pretty.com',
                              password: 'abcd1234') }

    it 'saves the new user to database' do
      pending
      # expect{ post('/users', new_user)}.to change(User, :count).by(1)
    end

    it 'creates a new session email variable equal to current user email' do
      user_params = { email: 'pretty_email@pretty.com',
                      password: 'abcd1234' }

      post('/sessions', user_params)
      expect(session[:email]).to eq(user_params[:email])
    end

    it 'redirects to surveys page' do
      pending
    end
  end

  describe 'user can sign out' do
    it 'ends the current session' do
      get '/logout'
      expect(session).to be_empty
    end
  end
end
