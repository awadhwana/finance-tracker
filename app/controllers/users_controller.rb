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
                          "%#{params[:user]}%"]).uniq
    @result = @result.take(10)
    if @result.blank?
      flash.now[:danger] = 'no match found'
    end
  end
end
# Post.where(a).where(b).or(Post.where(c))
# || "last_name LIKE ?", "%#{params[:user]}%" || "first_name LIKE ?", "%#{params[:user]}%"
#User.find_by_sql(["select * from users where email = 'deepak' OR first_name='deepak' OR  last_name='deepak'"])
# select * from users where email = 'deepak' OR first_name='deepak' OR last_name='deepak'
# @result = User.where(["email LIKE ? or last_name LIKE ?", "%#{params[:user]}%", "%#{params[:user]}%"])