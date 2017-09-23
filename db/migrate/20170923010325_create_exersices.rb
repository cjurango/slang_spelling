class CreateExersices < ActiveRecord::Migration
  def change
    create_table :exersices do |t|
      t.boolean :started
      t.boolean :finished
      t.string :type, :default => "spelling"

      t.timestamps
    end
  end
end
