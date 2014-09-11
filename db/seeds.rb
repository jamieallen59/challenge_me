puts "*" * 80
piuts "Seeding Data for Challenge.Me"
puts "*" * 80

puts "*** Creating Users ***"
nicola = User.create(firstname: 'Nicola', lastname: 'Aitken', email: 'pmaitken@challengeme.com', password: '12345678', password_confirmation: '12345678')
toan = User.create(firstname: 'Toan', lastname: 'Nguyen', email: 'toan@graduate.uwa.edu.au', password: '12345678', password_confirmation: '12345678')

puts "*** Creating Events ***"
ldn_marathon = nicola.events.create(name: "Virgin London Marathon 2015", event_date: Date.new(2015,06,26), charity: "Oxfam", target: 1000, amount_raised: 650, created_at: Date.new(2014,9,9),jg_event_id: 747222, jg_short_name: "pmaitkenmarathon", jg_page_id: 3704495)

puts "*** Creating Text Posts ***"

puts "*** Creating Video Posts ***"
# https://www.youtube.com/watch?v=04IsFIQEZBQ

puts "*** Creating Picture Posts ***"

puts "*** Creating Workouts ***"

| id | details                   | event_id | created_at              | updated_at              | sessiondate | mmf_updated_datetime      | mmf_route_id |
+----+---------------------------+----------+-------------------------+-------------------------+-------------+---------------------------+--------------+
| 35 | Super tiring Victoria ... | 10       | 2014-09-11 16:23:38 UTC | 2014-09-11 16:23:38 UTC | 2014-09-11  | 2014-09-11T16:19:53+00:00 | 493345624    |
| 36 | My awesome regents par... | 10       | 2014-09-11 16:23:38 UTC | 2014-09-11 16:23:38 UTC | 2014-09-11  | 2014-09-11T16:10:12+00:00 | 528534580    |
| 37 | Ran 5k                    | 10       | 2014-09-11 17:27:20 UTC | 2014-09-11 17:27:20 UTC | 2014-09-11  |                           |             
