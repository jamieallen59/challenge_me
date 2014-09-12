puts "*" * 80
puts "Seeding Data for Challenge.Me"
puts "*" * 80

puts "*** Cleaning data ***"
User.destroy_all
Event.destroy_all
Post.destroy_all
Trainingsession.destroy_all
Challenge.destroy_all
Pledge.destroy_all
users = []
events = []
posts = []
pledges = []
workouts = []
challenges = []

puts "*** Creating Users ***"
nicola = User.create(firstname: 'Nicola', lastname: 'Aitken', email: 'pmaitken@challengeme.com', password: '12345678', password_confirmation: '12345678')
toan = User.create(firstname: 'Toan', lastname: 'Nguyen', email: 'toan@graduate.uwa.edu.au', password: '12345678', password_confirmation: '12345678')
users = [nicola, toan]

puts "*** Creating Events ***"
ldn_marathon = nicola.events.create(name: "Virgin London Marathon 2015", event_date: Date.new(2015,6,26), charity: "Oxfam", target: 1000, amount_raised: 650, created_at: Date.new(2014,9,9),jg_event_id: 747222, jg_short_name: "pmaitkenmarathon", jg_page_id: 3704495, training: 4)

events = [ldn_marathon]
puts "*** Creating Text Posts ***"

puts "*** Creating Video Posts ***"
ice_bucket_challenge = nicola.posts.create(event_id: ldn_marathon.id, caption: 'Did the ice bucket challenge, pay up!', video: 'https://www.youtube.com/watch?v=04IsFIQEZBQ')

puts "*** Creating Picture Posts ***"

puts "*** Creating Workouts ***"

ldn_marathon.trainingsessions.create(details: 'Super tiring Victoria Park run', sessiondate: Date.new(2014,9,11), mmf_updated_datetime: '2014-09-11T16:19:53+00:00', mmf_route_id: '493345624')
ldn_marathon.trainingsessions.create(details: 'My awesome regents park run', sessiondate: Date.new(2014,9,11), mmf_updated_datetime: '2014-09-11T16:10:12+00:00', mmf_route_id: '528534580')

