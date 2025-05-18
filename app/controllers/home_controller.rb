class HomeController < ApplicationController
  def index
    @users = User.all
      render({ :template => "home/index" })
  end



end
