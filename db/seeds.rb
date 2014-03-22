require 'faker'

user = User.new(name: Faker::Name.name, email: Faker::Internet.email)
user.password = "password"
user.save!

survey_names = ["Women in tech"]

10.times do
survey_names.each do |survey|
   s = Survey.create(name: Faker::Company.catch_phrase)
  end
end