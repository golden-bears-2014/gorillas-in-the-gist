class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :completions
  has_many :questions
  has_many :choices, through: :questions
  #CR add validations to this and all models
end
