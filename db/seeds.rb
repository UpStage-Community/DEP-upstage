# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Users
tom = User.create(name: 'Tom Thomas', uid: 1, provider: 'Twitter', handle: 'tomtommy', image_url: 'http://pbs.twimg.com/profile_images/571449380277858305/fRy5FPwP_normal.jpeg', bio: 'I love the theatre, but I hate actors')
kate = User.create(name: 'Kate Kittens', uid: 2, provider: 'Twitter', handle: 'kitKate', image_url: 'http://pbs.twimg.com/profile_images/571449380277858305/fRy5FPwP_normal.jpeg', bio: "I'm a failed actress, so I like to criticize what I can't do myself.")

# companies
tiger = tom.companies.create(name: "Tiger Productions", phone: '9097938718', email: 'tiger@used.com', url: 'tigerprod.com', short_description: 'This company makes shows that bite', long_description: 'This company makes shows that engage the audience in ways that leave them bleeding for more!')
dolphin = kate.companies.create(name: "Dolphin Productions", phone: '9097938718', email: 'dolphin@used.com', url: 'dolphinprod.com', short_description: 'This company makes playful kids shows', long_description: 'This company makes shows that are fun for the whole family, even your aquatic ones!')

# productions
python = tiger.productions.create(title: "Python", description: 'This play is about pythons', price_range: '$12 - 20', ticket_url: 'tickets.com')
cobra = tiger.productions.create(title: "Cobra", description: 'This play is about cobras', price_range: '$14 - 22', ticket_url: 'tickets.com')
zebra = dolphin.productions.create(title: 'Zebra', description: 'This play is about zebras', price_range: '$15 - 30', ticket_url: 'brown.com')

# performances
p = python.performances.create(date: DateTime.new(2015,10,15,20))
python.performances.create(date: DateTime.new(2015,10,16,20))
python.performances.create(date: DateTime.new(2015,10,17,14,30))

c = cobra.performances.create(date: DateTime.new(2015,10,10,19,30))

z = zebra.performances.create(date: DateTime.new(2015,11,15,19,30))
zebra.performances.create(date: DateTime.new(2015,11,16,19,30))
zebra.performances.create(date: DateTime.new(2015,11,17,13,30))
zebra.performances.create(date: DateTime.new(2015,11,17,19,30))

# ratings
tomrate = tom.ratings.create(performance_id: z.id, value: 4)
katerate1 = kate.ratings.create(performance_id: p.id, value: 5)
katerate2 = kate.ratings.create(performance_id: c.id, value: 3)

# feedbacks
tomqrit = tom.feedbacks.create(rating_id: tomrate.id, description: 'This play was pretty great, but the lighting and sound was off. B for effort')
kateqritone = kate.feedbacks.create(rating_id: katerate1.id, description: 'Pythons are now my best friends! Thanks, guys!')

# votes
tom.votes.create(feedback_id: kateqritone.id, value: 1)
kate.votes.create(feedback_id: tomqrit.id, value: -1)
