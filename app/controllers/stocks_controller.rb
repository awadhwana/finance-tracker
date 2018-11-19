# stocks controler
class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash[:danger] = 'Stock name cannot be empty'
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash[:danger] = 'Invalid name' unless @stock
    end
    render 'users/search'
  end
end
  