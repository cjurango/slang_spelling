class ChangeDefaultValuesInExcercise < ActiveRecord::Migration
  def change
    change_column_default(:exercises, :started, false)
    change_column_default(:exercises, :finished, false)
  end
end
