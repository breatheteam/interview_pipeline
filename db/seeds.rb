user = User.create(password: 'password', email: 'user@gmail.com')

user.companies.create(name: 'Kitten.co')

q1 = user.questions.create(content: 'Do yall do purr reviews?')
q2 = user.questions.create(content: 'What is your lazy cat day policy?')
user.questions.create(content: 'Do you offer catnip for lunch?')

q1.create_answer(content: 'Yes, we often give cat toys too!')
q2.create_answer(content: 'Responsible, unlimited lazy days!')
