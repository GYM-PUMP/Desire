class AddReplyToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :reply, :text
    add_column :contacts, :title, :string
  end
end
