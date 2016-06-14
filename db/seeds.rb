user = User.create(password: 'password', email: 'user@gmail.com')

kitten_co = user.companies.create(name: 'Kitten.co')

q1 = user.questions.create(content: 'Do yall do purr reviews?')
q2 = user.questions.create(content: 'What is your lazy cat day policy?')
user.questions.create(content: 'Do you offer catnip for lunch?')

q1.create_answer(content: 'Yes, we often give cat toys too!',
                 company_id: kitten_co.id)
q2.create_answer(content: 'Responsible, unlimited lazy days!',
                 company_id: kitten_co.id)
