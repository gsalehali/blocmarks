# Admin User
user = User.new(
  username: "Admin User", 
  email:    "admin@example.com",
  password: "helloworld",
  )
user.skip_confirmation!
user.save!

puts "Seed finished"
puts "#{User.count} users created"