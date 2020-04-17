class CreateMyMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :my_menus do |t|
    	t.integer :user_id
		t.integer :training_id
		t.integer :food_id
		t.integer :food_quantity
		t.integer :training_quantity
        t.timestamps
    end
  end
end
