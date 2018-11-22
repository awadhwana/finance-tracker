# User
class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @ustocks = current_user.stocks
  end

  def friends
    @friends = current_user.friends
  end

  def show
    @user = User.find(params[:id])
    @ustocks = @user.stocks
  end
end
