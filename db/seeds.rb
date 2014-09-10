puts "*** Creating Users ***"
nicola = User.create(firstname: 'Nicola', lastname: 'Aitken', email: 'naitken22@gmail.com', password: '12345678', password_confirmation: '12345678')
joe = User.create(firstname: 'Joe', lastname: 'Dowdell', email: 'joedowdell@gmail.com', password: '12345678', password_confirmation: '12345678')
toan = User.create(firstname: 'Toan', lastname: 'Nguyen', email: 'toan@graduate.uwa.edu.au', password: '12345678', password_confirmation: '12345678')

puts "*** Creating Events ***"
