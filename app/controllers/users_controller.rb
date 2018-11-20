# User
class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @ustocks = current_user.stocks
  end
end
