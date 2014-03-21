helpers do
  # include BCrypt
  def current_user
    @current_user = User.find_by_email(session[:email])
  end

  def create_user(params)
    @user = User.create(params)
    @user.password = params[:password]
    @user.save
  end

end