class UsersController < ApplicationController
def feed
  @users = User.all
  @photos = Photo.all
  @selected_username = params.fetch("name")
  @selected_userid = User.find_by(username: @selected_username)&.id
  @follow_requests =FollowRequest.all
  @following = FollowRequest.where(sender_id: @selected_userid, status: "accepted")

  @feed_photos = Photo.where(owner_id: @following.pluck(:recipient_id))

    render({ :template => "user/feed" })
end
end
