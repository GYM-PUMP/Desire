class AddDefaultToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :users, :height,from: nil, to: 0
  	change_column_default :users, :age,from: nil, to: 0
  	change_column_default :users, :weight,from: nil, to: 0

  	change_column_null :users, :height, false
  	change_column_null :users, :age, false
  	change_column_null :users, :weight, false
  end
end
