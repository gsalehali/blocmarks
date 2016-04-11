class RegistrationMailer < ApplicationMailer
  default from: "youremail.com"

  def welcome(user, token, password)

    headers["Message-ID"] = "<users/#{user.id}@your-app-name.example>"
 
    @user = user
    @password = password
    @token = token

    puts "user: '#{@user}', password: '#{@password}', token: '#{@token}' "

    mail(to: user.email, subject: "welcome to Blocmarks")
  end

end