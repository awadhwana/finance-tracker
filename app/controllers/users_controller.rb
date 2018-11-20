# User
class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @ustocks = @user.stocks
  end
end
