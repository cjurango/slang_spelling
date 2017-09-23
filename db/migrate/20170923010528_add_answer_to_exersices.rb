class AddAnswerToExersices < ActiveRecord::Migration
  def change
    add_reference :exersices, :answer, index: true, foreign_key: true
  end
end
