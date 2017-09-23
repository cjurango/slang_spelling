class RenameExersicesToExercises < ActiveRecord::Migration
  def change
    remove_index :exersices, :answer_id
    remove_index :exersices, :word_id
    rename_table :exersices, :exercises
    add_index :exercises, :answer_id
    add_index :exercises, :word_id
  end
end
