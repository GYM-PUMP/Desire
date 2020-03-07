class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
	  t.integer :user_id
	  t.integer :gym_id
	  t.integer :supplement_id
	  t.text :body
	  t.float :rate
	  t.timestamps
    end
  end
end
