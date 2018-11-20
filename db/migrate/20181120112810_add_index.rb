class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :user_stocks, %i[user_id stock_id], unique: true
  end
end
