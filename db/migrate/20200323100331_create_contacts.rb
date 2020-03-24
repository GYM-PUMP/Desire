class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.text :message

      t.timestamps
    end
  end
  	  remove_column :users, :message, :text
end
