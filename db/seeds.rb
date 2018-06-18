require 'random_data'
require 'faker'

10.times do
    User.create!(
        email: Faker::Internet.unique.email,
        password: Faker::Number.number(6)
    )
end
users = User.all

20.times do
    Wiki.create!(
        title: Faker::String.random(5..10),
        body: Faker::String.random(20..40),
        user: users.sample
    )
end
wikis = Wiki.all

admin = User.create!(
    email: 'dcschreck@hotmail.com',
    password: 'password',
    role: 'admin'
)

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
