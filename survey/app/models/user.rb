class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys
  has_many :responses
  has_many :completions
  validates :email, uniqueness: true, on: :create
  validates :name, presence: true
  validates :password, length: {minimum : 10}

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
