class AddLimitIngestionCalToDailyCals < ActiveRecord::Migration[5.2]
  def change
    add_column :daily_cals, :limit_ingestion_cal, :integer
    add_column :daily_cals, :limit_protein, :integer
    add_column :daily_cals, :limit_fat, :integer
    add_column :daily_cals, :limit_carb, :integer
  end
end
