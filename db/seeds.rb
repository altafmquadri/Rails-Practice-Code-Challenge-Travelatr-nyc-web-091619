# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Destination.destroy_all
Blogger.destroy_all
Post.destroy_all 

30.times do 
  Destination.create({
    name: Faker::GameOfThrones.city,
    country: Faker::Address.country
  })
end


10.times do
  blogger = Blogger.create({
    name: Faker::Name.name,
    bio: Faker::Hipster.paragraph,
    age: (13..100).to_a.sample
  })

  (2..6).to_a.sample.times do 
    Post.create({
      title: Faker::Hipster.sentence(3),
      content: Faker::Hipster.paragraphs(4),
      likes: 0,
      blogger: blogger,
      destination: Destination.all.sample
    })
  end
end

blogger1 = Blogger.create(name: "jack", age: 26, bio: "im a blogger :( ")
dest1 = Destination.create(name: "Beirut", country: "Lebanon")
post1 = Post.create(title: "jack post", content: "inert content here", likes: 25, blogger: blogger1, destination: dest1 )
post1 = Post.create(title: "jacks 5 likes", content: "5 likes", likes: 5, blogger: blogger1, destination: dest1 )
blogger2 = Blogger.create(name: "ryan", age: 40, bio: "im not a blogger :) ")
post1 = Post.create(title: " 50 likes", content: "50 likes", likes: 50, blogger: blogger2, destination: dest1 )
