#create Users

5.times do
  user = User.new(
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

unless User.find_by(email: 'admin@example.com')
  admin = User.new(
    email:      'admin@example.com',
    password:   'helloworld',
  )
  admin.skip_confirmation!
  admin.save!
end 

users = User.all
puts "#{User.count} users have been persisted."

puts "Seeding finished"