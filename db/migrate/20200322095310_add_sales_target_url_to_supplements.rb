class AddSalesTargetUrlToSupplements < ActiveRecord::Migration[5.2]
  def change
    add_column :supplements, :sales_target_url, :text
  end
end
