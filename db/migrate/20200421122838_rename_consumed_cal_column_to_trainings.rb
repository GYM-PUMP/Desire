class RenameconsumptionCalColumnToTrainings < ActiveRecord::Migration[5.2]
  def change
  	rename_column :trainings, :consumed_cal, :consumption_cal
  end
end
