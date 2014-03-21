class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :responses
  has_many :completions
end
