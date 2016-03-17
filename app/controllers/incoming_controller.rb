class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    puts "INCOMING PARAMS HERE: #{params}"

    # You put the message-splitting and business
    # magic here.
    @user = User.find_by_email(params[:sender])
    @topic = @user.nil? ? nil : Topic.find_by_title(params[:subject])
    @url = params["body-plain"]

    if @user.nil?
      @user = user.new(
        email: params[:sender],
        password: params[:sender],
        password_confirmation: params[:sender]
      )
      @user.skip_confirmation!
      @user.save
    end

    if @topic.nil?
      @topic = @user.topic = Topic.new(
        title: params[:subject]
      )
      @topic.save
    end

    @bookmark = @topic.bookmarks.build(url: @url)
    @bookmark.save

    # Assuming all went well.
    head 200
  end
end