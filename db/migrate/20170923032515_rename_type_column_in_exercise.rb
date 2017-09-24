class RenameTypeColumnInExercise < ActiveRecord::Migration
  def change
    rename_column :exercises, :type, :category
  end
end
