helpers do
  # include BCrypt
  def current_user
    #CR add if session[:id] to keep from crashing if no user
    # @current_user ||= User.find_by_id(session[:id]) if session[:id]

    @current_user = User.find_by_id(session[:id])
  end

#CR this should go on user model, not in the helpers
  def create_user(params)
    @user = User.create(params)
    @user.password = params[:password]
    @user.save!
  end

end
