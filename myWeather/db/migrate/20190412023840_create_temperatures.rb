class CreateTemperatures < ActiveRecord::Migration[5.2]
  def change
    create_table :temperatures do |t|
      t.date :date
      t.integer :temp

      t.timestamps
    end
  end
end
