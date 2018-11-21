# User
class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @ustocks = current_user.stocks
  end

  def friends
    @friendships = current_user.friends
  end
end
