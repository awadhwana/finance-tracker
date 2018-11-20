# user stock controller
class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by_ticker(params[:ticker])
    if stock.blank?
      stock = Stock.new_from_lookup(params[:ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] = "Stock #{@user_stock.stock.name}
                      was successfully added to portfolio"
  end

  def destroy
    @stock = current_user.user_stocks.find_by_stock_id(params[:id])
    @stock.destroy
    redirect_to my_portfolio_path
  end
end


#<UserStock id: 43, user_id: 1, stock_id: 3, created_at: "2018-11-20 11:03:29", updated_at: "2018-11-20 11:03:29">, #<UserStock id: 39, user_id: 1, stock_id: 6, created_at: "2018-11-20 10:52:00", updated_at: "2018-11-20 10:52:00">, #<UserStock id: 40, user_id: 1, stock_id:16, created_at: "2018-11-20 10:55:48", updated_at: "2018-11-20 10:55:48">, #<UserStock id: 44, user_id: 1, stock_id: 19, created_at: "2018-11-20 11:05:08", updated_at: "2018-11-20 11:05:08">, #<UserStock id: 45, user_id: 1, stock_id: 20, created_at: "2018-11-20 11:09:02", updated_at: "2018-11-20 11:09:02">]>