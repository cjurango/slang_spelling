class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :complete_word
      t.string :audio_source
      t.string :letter_pool, :array => true

      t.timestamps
    end
  end
end
