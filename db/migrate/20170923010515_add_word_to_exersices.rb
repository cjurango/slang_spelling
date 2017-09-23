class AddWordToExersices < ActiveRecord::Migration
  def change
    add_reference :exersices, :word, index: true, foreign_key: true
  end
end
