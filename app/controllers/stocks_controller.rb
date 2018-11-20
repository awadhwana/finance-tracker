# stocks controler
class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:danger] = 'Stock name cannot be empty'
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = 'Invalid name' unless @stock
    end
    render 'users/search'
  end
end
