require 'spec_helper'

describe "UserController" do

  describe 'user can access home page' do
    it 'should check the apps availability ' do
      get "/"
      expect(last_response).to be_ok
    end
  end

  describe 'user can sign_up' do
     let(:new_user){User.create(name: "my pretty name", email: "pretty_email@pretty.com", password_hash: "abcd1234")}
      it 'should save the user to database' do

    end
  end
end