class RemoveResultCalFromDailyCals < ActiveRecord::Migration[5.2]
  def change
    remove_column :daily_cals, :result_cal, :integer
  end
end
