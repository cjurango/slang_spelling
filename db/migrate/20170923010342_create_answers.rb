class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer_word
      t.boolean :accurate

      t.timestamps
    end
  end
end
