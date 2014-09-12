puts "*" * 80
puts "Seeding Data for Challenge.Me"
puts "*" * 80

def random_date from, to = Time.now
  Time.at(from.to_time + rand * (to.to_f - from.to_time.to_f)).to_date
end

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

avatars = %w{joe-bloggs.jpg boot_strap.gif user.jpg}
puts "*** Creating Users ***"
nicola = User.create(firstname: 'Nicola', lastname: 'Aitken', email: 'pmaitken@challengeme.com', password: '12345678', password_confirmation: '12345678', avatar: File.new(Rails.root.join 'spec/images/' + avatars.sample))
toan = User.create(firstname: 'Toan', lastname: 'Nguyen', email: 'toan@graduate.uwa.edu.au', password: '12345678', password_confirmation: '12345678', avatar: File.new(Rails.root.join 'spec/images/' + avatars.sample))
joe = User.create(firstname: 'Joe', lastname: 'Bloggs', email: 'joe@bloggs.com', password: '12345678', password_confirmation: '12345678', avatar: File.new(Rails.root.join 'spec/images/' + avatars.sample))
users = [nicola, toan, joe]

puts "*** Creating Events ***"
ldn_marathon = nicola.events.create!(name: "Virgin London Marathon 2015", event_date: Date.new(2015,6,26), charity: "Oxfam", target: 1000, amount_raised: 650, training: 4, created_at: Date.new(2014,9,9), jg_event_id: 747222, jg_short_name: "pmaitkenmarathon", jg_page_id: 3704495)
eating_baked_beans = toan.events.create!(name: "Eating Baked Beans", event_date: Date.new(2014,9,29), charity: "Cancer Research UK", target: 10000, amount_raised: 3050, training: 3, created_at: Date.new(2014,9,7), jg_event_id: 746817, jg_short_name: "eating-baked-beans", jg_page_id: 3703890)
xmas_marathon = joe.events.create!(name: "Christmas Marathon 2014", event_date: Date.new(2014,12,25), charity: "Oxfam", target: 10000, amount_raised: 0, training: 3, created_at: Date.new(2014,9,7), jg_event_id: 747216, jg_short_name: "joe-marathon", jg_page_id: 3704489)

events = [ldn_marathon, eating_baked_beans, xmas_marathon]
captions = %w{Great Awesome Super Suffering? Lol}
text = ['keep up the good work', 'your not suffering enough', 'work harder', 'your mum will be so proud']
puts "*** Creating Text Posts ***"
30.times do
  event = events.sample
  posts << Post.create(caption: captions.sample, text: text.sample, event_id: event.id, user_id: users.sample.id, created_at: random_date(event.created_at))
end

videos = ['https://www.youtube.com/watch?v=ygKF_AABE6k', 'https://www.youtube.com/watch?v=b69Y7pmQdus', 'https://www.youtube.com/watch?v=TQK7qtTifZc', 'https://www.youtube.com/watch?v=69u0qD0LXzQ']
puts "*** Creating Video Posts ***"
posts << nicola.posts.create(event_id: ldn_marathon.id, caption: 'Did the ice bucket challenge, pay up!', video: 'https://www.youtube.com/watch?v=04IsFIQEZBQ')
10.times do
  event = events.sample
  posts << Post.create(caption: captions.sample, video: videos.sample, event_id: events.sample.id, user_id: users.sample.id, created_at: random_date(event.created_at))  
end

pictures = %w{feet_ice.jpg knee_injury.jpg outdoor.jpg run.jpg swim.jpg}
puts "*** Creating Picture Posts ***"
10.times do
  event = events.sample
  posts << Post.create(caption: captions.sample, picture: File.new(Rails.root.join 'spec/images/' + pictures.sample), event_id: events.sample.id, user_id: users.sample.id, created_at: random_date(event.created_at))
end

puts "*** Creating Workouts ***"
ldn_marathon.trainingsessions.create(details: 'Super tiring Victoria Park run', sessiondate: Date.new(2014,9,11), mmf_updated_datetime: '2014-09-11T16:19:53+00:00', mmf_route_id: '493345624')
ldn_marathon.trainingsessions.create(details: 'My awesome regents park run', sessiondate: Date.new(2014,9,11), mmf_updated_datetime: '2014-09-11T16:10:12+00:00', mmf_route_id: '528534580')

3.times do
  Trainingsession.create(event_id: events.sample.id, details: 'My awesome regents park run', sessiondate: Date.new(2014,9,11), mmf_updated_datetime: '2014-09-11T16:10:12+00:00', mmf_route_id: '528534580')
end


comments = ['Great!!! thats awesome', 'This looks fake', 'Keep up the good work', 'Yahoooooooo, keep on going']
puts "*** Creating Comments***"
100.times do
  Comment.create(comments: comments.sample, post_id: posts.sample.id, user_id: users.sample.id)
end

challengers = %w{Roi Enrique Steve Alex Mihai}
challenge_names = ['Eat a ghost chilli', 'Do the Ice Bucket Challenge', 'Run in a wet suit', 'Run in a chicken suit']
puts "*** Creating Challenges ***"
10.times do
  Challenge.create(creator: challengers.sample, event_id: events.sample.id, amount: (rand*100).round, name: challenge_names.sample)
end