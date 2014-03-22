require 'faker'

# user = User.new(name: Faker::Name.name, email: Faker::Internet.email)
# user.password = "password"
# user.save!

# survey_names = ["Women in tech"]
# survey_questions =["what do you think","Why do you think"]
# survey_choices = ["yes","no","acceptable"]

# 10.times do
# survey_names.each do |survey|
#    s = Survey.create(name: Faker::Company.catch_phrase)
#   end
# survey_questions.each do |survey|
#   q = Question.create(question: Faker::Company.catch_phrase)
#  end
# end

user1 = User.create(name: "Namrata",email: "n@n.com", password: "123456")
user2 = User.create(name: "Bob", email: "b@b.com", password: "0987654")
user3 = User.create(name: "Pam", email: "p@p.com",password: "1234567")

survey1 = Survey.create(name: "How much is coding important")
survey2 = Survey.create(name: "Women in tech")
survey3 = Survey.create(name: "DBC")

user1.surveys << survey1
user2.surveys << survey2
user3.surveys << survey3

question1 = Question.create(question: "How???")
question2 = Question.create(question: "Why???")
question3 = Question.create(question: "When???")

survey1.questions << question1
survey2.questions << question2
survey3.questions << question3

choice1 = Choice.create(choice: "Yes")
choice2 = Choice.create(choice: "No")
choice3 = Choice.create(choice: "Maybe")

choice4 = Choice.create(choice: "Yes")
choice5 = Choice.create(choice: "No")
choice6 = Choice.create(choice: "Maybe")

choice7 = Choice.create(choice: "Yes")
choice8 = Choice.create(choice: "No")
choice9 = Choice.create(choice: "Maybe")

question1.choices << choice1
question1.choices << choice2
question1.choices << choice3

question2.choices << choice4
question2.choices << choice5
question2.choices << choice6

question3.choices << choice7
question3.choices << choice8
question3.choices << choice9

