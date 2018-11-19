# stocks controler
class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock.present?
        render 'users/my_portfolio'
      else
        flash[:danger] = 'Invalid name'
        redirect_to my_portfolio_url
      end
    else
      flash[:danger] = 'Stock name cannot be empty'
      redirect_to my_portfolio_url
    end
  end
end
