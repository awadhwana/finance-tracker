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
    if params[:user].blank?
      flash.now[:danger] = 'You entered empty search string'
    else
      @my_friends = current_user.friends.pluck(:id)
      @result = User.where(['email LIKE ? or last_name LIKE ? or first_name LIKE ?',
                          "%#{params[:user]}%", "%#{params[:user]}%",
                          "%#{params[:user]}%"]).where.not(id: current_user.id).uniq
      flash.now[:danger] = 'No match found' if @result.empty?
    end
  end
  respond_to do |format|
    format.js { render partial: 'user/user_results' }
  end
end
