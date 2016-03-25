#create Users

5.times do
  user = User.new(
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name 
  )
  user.skip_confirmation!
  user.save!
end

unless User.find_by(email: 'admin@example.com')
  admin = User.new(
    email:      'admin@example.com',
    password:   'helloworld',
    first_name: 'Admin',
    last_name: 'Example'
  )
  admin.skip_confirmation!
  admin.save!
end 

users = User.all
30.times do 
  Topic.create!(
    title: Faker::Lorem.sentence,
    user:  users.sample
  )
end

topics = Topic.all
100.times do 
  Bookmark.create!(
    url: Faker::Internet.url,
    topic: topics.sample
  )
end

puts "#{User.count} users have been created."
puts "#{Topic.count} topics have been created."
puts "#{Bookmark.count} bookmarks have been created."
puts "Seeding finished."
