class HomeController < ApplicationController
  def index
    @users = User.all
      render({ :template => "home/index" })
  end

  def user_details
    @users = User.all
    @photos = Photo.all
    @selected_username = params.fetch("name")
    @selected_userid = User.find_by(username: @selected_username)&.id
    @follow_requests =FollowRequest.all
      render({ :template => "home/user_details" })
  end


end
