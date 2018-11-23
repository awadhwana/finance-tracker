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

  def searchu
    @result = User.where(['email LIKE ? or last_name LIKE ? or first_name LIKE ?',
                          "%#{params[:user]}%", "%#{params[:user]}%",
                          "%#{params[:user]}%"]).where.not(id: current_user.id).uniq

    @my_friends = current_user.friends.pluck(:id)
    flash.now[:danger] = 'no match found' if @result.blank?
  end
end
